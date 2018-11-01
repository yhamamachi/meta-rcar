FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

COMPATIBLE_MACHINE_eagle = "eagle"
COMPATIBLE_MACHINE_v3msk = "v3msk"
COMPATIBLE_MACHINE_condor = "condor"
COMPATIBLE_MACHINE_v3mzf = "v3mzf"
COMPATIBLE_MACHINE_v3hsk = "v3hsk"
COMPATIBLE_MACHINE_m3nulcb = "m3nulcb"

SRC_URI_append = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'h3ulcb-had', ' file://hyperflash.cfg', '', d)} \
    ${@oe.utils.conditional("SDHI_SEQ", "1", " file://sdhi_seq.cfg", "", d)} \
    file://0001-spi-sh-msiof-fixes.patch \
    file://0002-spi-spidev-add-spi-gpio-into-spidev.patch \
    file://0003-spi-spi-gpio-fix-CPOL-mode.patch \
    file://0006-spi-spi-gpio-fix-set-CPOL-default-inverted.patch \
    file://0008-Revert-PCI-rcar-pcie-Add-bus-notifier-so-we-can-limi.patch \
    file://0009-arm64-dma-check-parent-bus-restrictions-in-dma_capab.patch \
    file://0010-can-rcar_can-add-enable-and-standby-control-pins.patch \
    file://0011-can-rcar_canfd-add-enable-and-standby-control-pins.patch \
    file://0012-mtd-Add-RPC-HyperFlash-driver.patch \
    file://0013-IMR-driver-interim-patch.patch \
    file://0015-gpio-max732x-fix-gpio-set.patch \
    file://0016-gpio-gpiolib-suppress-gpiod-warning.patch \
    file://0017-media-soc_camera-add-legacy-VIN-CSI2.patch \
    file://0019-Revert-media-v4l2-async-remove-unneeded-.registered_.patch \
    file://0020-ti-st-add-device-tree-support.patch \
    file://0021-btwilink-add-minimal-device-tree-support.patch \
    file://0022-ASoC-Modify-check-condition-of-multiple-bindings-of-.patch \
    file://0023-ASoC-add-dummy-Si468x-driver.patch \
    file://0024-wl18xx-do-not-invert-IRQ-on-WLxxxx-side.patch \
    file://0025-drm-adv7511-Enable-HPD-interrupts-to-support-hotplug.patch \
    file://0026-drm-adv7511-add-polling-mode-when-no-irq-available.patch \
    file://0027-gpu-drm-bridge-adv7511-Add-interlaced-mode-support.patch \
    file://0030-Gen3-LVDS-cameras.patch \
    file://0031-media-i2c-Add-ov5647-sensor.patch \
    file://0032-media-i2c-Add-ov5642-sensor.patch \
    file://0033-media-soc-camera-fix-parallel-i-f-in-VIN.patch \
    file://0034-media-soc_camera-Fix-VIDIOC_S_SELECTION-ioctl-miscal.patch \
    file://0035-ARM64-renesas-dts-add-m3nulcb-board-support.patch \
    file://0036-Add-MOST-support-for-r8a77965.patch \
    file://0037-media-soc_camera-rcar_vin-Fix-VnCSI_IFMD-settings.patch \
    file://0038-media-soc_camera-rcar_vin-Add-R-Car-M3N-support.patch \
    file://0039-media-soc_camera-rcar_csi2-Add-R-Car-M3N-support.patch \
    file://0040-arm64-dts-renesas-add-ADAS-boards.patch \
    file://0042-arm64-dts-renesas-r8a7795-es1-h3ulcb-disable-eMMC.patch \
    file://0043-pinctrl-sh-pfc-pfc-r8a77965-Add-missing-avb_mii-pin-.patch \
    file://0044-pinctrl-r8a779x-add-mlb-pinmux.patch \
    file://0045-clk-r8a779x-add-mlp-clock.patch \
    file://0046-arm64-dts-renesas-r8a779x-add-mlp-nodes.patch \
    ${@oe.utils.conditional("KF_ENABLE_SD3", "1", " file://0047-arm64-dts-renesas-ulcb-kf-enable-sd3.patch", "", d)} \
    ${@oe.utils.conditional("KF_ENABLE_MOST", "1", " file://0048-arm64-dts-renesas-ulcb-kf-enable-most.patch", "", d)} \
    file://0049-clk-r8a779x-add-IMP-clock.patch \
    file://0050-arm64-dts-renesas-r8a779x-add-IMP-nodes.patch \
    file://0062-IIO-lsm9ds0-add-IMU-driver.patch \
    file://0063-ASoC-PCM3168A-add-TDM-modes-merge-ADC-and-DAC.patch \
    file://0066-pci-pcie-rcar-add-regulators-support.patch \
    file://0067-ti-st-use-proper-way-to-get-shutdown-gpio.patch \
    file://0068-drm-adv7511-use-smbus-to-retrieve-edid.patch \
    file://0071-ASoC-add-dummy-device-for-WL18xx-PCM-audio.patch \
    file://0072-usb-hub-disable-autosuspend-for-SMSC-hubs.patch \
    file://0073-MOST-dim2-add-device-tree-support.patch \
    file://0074-MOST-dim2-add-R-Car3-related-initialization.patch \
    file://0075-MOST-core-fix-memory-allocation-at-arm64.patch \
    file://0076-MOST-dim2-Renesas-R-Car3-variant.patch \
    file://0077-MOST-dim2-add-timeouts.patch \
    file://0078-MOST-aim-fix-null-pointer-crash.patch \
    file://0079-Revert-dmaengine-rcar-dmac-use-TCRB-instead-of-TCR-f.patch \
    file://0110-mmc-tmio-Add-SDHI-SEQUENCER-support.patch \
    file://0111-mmc-renesas_sdhi-Add-SDHI-SEQUENCER-support.patch \
    file://0112-ARM64-dts-renesas-ulcb-Make-AK4613-sound-device-name.patch \
    file://0113-arm64-dts-ulcb-kf-increase-SDIO-frequency-for-WLAN-c.patch \
    file://0114-Sony-IMX219-driver.patch \
    ${@oe.utils.conditional("KF_ENABLE_IMX219", "1", " file://0115-arm64-dts-renesas-ulcb-kf-enable-enable-IMX219.patch", "", d)} \
    file://0116-media-i2c-soc_camera-Fix-Bad-of_node_put-error.patch \
    file://4.19/0001-ARM64-dts-Remove-conflicting-with-mainline-V3M-and-V.patch \
    file://4.19/0002-iommu-msm-Claim-bus-ops-on-probe.patch \
    file://4.19/0003-iommu-Clean-up-of_iommu_init_fn.patch \
    file://4.19/0004-iommu-ipmmu-vmsa-Hook-up-r8a779-70-95-DT-matching-co.patch \
    file://4.19/0005-soc-renesas-identify-R-Car-V3H.patch \
    file://4.19/0006-i2c-rcar-document-R8A77970-bindings.patch \
    file://4.19/0007-dt-bindings-irqchip-renesas-irqc-Document-R-Car-M3-W.patch \
    file://4.19/0008-gpio-rcar-document-R8A77970-bindings.patch \
    file://4.19/0009-dt-bindings-net-sh_eth-add-R-Car-Gen-12-fallback-com.patch \
    file://4.19/0010-net-sh_eth-rename-name-structures-as-rcar_gen-12-_.patch \
    file://4.19/0011-net-sh_eth-implement-R-Car-Gen-12-fallback-compatibi.patch \
    file://4.19/0012-arm64-dts-renesas-r8a77970-sort-includes.patch \
    file://4.19/0013-arm64-dts-renesas-r8a77970-Add-IPMMU-device-nodes.patch \
    file://4.19/0014-arm64-dts-renesas-r8a77970-Tie-SYS-DMAC-to-IPMMU-DS1.patch \
    file://4.19/0015-arm64-dts-renesas-r8a77970-Connect-Ethernet-AVB-to-I.patch \
    file://4.19/0016-arm64-dts-renesas-r8a77970-Enable-IPMMU-DS1-RT-and-M.patch \
    file://4.19/0017-pinctrl-sh-pfc-Add-PORT_GP_CFG_-6-22-helper-macros.patch \
    file://4.19/0018-gpio-pca953x-fix-vendor-prefix-for-PCA9654.patch \
    file://4.19/0019-arm64-dts-renesas-initial-V3MSK-board-device-tree.patch \
    file://4.19/0020-arm64-dts-renesas-v3msk-add-EtherAVB-support.patch \
    file://4.19/0021-arm64-dts-renesas-r8a77970-use-CPG-core-clock-macros.patch \
    file://4.19/0022-arm64-dts-renesas-r8a77970-use-SYSC-power-domain-mac.patch \
    file://4.19/0023-pinctrl-sh-pfc-Add-R8A77970-PFC-support.patch \
    file://4.19/0024-net-sh_eth-use-correct-struct-device-when-calling-DM.patch \
    file://4.19/0025-net-sh_eth-don-t-use-NULL-as-struct-device-for-the-D.patch \
    file://4.19/0026-clk-renesas-r8a77970-Add-LVDS-clock.patch \
    file://4.19/0027-net-sh_eth-do-not-advertise-Gigabit-capabilities-whe.patch \
    file://4.19/0028-dt-bindings-watchdog-renesas-wdt-Add-support-for-the.patch \
    file://4.19/0029-sh_eth-kill-redundant-check-in-the-probe-method.patch \
    file://4.19/0030-sh_eth-remove-sh_eth_plat_data-edmac_endian.patch \
    file://4.19/0031-sh_eth-fix-TXALCR1-offsets.patch \
    file://4.19/0032-sh_eth-fix-dumping-ARSTR.patch \
    file://4.19/0033-sh_eth-gather-all-TSU-init-code-in-one-place.patch \
    file://4.19/0034-sh_eth-get-Ether-port-only-when-needed.patch \
    file://4.19/0035-arm64-renesas_defconfig-enable-R8A77980-SoC.patch \
    file://4.19/0036-DT-dmaengine-renesas-rcar-dmac-document-R8A77980-sup.patch \
    file://4.19/0037-soc-renesas-rcar-rst-add-R8A77980-support.patch \
    file://4.19/0038-dt-bindings-arm-document-R8A77980-SoC-bindings.patch \
    file://4.19/0039-arm64-dts-renesas-r8a77970-move-node-which-has-no-re.patch \
    file://4.19/0040-arm64-add-Renesas-R8A77980-support.patch \
    file://4.19/0041-arm64-dts-renesas-initial-R8A77980-SoC-device-tree.patch \
    file://4.19/0042-arm64-dts-renesas-r8a77980-add-SYS-DMAC-support.patch \
    file://4.19/0043-arm64-dts-renesas-r8a77970-Remove-non-existing-STBE-.patch \
    file://4.19/0044-arm64-dts-renesas-r8a77995-Remove-non-existing-STBE-.patch \
    file://4.19/0045-arm64-dts-renesas-r8a77970-add-PFC-support.patch \
    file://4.19/0046-arm64-dts-renesas-eagle-add-SCIF0-pins.patch \
    file://4.19/0047-arm64-dts-renesas-r8a77970-add-GPIO-support.patch \
    file://4.19/0048-arm64-dts-renesas-eagle-specify-EtherAVB-PHY-IRQ.patch \
    file://4.19/0049-soc-renesas-r8a77970-sysc-fix-power-area-parents.patch \
    file://4.19/0050-sh_eth-simplify-sh_eth_check_reset.patch \
    file://4.19/0051-dt-bindings-power-add-R8A77980-SYSC-power-domain-def.patch \
    file://4.19/0052-soc-renesas-rcar-sysc-add-R8A77980-support.patch \
    file://4.19/0053-dt-bindings-arm-document-Condor-board-bindings.patch \
    file://4.19/0054-dt-bindings-clock-add-R8A77980-CPG-core-clock-defini.patch \
    file://4.19/0055-clk-renesas-cpg-mssr-add-R8A77980-support.patch \
    file://4.19/0056-arm64-dts-renesas-r8a77980-add-H-SCIF-support.patch \
    file://4.19/0057-arm64-dts-renesas-r8a77980-add-EtherAVB-support.patch \
    file://4.19/0058-arm64-dts-renesas-initial-Condor-board-device-tree.patch \
    file://4.19/0059-arm64-dts-renesas-condor-add-EtherAVB-support.patch \
    file://4.19/0060-media-v4l-vsp1-Fix-video-output-on-R8A77970.patch \
    file://4.19/0061-sh_eth-TSU_QTAG0-1-registers-the-same-as-TSU_QTAGM0-.patch \
    file://4.19/0062-sh_eth-fix-TSU-init-on-SH7734-R8A7740.patch \
    file://4.19/0063-DT-net-renesas-ravb-document-R8A77980-bindings.patch \
    file://4.19/0064-sh_eth-uninline-TSU-register-accessors.patch \
    file://4.19/0065-dt-bindings-arm-Document-Renesas-V3MSK-and-Wheat-boa.patch \
    file://4.19/0066-DT-serial-renesas-sci-serial-document-R8A77980-bindi.patch \
    file://4.19/0067-dt-bindings-display-renesas-du-Document-R8A77970-bin.patch \
    file://4.19/0068-drm-rcar-du-Add-R8A77970-support.patch \
    file://4.19/0069-pinctrl-sh-pfc-Add-PORT_GP_CFG_25-helper-macro.patch \
    file://4.19/0070-pinctrl-sh-pfc-Add-R8A77980-PFC-support.patch \
    file://4.19/0071-arm64-dts-renesas-eagle-Override-EtherAVB-phy-mode.patch \
    file://4.19/0072-arm64-dts-renesas-v3msk-Override-EtherAVB-phy-mode.patch \
    file://4.19/0073-arm64-dts-renesas-r8a77970-Set-EtherAVB-phy-mode-to-.patch \
    file://4.19/0074-arm64-dts-renesas-r8a77970-add-I2C-support.patch \
    file://4.19/0075-arm64-dts-renesas-eagle-add-I2C0-support.patch \
    file://4.19/0076-arm64-dts-renesas-r8a77970-sort-subnodes-of-root-nod.patch \
    file://4.19/0077-pinctrl-sh-pfc-r8a77970-Add-EtherAVB-pin-groups.patch \
    file://4.19/0078-arm64-dts-renesas-v3msk-add-SCIF0-pins.patch \
    file://4.19/0079-clk-renesas-cpg-mssr-Adjust-r8a77980-ifdef.patch \
    file://4.19/0080-pinctrl-sh-pfc-Add-SH_PFC_PIN_GROUP_ALIAS.patch \
    file://4.19/0081-sh_eth-add-sh_eth_cpu_data-soft_reset-method.patch \
    file://4.19/0082-sh_eth-add-sh_eth_cpu_data-edtrr_trns-value.patch \
    file://4.19/0083-sh_eth-add-sh_eth_cpu_data-xdfar_rw-flag.patch \
    file://4.19/0084-sh_eth-add-sh_eth_cpu_data-no_tx_cntrs-flag.patch \
    file://4.19/0085-sh_eth-add-sh_eth_cpu_data-cexcr-flag.patch \
    file://4.19/0086-sh_eth-add-sh_eth_cpu_data-no_xdfar-flag.patch \
    file://4.19/0087-sh_eth-kill-useless-check-in-__sh_eth_get_regs.patch \
    file://4.19/0088-clk-renesas-r8a77980-Correct-parent-clock-of-PCIEC0.patch \
    file://4.19/0089-arm64-dts-renesas-r8a77970-Update-IPMMU-DS1-bit-numb.patch \
    file://4.19/0090-arm64-dts-renesas-r8a77970-add-FCPVD-support.patch \
    file://4.19/0091-dt-bindings-display-bridge-Document-THC63LVD1024-LVD.patch \
    file://4.19/0092-drm-bridge-Add-thc63lvd1024-LVDS-decoder-driver.patch \
    file://4.19/0093-media-rcar-vin-enable-support-for-r8a77970.patch \
    file://4.19/0094-media-platform-rcar-vin-Convert-_rcar_info_r8a77970_.patch \
    file://4.19/0095-mmc-dt-tmio_mmc-document-R8A77980-bindings.patch \
    file://4.19/0096-mmc-renesas_sdhi_internal_dmac-add-R8A77980-to-white.patch \
    file://4.19/0097-DT-pci-rcar-pci-document-R8A77980-bindings.patch \
    file://4.19/0098-PCI-rcar-Add-R-Car-gen3-PHY-support.patch \
    file://4.19/0099-sh_eth-use-TSU-register-accessors-for-TSU_POST-n.patch \
    file://4.19/0100-sh_eth-WARN_ON-access-to-unimplemented-TSU-register.patch \
    file://4.19/0101-dt-bindings-can-rcar_can-Fix-R8A7796-SoC-name.patch \
    file://4.19/0102-DT-net-can-rcar_canfd-document-R8A77970-bindings.patch \
    file://4.19/0103-DT-net-can-rcar_canfd-document-R8A77980-bindings.patch \
    file://4.19/0104-dt-bindings-arm-document-Renesas-V3HSK-board-binding.patch \
    file://4.19/0105-arm64-dts-renesas-r8a77970-add-VSPD-support.patch \
    file://4.19/0106-arm64-dts-renesas-r8a77970-add-DU-support.patch \
    file://4.19/0107-arm64-dts-renesas-r8a77970-add-LVDS-support.patch \
    file://4.19/0108-arm64-dts-renesas-eagle-Enable-HDMI-output.patch \
    file://4.19/0109-arm64-dts-renesas-r8a77970-sort-subnodes-of-the-soc-.patch \
    file://4.19/0110-arm64-dts-renesas-r8a77970-Enable-IPMMU-devices.patch \
    file://4.19/0111-arm64-dts-renesas-eagle-add-EtherAVB-pins.patch \
    file://4.19/0112-arm64-dts-renesas-v3msk-add-EtherAVB-pins.patch \
    file://4.19/0113-arm64-dts-renesas-r8a77980-add-PFC-support.patch \
    file://4.19/0114-arm64-dts-renesas-condor-add-SCIF0-pins.patch \
    file://4.19/0115-arm64-dts-renesas-condor-add-EtherAVB-pins.patch \
    file://4.19/0116-arm64-dts-renesas-r8a77980-add-MMC-support.patch \
    file://4.19/0117-arm64-dts-renesas-condor-add-eMMC-support.patch \
    file://4.19/0118-arm64-dts-renesas-v3msk-add-DU-LVDS-HDMI-support.patch \
    file://4.19/0119-arm64-dts-renesas-r8a77980-use-CPG-core-clock-macros.patch \
    file://4.19/0120-arm64-dts-renesas-r8a77980-use-SYSC-power-domain-mac.patch \
    file://4.19/0121-arm64-dts-renesas-r8a77970-add-CAN-FD-support.patch \
    file://4.19/0122-arm64-dts-renesas-eagle-add-CAN-FD-support.patch \
    file://4.19/0123-arm64-dts-renesas-r8a77980-add-CAN-FD-support.patch \
    file://4.19/0124-arm64-dts-renesas-condor-add-CAN-FD-support.patch \
    file://4.19/0125-arm64-dts-renesas-r8a77970-Add-secondary-CA53-CPU-co.patch \
    file://4.19/0126-arm64-dts-renesas-r8a77970-Add-Cortex-A53-PMU-node.patch \
    file://4.19/0127-arm64-dts-renesas-r8a77980-add-resets-property-to-CA.patch \
    file://4.19/0128-arm64-dts-renesas-r8a77970-disable-EtherAVB.patch \
    file://4.19/0129-arm64-dts-renesas-r8a77980-disable-EtherAVB.patch \
    file://4.19/0130-arm64-dts-renesas-initial-V3HSK-board-device-tree.patch \
    file://4.19/0131-arm64-dts-renesas-r8a77970-add-VIN-and-CSI-2-nodes.patch \
    file://4.19/0132-pinctrl-sh-pfc-r8a77980-Add-pin-I-O-voltage-control-.patch \
    file://4.19/0133-pinctrl-sh-pfc-r8a77970-Fix-pin-I-O-voltage-control-.patch \
    file://4.19/0134-sh_eth-Change-platform-check-to-CONFIG_ARCH_RENESAS.patch \
    file://4.19/0135-sh_eth-add-RGMII-support.patch \
    file://4.19/0136-sh_eth-add-EDMR.NBST-support.patch \
    file://4.19/0137-sh_eth-add-R8A77980-support.patch \
    file://4.19/0138-sh_eth-fix-typo-in-EESR.TRO-bit-name.patch \
    file://4.19/0139-sh_eth-fix-comment-grammar-in-struct-sh_eth_cpu_data.patch \
    file://4.19/0140-sh_eth-fix-typo-in-comment-to-BCULR-write.patch \
    file://4.19/0141-gpio-rcar-document-R8A77980-bindings.patch \
    file://4.19/0142-arm64-dts-renesas-r8a77980-add-SMP-support.patch \
    file://4.19/0143-arm64-dts-renesas-r8a77980-add-GEther-support.patch \
    file://4.19/0144-arm64-dts-renesas-v3hsk-add-GEther-support.patch \
    file://4.19/0145-arm64-dts-renesas-r8a77980-add-I2C-support.patch \
    file://4.19/0146-arm64-dts-renesas-condor-add-I2C0-support.patch \
    file://4.19/0147-arm64-dts-renesas-r8a77980-add-GPIO-support.patch \
    file://4.19/0148-arm64-dts-renesas-condor-v3hsk-specify-Ethernet-PHY-.patch \
    file://4.19/0149-arm64-dts-renesas-r8a77980-add-FCPVD-VSPD-DU-LVDS-su.patch \
    file://4.19/0150-sh_eth-fix-enum-RPADIR_BIT.patch \
    file://4.19/0151-sh_eth-remove-sh_eth_cpu_data-rpadir_value.patch \
    file://4.19/0152-sh_eth-fix-enum-A-M-PR_BIT.patch \
    file://4.19/0153-iommu-ipmmu-vmsa-Add-r8a7796-DT-binding.patch \
    file://4.19/0154-iommu-ipmmu-vmsa-Add-r8a779-70-95-DT-bindings.patch \
    file://4.19/0155-iommu-ipmmu-vmsa-Document-R-Car-V3H-and-E3-IPMMU-DT-.patch \
    file://4.19/0156-sh_eth-fix-invalid-context-bug-while-calling-auto-ne.patch \
    file://4.19/0157-sh_eth-fix-invalid-context-bug-while-changing-link-o.patch \
    file://4.19/0158-sh_eth-simplify-link-auto-negotiation-by-ethtool.patch \
    file://4.19/0159-sh_eth-remove-custom-.nway_reset-from-ethtool-ops.patch \
    file://4.19/0160-sh_eth-remove-useless-serialization-in-sh_eth_get_li.patch \
    file://4.19/0161-sh_eth-remove-custom-.get_link_ksettings-from-ethtoo.patch \
    file://4.19/0162-sh_eth-remove-custom-.set_link_ksettings-from-ethtoo.patch \
    file://4.19/0163-dt-bindings-phy-Renesas-R-Car-Gen3-PCIe-PHY-bindings.patch \
    file://4.19/0164-phy-Renesas-R-Car-gen3-PCIe-PHY-driver.patch \
    file://4.19/0165-pinctrl-sh-pfc-r8a77970-remove-SH_PFC_PIN_CFG_DRIVE_.patch \
    file://4.19/0166-dt-bindings-irqchip-renesas-irqc-Document-r8a77980-s.patch \
    file://4.19/0167-arm64-dts-renesas-r8a77980-add-INTC-EX-support.patch \
    file://4.19/0168-net-phy-allow-scanning-busses-with-missing-phys.patch \
    file://4.19/0169-of_mdio-Move-phy-check-before-phy-access.patch \
    file://4.19/0170-iommu-ipmmu-vmsa-Fix-allocation-in-atomic-context.patch \
    file://4.19/0171-arm64-dts-renesas-r8a77980-add-RWDT-support.patch \
    file://4.19/0172-arm64-dts-renesas-Include-R-Car-product-name-in-DTSI.patch \
    file://4.19/0173-ASoC-rsnd-fixup-not-to-call-clk_get-set-under-non-at.patch \
    file://4.19/0174-arm64-enable-CMT-TMU-support-for-Renesas-SoC.patch \
    file://4.19/0175-arm64-dts-renesas-r8a77980-add-Cortex-A53-PMU-suppor.patch \
    file://4.19/0176-arm64-dts-renesas-r8a77980-move-IPMMU-nodes.patch \
    file://4.19/0177-arm64-dts-renesas-r8a779-7-8-0-move-CAN-clock-node.patch \
    file://4.19/0178-arm64-dts-renesas-r8a77980-add-CSI2-VIN-support.patch \
    file://4.19/0179-arm64-dts-renesas-r8a77970-add-MMC-support.patch \
    file://4.19/0180-arm64-dts-renesas-v3msk-add-eMMC-support.patch \
    file://4.19/0181-arm64-dts-renesas-condor-v3hsk-add-DU-LVDS-HDMI-supp.patch \
    file://4.19/0182-arm64-dts-renesas-r8a77980-add-PCIe-support.patch \
    file://4.19/0183-arm64-dts-renesas-condor-add-PCIe-support.patch \
    file://4.19/0184-arm64-dts-renesas-v3hsk-Move-lvds0-node.patch \
    file://4.19/0185-arm64-dts-renesas-r8a77980-Attach-the-SYS-DMAC-to-th.patch \
    file://4.19/0186-arm64-dts-renesas-r8a779-7-8-0-add-CMT-support.patch \
    file://4.19/0187-dt-bindings-timer-renesas-tmu-document-R8A779-7-8-0-.patch \
    file://4.19/0188-arm64-dts-renesas-r8a779-7-8-0-add-TPU-support.patch \
    file://4.19/0189-arm64-dts-renesas-r8a779-7-8-0-add-PWM-support.patch \
    file://4.19/0190-media-vsp1-Use-header-display-lists-for-all-WPF-outp.patch \
    file://4.19/0191-arm64-dts-renesas-r8a77970-add-thermal-support.patch \
    file://4.19/0192-arm64-dts-renesas-r8a77980-add-thermal-support.patch \
    file://4.19/0193-arm64-dts-renesas-r8a779-7-8-0-add-TMU-support.patch \
    file://4.19/0194-arm64-dts-renesas-r8a779-7-8-0-add-MSIOF-support.patch \
    file://4.19/0195-arm64-dts-renesas-r8a77980-Connect-R-Car-V3H-AVB-to-.patch \
    file://4.19/0196-clk-renesas-cpg-mssr-Add-support-for-fixed-rate-cloc.patch \
    file://4.19/0197-clk-renesas-rcar-gen3-Add-support-for-mode-pin-clock.patch \
    file://4.19/0198-clk-renesas-r8a77980-Add-RCLK-for-watchdog-timer.patch \
    file://4.19/0199-gpu-drm-rcar_du-Add-r8a77970-quirks.patch \
    file://4.19/0200-gpu-drm-rcar-du-Add-r8a77980-support.patch \
    file://4.19/0201-arm64-dts-renesas-r8a77970-Remove-LVDS-encoder-nodes.patch \
    file://4.19/0202-arm64-dts-renesas-r8a77980-Remove-LVDS-encoder-nodes.patch \
    file://4.19/0203-arm64-dts-renesas-eagle-Add-x1-clock.patch \
    file://4.19/0204-arm64-dts-renesas-r8a77980-condor-Add-GEther-support.patch \
    file://4.19/0205-iommu-ipmmu-vmsa-Add-r8a77980-support.patch \
    file://4.19/0206-iommu-ipmmu-vmsa-Disable-IPMMU-on-R-Car-V3M.patch \
    file://4.19/0207-clk-renesas-r8a77980-cpg-mssr-Add-VIN-clocks.patch \
    file://4.19/0208-clk-renesas-r8a77970-cpg-mssr-Add-IMR-clocks.patch \
    file://4.19/0209-clk-renesas-r8a77980-cpg-mssr-Add-IMR-clocks.patch \
    file://4.19/0210-clk-renesas-r8a77970-cpg-mssr-Add-ISP-clock.patch \
    file://4.19/0211-clk-renesas-r8a77980-cpg-mssr-Add-ISP-clocks.patch \
    file://4.19/0212-media-platform-soc_camera-Add-V4L2-R-Car-ISP-driver.patch \
    file://4.19/0213-media-platform-soc_camera-rcar_isp-Fix-unused-variab.patch \
    file://4.19/0214-media-platform-rcar-vin-enable-support-for-r8a77980.patch \
    file://4.19/0215-media-platform-soc_camera-rcar_vin-Update-R-Car-V3M-.patch \
    file://4.19/0216-media-platform-soc_camera-rcar_vin-Add-r8a77980-supp.patch \
    file://4.19/0217-media-platform-soc_camera-rcar_csi2-r8a77970-Update-.patch \
    file://4.19/0218-media-platform-soc_camera-rcar_csi2-Add-r8a77980-sup.patch \
    file://4.19/0219-arm64-dts-renesas-r8a77970-Convert-VIN-nodes-to-soc_.patch \
    file://4.19/0220-arm64-dts-renesas-r8a77980-Convert-VIN-nodes-to-soc_.patch \
    file://4.19/0221-arm64-dts-renesas-r8a77970-Convert-SCI2-nodes-to-soc.patch \
    file://4.19/0222-arm64-dts-renesas-r8a77980-Convert-CSI2-nodes-to-soc.patch \
    file://4.19/0223-arm64-dts-renesas-r8a77970-Add-IMR-nodes.patch \
    file://4.19/0224-arm64-dts-renesas-r8a77980-Add-IMR-nodes.patch \
    file://4.19/0225-arm64-dts-renesas-r8a77970-Add-ISP-node.patch \
    file://4.19/0226-arm64-dts-renesas-r8a77980-Add-ISP-nodes.patch \
    file://4.19/0227-arm64-dts-renesas-eagle-Add-video-input-support.patch \
    file://4.19/0228-arm64-dts-renesas-condor-Add-video-input-support.patch \
    file://4.19/0229-arm64-dts-renesas-v3msk-Add-reserved-memory-nodes.patch \
    file://4.19/0230-arm64-dts-renesas-v3hsk-Add-reserved-memory-nodes.patch \
    file://4.19/0231-arm64-dts-renesas-eagle-Add-reserved-memory-nodes.patch \
    file://4.19/0232-arm64-dts-renesas-condor-Add-reserved-memory-nodes.patch \
    file://4.19/0233-arm64-dts-renesas-v3msk-Add-mmngr-and-mmngrbuf-nodes.patch \
    file://4.19/0234-arm64-dts-renesas-v3hsk-Add-mmngr-and-mmngrbuf-nodes.patch \
    file://4.19/0235-arm64-dts-renesas-eagle-Add-mmngr-and-mmngrbuf-nodes.patch \
    file://4.19/0236-arm64-dts-renesas-condor-Add-mmngr-and-mmngrbuf-node.patch \
    file://4.19/0237-arm64-dts-renesas-v3msk-Add-vspm_if-node.patch \
    file://4.19/0238-arm64-dts-renesas-v3hsk-Add-vspm_if-node.patch \
    file://4.19/0239-arm64-dts-renesas-eagle-Add-vspm_if-node.patch \
    file://4.19/0240-arm64-dts-renesas-condor-Add-vspm_if-node.patch \
    file://4.19/0241-arm64-dts-renesas-eagle-Add-Dialog-DA9063-MFD.patch \
    file://4.19/0242-arm64-dts-renesas-Add-r8a77970-eagle-function-suppor.patch \
    file://4.19/0243-arm64-dts-renesas-Add-r8a77970-es1-support.patch \
    file://4.19/0244-arm64-dts-renesas-Add-r8a77970-v3msk-view-support.patch \
    file://4.19/0245-arm64-dts-renesas-Add-r8a77970-v3msk-kf-support.patch \
    file://4.19/0246-arm64-dts-renesas-Add-r8a77970-v3msk-vbm-support.patch \
    file://4.19/0247-arm64-dts-renesas-Add-r8a77970-v3mzf-support.patch \
    file://4.19/0248-arm64-dts-renesas-Add-r8a77980-v3hsk-vbm-support.patch \
