/**
 * This driver module supports the CSI-2 (csi40) in Renesas RCar SoCs.
 * It providies an UIO devices in /dev. 
 * The struct uio_csi2_platform_data contains
 * the uio_info for the CSI-2.
 * The has to be defined in the Device Tree using the following structure
    csi40: csi2@feaa0000 {
        compatible = "renesas, r8a77980-csi2";
        reg = <0 0xfeaa0000 0 0x10000>
        interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
        clocks = <&cpg CPG_MOD 716>;
        power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
    };
 */

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/clk.h>
#include <linux/dma-mapping.h>
#include <linux/platform_device.h>
#include <linux/uio_driver.h>
#include <linux/io.h>
#include <linux/irq.h>
#include <linux/irqdomain.h>
#include <linux/pm_runtime.h>

#include <linux/of.h>
#include <linux/of_irq.h>


/* CSI-2 internals */
#define CSI2_INTERNAL_REG_SIZE    (0x10000)
#define RCAR_CSI2_INTEN		     (0x30)
#define RCAR_CSI2_INTCLOSE           (0x34)
#define RCAR_CSI2_INTSTATE           (0x38)
#define RCAR_CSI2_INTERRSTATE        (0x3C)


/* CSI2 uio driver name */
#define DRIVER_NAME "uio_csi2"
#define DRIVER_VERSION "0.1"

/* Platform data for CSI-2 */
struct uio_csi2_platform_data
{
    struct platform_device *pdev;
    struct uio_info        *uio_info;
    struct clk             *csi2_clock;
    spinlock_t              csi2_lock;
    unsigned long           csi2_flags;
    void __iomem            *base_addr;
};

/* CSI-2 function prototypes */
static int csi2_probe(struct platform_device *pdev, struct uio_csi2_platform_data * const priv);
static int csi2_open(struct uio_info *uio_info, struct inode *inode);
static int csi2_close(struct uio_info *uio_info, struct inode *inode);
static irqreturn_t csi2_irq_handler(int irq, struct uio_info *uio_info);

/* Common functions for CSI-2 */
static int irq_control(struct uio_info *uio_info, s32 irq_on);

static inline u32 read_reg(void * const base, const u32 offset)
{
    return ioread32((u8 *)base + offset);
}

static inline void write_reg(void * const base, const u32 offset, const u32 val)
{
    iowrite32(val, (u8 *)base + offset);
}

/* Function definitions */
static int csi2_probe(struct platform_device *pdev, struct uio_csi2_platform_data * const priv)
{
    struct uio_info *uio_info;
    struct uio_mem  *uio_mem;
    struct resource *res;
    int err;
    struct device *dev = &pdev->dev;

    /* Construct the uio_info structure */
    uio_info = devm_kzalloc(dev, sizeof(*uio_info), GFP_KERNEL);
    if (!uio_info)
        return -ENOMEM;
    uio_info->version = DRIVER_VERSION;
    uio_info->open = csi2_open;
    uio_info->release = csi2_close;
    uio_info->name = pdev->name; //pdev->dev.of_node->name; => csi2 only

    /* Set up memory resource */
    uio_mem = &uio_info->mem[0];
    res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
    if (!res) {
        dev_err(dev, "failed to get CSI-2 memory\n");
        return -EINVAL;
    }
    uio_mem->memtype = UIO_MEM_PHYS;
    uio_mem->addr = res->start;
    uio_mem->size = resource_size(res);
    uio_mem->name = res->name;
    if (!devm_request_mem_region(dev, res->start, resource_size(res), uio_info->name)) {
        dev_err(dev, "failed to reserve CSI-2 memory\n");
        return -ENOMEM;
    }
    priv->base_addr = devm_ioremap_nocache(dev, res->start, resource_size(res));
    if (!priv->base_addr) {
        dev_err(dev, "failed to map ISP memory\n");
        return -EIO;
    }

    /* Set up interrupt */
    write_reg(priv->base_addr, RCAR_CSI2_INTEN, 0x00000000); // currently all Ints disabled 
    write_reg(priv->base_addr, RCAR_CSI2_INTCLOSE, 0xffffffff); // currently all Ints masked

    uio_info->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
    if (uio_info->irq == -ENXIO) {
        dev_err(dev, "failed to parse CSI-2 interrupt\n");
        return -EINVAL;
    }
    uio_info->handler = csi2_irq_handler;
    uio_info->irqcontrol = irq_control;

    /* Set up clock */
    priv->csi2_clock = devm_clk_get(dev, NULL);
    if (IS_ERR(priv->csi2_clock)) {
        dev_err(dev, "failed to get CSI-2 clock info\n");
        return -ENODEV;
    }

    /* Register the uio_info with the platform data */
    uio_info->priv = priv;
    priv->uio_info = uio_info;
    spin_lock_init(&priv->csi2_lock);
    priv->csi2_flags = 1;        /* CSI-2 interrupt is active */

    /* Register the UIO device */
    if ((err = uio_register_device(dev, uio_info))) {
        dev_err(dev, "failed to register UIO device for CSI-2\n");
        return err;
    }

    /* Register the UIO device with the PM framework */
    pm_runtime_enable(dev);

    /* Enable clocks */
    if ((err = clk_prepare_enable(priv->csi2_clock))) {
        dev_err(dev, "failed to enable clock\n");
        return -EBUSY;
    }

    /* Print some information */
    dev_dbg(dev, "CSI-2 irq %ld clock %ld Hz\n", uio_info->irq, clk_get_rate(priv->csi2_clock));

    return 0;
}

