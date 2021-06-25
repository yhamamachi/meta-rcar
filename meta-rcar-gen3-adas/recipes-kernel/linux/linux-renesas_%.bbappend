FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

COMPATIBLE_MACHINE_eagle = "eagle"
COMPATIBLE_MACHINE_v3msk = "v3msk"
COMPATIBLE_MACHINE_condor = "condor"
COMPATIBLE_MACHINE_v3hsk = "v3hsk"
COMPATIBLE_MACHINE_falcon = "falcon"

SRC_URI_append = " \
    ${@oe.utils.conditional("DISABLE_RPC_ACCESS", "1", "", " file://hyperflash.cfg", d)} \
    file://nvme.cfg \
    file://imr.cfg \
    file://disable-unused.cfg \
    file://enable.cfg \
    file://renesas.scc \
"

SRC_URI_append_h3ulcb = " file://ulcb.cfg"
SRC_URI_append_m3ulcb = " file://ulcb.cfg"
SRC_URI_append_m3nulcb = " file://ulcb.cfg"
SRC_URI_append_salvator-x = " file://salvator-x.cfg"

SRC_URI_append_rcar-gen3-v3x = " \
    file://v3x.cfg \
    file://cma.cfg \
    file://ipmmu.cfg \
    ${@oe.utils.conditional("DISABLE_RPC_ACCESS", "1", "", " file://qspi.cfg", d)} \
"

ULCB_KF_DTBO = " \
    renesas/ulcb-kf-panel-mitsubishi-aa104xd12-1024x768.dtbo \
    renesas/ulcb-kf-panel-mitsubishi-aa121td01-1280x800.dtbo \
    renesas/ulcb-kf-panel-koe-tx31d200vm0baa-1280x480.dtbo \
    renesas/ulcb-kf-cn10-gmsl2.dtbo \
    renesas/ulcb-kf-cn10-pca.dtbo \
    renesas/ulcb-kf-cn11.dtbo \
    renesas/ulcb-kf-cn11-gmsl2.dtbo \
    renesas/ulcb-kf-cn11-pca.dtbo \
    renesas/ulcb-kf-most.dtbo \
    renesas/ulcb-kf-sd3.dtbo \
    renesas/ulcb-kf-imx219.dtbo \
"

KERNEL_DEVICETREE_append_h3ulcb = " \
    renesas/r8a7795-es1-h3ulcb-kf.dtb \
    renesas/r8a7795-h3ulcb-kf.dtb \
    renesas/r8a7795-h3ulcb-4x2g-kf.dtb \
    ${ULCB_KF_DTBO} \
"

KERNEL_DEVICETREE_append_m3ulcb = " \
    renesas/r8a7796-m3ulcb-kf.dtb \
    renesas/r8a7796-m3ulcb-2x4g-kf.dtb \
    ${ULCB_KF_DTBO} \
"

KERNEL_DEVICETREE_append_m3nulcb = " \
    renesas/r8a77965-m3nulcb-kf.dtb \
    ${ULCB_KF_DTBO} \
"

KERNEL_DEVICETREE_append_r8a77970 = " \
    renesas/r8a77970-es1-eagle.dtb \
    renesas/r8a77970-es1-eagle-function.dtb \
    renesas/r8a77970-es1-v3msk-vbm-v2.dtb \
    renesas/r8a77970-es1-v3msk-vbm-v3.dtb \
    renesas/r8a77970-es1-v3msk-vbm.dtb \
    renesas/r8a77970-es1-v3msk-view.dtb \
    renesas/r8a77970-eagle-function.dtb \
    renesas/r8a77970-v3msk-vbm-v2.dtb \
    renesas/r8a77970-v3msk-vbm-v3.dtb \
    renesas/r8a77970-v3msk-vbm.dtb \
    renesas/r8a77970-v3msk-view.dtb \
"

KERNEL_DEVICETREE_append_r8a77980 = " \
    renesas/r8a77980-v3hsk-vb-4ch.dtb \
    renesas/r8a77980-v3hsk-vb-8ch.dtb \
    renesas/r8a77980-v3hsk-vb-gmsl-8ch.dtb \
    renesas/r8a77980-v3hsk-vb-gmsl2-2x2.dtb \
    renesas/r8a77980-v3hsk-vb-gmsl2-4.dtb \
    renesas/r8a77980-v3hsk-vb-gmsl2-8.dtb \
    renesas/r8a77980-es2-v3hsk-vb-4ch.dtb \
    renesas/r8a77980-es2-v3hsk-vb-8ch.dtb \
    renesas/r8a77980-es2-v3hsk-vb-gmsl-8ch.dtb \
    renesas/r8a77980-es2-v3hsk-vb-gmsl2-2x2.dtb \
    renesas/r8a77980-es2-v3hsk-vb-gmsl2-4.dtb \
    renesas/r8a77980-es2-v3hsk-vb-gmsl2-8.dtb \
"

# Prefer generic-uio driver over kernel drivers
#KERNEL_MODULE_PROBECONF_append = " rcar_imr"
#KERNEL_MODULE_PROBECONF_append = " rcar_csi2"
#KERNEL_MODULE_PROBECONF_append = " rcar_vin"
#KERNEL_MODULE_PROBECONF_append = " vsp1"
#KERNEL_MODULE_PROBECONF_append = " rcar-du-drm"
#KERNEL_MODULE_PROBECONF_append = " rcar_lvds"
#module_conf_rcar_imr = "blacklist rcar_imr"
#module_conf_rcar_csi2 = "blacklist rcar_csi2"
#module_conf_rcar_vin = "blacklist rcar_vin"
#module_conf_vsp1 = "blacklist vsp1"
#module_conf_rcar-du-drm = "blacklist rcar-du-drm"
#module_conf_rcar_lvds = "blacklist rcar_lvds"