"

SRC_URI_append_h3ulcb = " file://ulcb.cfg"
SRC_URI_append_m3ulcb = " file://ulcb.cfg"
SRC_URI_append_m3nulcb = " file://ulcb.cfg"
SRC_URI_append_salvator-x = " file://salvator-x.cfg"
SRC_URI_append_eagle = " file://eagle.cfg"
SRC_URI_append_v3msk = " file://v3msk.cfg"
SRC_URI_append_condor = " file://condor.cfg"
SRC_URI_append_v3mzf = " file://v3mzf.cfg"
SRC_URI_append_v3hsk = " file://v3hsk.cfg"

KERNEL_DEVICETREE_append_h3ulcb = " \
    renesas/r8a7795-es1-h3ulcb-view.dtb \
    renesas/r8a7795-es1-h3ulcb-had-alfa.dtb \
    renesas/r8a7795-es1-h3ulcb-had-beta.dtb \
    renesas/r8a7795-es1-h3ulcb-kf.dtb \
    renesas/r8a7795-es1-h3ulcb-vb.dtb \
    renesas/r8a7795-es1-h3ulcb-vb2.dtb \
    renesas/r8a7795-es1-h3ulcb-vbm.dtb \
    renesas/r8a7795-h3ulcb-view.dtb \
    renesas/r8a7795-h3ulcb-had-alfa.dtb \
    renesas/r8a7795-h3ulcb-had-beta.dtb \
    renesas/r8a7795-h3ulcb-kf.dtb \
    renesas/r8a7795-h3ulcb-vb.dtb \
    renesas/r8a7795-h3ulcb-vb2.dtb \
    renesas/r8a7795-h3ulcb-vbm.dtb \
"