static int csi2_open(struct uio_info *uio_info, __attribute__((unused)) struct inode *inode)
{
    struct uio_csi2_platform_data *priv = uio_info->priv;

    dev_dbg(&priv->pdev->dev, "csi-2 open\n");
    /* Wait until the PM has woken up the device */
    pm_runtime_get_sync(&priv->pdev->dev);

    if (!test_and_set_bit(0, &priv->csi2_flags))
        enable_irq((unsigned int)uio_info->irq);

    return 0;
}

static int csi2_close(struct uio_info *uio_info, __attribute__((unused)) struct inode *inode)
{
    struct uio_csi2_platform_data *priv = uio_info->priv;

    dev_dbg(&priv->pdev->dev, "csi-2 close\n");
    /* Tell the PM that the device has become idle */
    pm_runtime_put_sync(&priv->pdev->dev);

    if (test_and_clear_bit(0, &priv->csi2_flags))
        disable_irq((unsigned int)uio_info->irq);

    return 0;
}

static irqreturn_t csi2_irq_handler(int irq, struct uio_info *uio_info)
{
    struct uio_csi2_platform_data *priv = uio_info->priv;
    u32 int_status;
    u32 interr_status;

    /* Mask all interrupts, umask by user process */
    write_reg(priv->base_addr, RCAR_CSI2_INTCLOSE, 0xffffffff);

    int_status = read_reg(priv->base_addr, RCAR_CSI2_INTSTATE);
    interr_status = read_reg(priv->base_addr, RCAR_CSI2_INTERRSTATE);

    if (!(int_status | interr_status)) {
        return IRQ_NONE;
    }

    return IRQ_HANDLED;
}

static int irq_control(struct uio_info *uio_info, s32 irq_on)
{
    struct uio_csi2_platform_data *const priv = uio_info->priv;
    unsigned long flag;

    if (uio_info == priv->uio_info) {
        dev_dbg(&priv->pdev->dev, "CSI-2 irq_control\n");
        
	spin_lock_irqsave(&priv->csi2_lock, flag);
        if (irq_on) {
            if (!test_and_set_bit(0, &priv->csi2_flags))    {
                enable_irq((unsigned int)uio_info->irq);
            }
        }
        else {
            if (test_and_clear_bit(0, &priv->csi2_flags)) {
                disable_irq((unsigned int)uio_info->irq);
            }
        }
        spin_unlock_irqrestore(&priv->csi2_lock, flag);
    }
    return 0;
}

static int uio_csi2_probe(struct platform_device *pdev)
{
    struct uio_csi2_platform_data *priv;
    int err;

    /* Allocate memory for the common housekeeping structure */
    priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
    if (!priv)
        return -ENOMEM;
    priv->pdev = pdev;

    if ((err = csi2_probe(pdev, priv)))
        return err;

    platform_set_drvdata(pdev, priv);

    return 0;
}

static int uio_csi2_remove(struct platform_device *pdev)
{
    struct uio_csi2_platform_data *priv = platform_get_drvdata(pdev);

    write_reg(priv->base_addr, RCAR_CSI2_INTEN, 0x00000000); // currently all Ints disabled 
    write_reg(priv->base_addr, RCAR_CSI2_INTCLOSE, 0xffffffff); // currently all Ints masked

    clk_disable_unprepare(priv->csi2_clock);
    pm_runtime_disable(&priv->pdev->dev);
    
    uio_unregister_device(priv->uio_info);

    platform_set_drvdata(pdev, NULL);

    return 0;
}

/* Power management */
static int uio_runtime_csi2_nop(__attribute__((unused)) struct device *dev)
{
    return 0;
};

static const struct dev_pm_ops uio_dev_pm_csi2_ops =
{
    .runtime_suspend = &uio_runtime_csi2_nop,
    .runtime_resume = &uio_runtime_csi2_nop,
};

/* Compatible table */
static const struct of_device_id rcar_csi2_dt_ids[] =
{
    { .compatible = "renesas,r8a77970-csi2", .data = 0 },
    { .compatible = "renesas,r8a77980-csi2", .data = 0 },
    {},
};
MODULE_DEVICE_TABLE(of, rcar_csi2_dt_ids);

/* Platform driver structure */
static struct platform_driver uio_csi2_platform_driver =
{
    .probe = &uio_csi2_probe,
    .remove = &uio_csi2_remove,
    .driver =
    {
        .name = DRIVER_NAME,
        .owner = THIS_MODULE,
        .pm = &uio_dev_pm_csi2_ops,
        .of_match_table = of_match_ptr(rcar_csi2_dt_ids)
    }
};
module_platform_driver(uio_csi2_platform_driver);

MODULE_AUTHOR("Renesas Electronics Corporation");
MODULE_DESCRIPTION("Userspace I/O driver for CSI-2");
MODULE_LICENSE("Dual MIT/GPL");
MODULE_ALIAS("platform:" DRIVER_NAME);