KERNEL_DEVICETREE_append_m3ulcb = " \
    renesas/r8a7796-m3ulcb-view.dtb \
    renesas/r8a7796-m3ulcb-kf.dtb \
"

KERNEL_DEVICETREE_append_m3nulcb = " \
    renesas/r8a77965-m3nulcb-kf.dtb \
"

KERNEL_DEVICETREE_append_salvator-x = " \
    renesas/r8a7795-es1-salvator-x-view.dtb \
    renesas/r8a7795-salvator-x-view.dtb \
    renesas/r8a7796-salvator-x-view.dtb \
"

KERNEL_DEVICETREE_append_eagle = " \
    renesas/r8a77970-es1-eagle.dtb \
    renesas/r8a77970-es1-eagle-function.dtb \
    renesas/r8a77970-eagle.dtb \
    renesas/r8a77970-eagle-function.dtb \
"

KERNEL_DEVICETREE_append_v3msk = " \
    renesas/r8a77970-es1-v3msk.dtb \
    renesas/r8a77970-es1-v3msk-kf.dtb \
    renesas/r8a77970-es1-v3msk-vbm.dtb \
    renesas/r8a77970-es1-v3msk-vbm-v2.dtb \
    renesas/r8a77970-es1-v3msk-view.dtb \
    renesas/r8a77970-v3msk.dtb \
    renesas/r8a77970-v3msk-kf.dtb \
    renesas/r8a77970-v3msk-vbm.dtb \
    renesas/r8a77970-v3msk-vbm-v2.dtb \
    renesas/r8a77970-v3msk-view.dtb \
"

KERNEL_DEVICETREE_append_v3mzf = " \
    renesas/r8a77970-v3mzf.dtb \
"

KERNEL_DEVICETREE_append_condor = " \
    renesas/r8a77980-condor.dtb \
"

KERNEL_DEVICETREE_append_v3hsk = " \
    renesas/r8a77980-v3hsk.dtb \
    renesas/r8a77980-v3hsk-vbm.dtb \
    renesas/r8a77980-v3hsk-vbm-v2.dtb \
"
