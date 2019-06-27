FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

COMPATIBLE_MACHINE_eagle = "eagle"
COMPATIBLE_MACHINE_v3msk = "v3msk"
COMPATIBLE_MACHINE_condor = "condor"
COMPATIBLE_MACHINE_v3mzf = "v3mzf"
COMPATIBLE_MACHINE_v3hsk = "v3hsk"

SRC_URI_append = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'h3ulcb-had', ' file://hyperflash.cfg', '', d)} \
    ${@oe.utils.conditional("SDHI_SEQ", "1", " file://sdhi_seq.cfg", "", d)} \
    file://nvme.cfg \
    file://disable-unused.cfg \
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
    file://0027-gpu-drm-bridge-adv7511-Add-interlaced-mode-support.patch \
    file://0030-Gen3-LVDS-cameras.patch \
    file://0031-media-i2c-Add-ov5647-sensor.patch \
    file://0032-media-i2c-Add-ov5642-sensor.patch \
    file://0033-media-soc-camera-fix-parallel-i-f-in-VIN.patch \
    file://0034-media-soc_camera-Fix-VIDIOC_S_SELECTION-ioctl-miscal.patch \
    file://0036-Add-MOST-support-for-r8a77965.patch \
    file://0037-media-soc_camera-rcar_vin-Fix-VnCSI_IFMD-settings.patch \
    file://0038-media-soc_camera-rcar_vin-Add-R-Car-M3N-support.patch \
    file://0039-media-soc_camera-rcar_csi2-Add-R-Car-M3N-support.patch \
    file://0040-arm64-dts-renesas-add-ADAS-boards.patch \
    file://0041-arm64-dts-renesas-ulcb-kf-Move-panel-configuration-t.patch \
    file://0042-arm64-dts-renesas-r8a7795-es1-h3ulcb-disable-eMMC.patch \
    file://0043-pinctrl-sh-pfc-pfc-r8a77965-Add-missing-avb_mii-pin-.patch \
    file://0045-clk-r8a779x-add-mlp-clock.patch \
    file://0046-arm64-dts-renesas-r8a779x-add-mlp-nodes.patch \
    ${@oe.utils.conditional("KF_ENABLE_SD3", "1", " file://0047-arm64-dts-renesas-ulcb-kf-enable-sd3.patch", "", d)} \
    ${@oe.utils.conditional("KF_ENABLE_MOST", "1", " file://0048-arm64-dts-renesas-ulcb-kf-enable-most.patch", "", d)} \
    file://0049-clk-r8a779x-add-IMP-clock.patch \
    file://0050-arm64-dts-renesas-r8a779x-add-IMP-nodes.patch \
    file://0062-IIO-lsm9ds0-add-IMU-driver.patch \
    file://0063-ASoC-PCM3168A-add-TDM-modes-merge-ADC-and-DAC.patch \
    file://0064-drm-bridge-adv7511-Add-frequency-and-vrefresh-limita.patch \
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
    file://0109-serial-sh-sci-Fix-minimal-rx_timeout-value.patch \
    file://0112-ARM64-dts-renesas-ulcb-Make-AK4613-sound-device-name.patch \
    file://0113-arm64-dts-ulcb-kf-increase-SDIO-frequency-for-WLAN-c.patch \
    file://0114-Sony-IMX219-driver.patch \
    ${@oe.utils.conditional("KF_ENABLE_IMX219", "1", " file://0115-arm64-dts-renesas-ulcb-kf-enable-enable-IMX219.patch", "", d)} \
    file://0116-media-i2c-soc_camera-Fix-Bad-of_node_put-error.patch \
    file://0117-rcar-vin-fix-get_selection-use.patch \
    file://0118-clk-clk-gpio-Allow-GPIO-to-sleep-in-set-get_parent.patch \
    file://0119-i2c-mix-pca954x-reset-mux-in-case-of-error-during-bu.patch \
    file://0120-arm64-dts-ulcb-kf-pcm3168a-reset-earlier-i2c-mux-dis.patch \
    ${@oe.utils.conditional("KF_PANEL_MODEL", "TX31D200VM0BAA", " file://0121-arm64-dts-renesas-ulcb-kf-Set-KOE-TX31D200VM0BAA-128.patch", "", d)} \
    ${@oe.utils.conditional("KF_PANEL_MODEL", "AA104XD12", " file://0121-arm64-dts-renesas-ulcb-kf-Set-Mitsubishi-AA104XD12-1.patch", "", d)} \
    ${@oe.utils.conditional("KF_PANEL_MODEL", "AA121TD01", " file://0121-arm64-dts-renesas-ulcb-kf-Set-Mitsubishi-AA121TD01-1.patch", "", d)} \
    file://0122-block-blk-mq-Fix-IO-hang.patch \
    file://0123-nvme-Workaround-Samsung-970-Pro-power-state-issues.patch \
    file://0124-nvme-pci-add-SGL-support.patch \
    file://0125-nvme-pci-don-t-open-code-nvme_reset_ctrl.patch \
    file://0126-nvme-pci-limit-max-IO-size-and-segments-to-avoid-hig.patch \
    file://0127-swiotlb-Respect-DMA_ATTR_NO_WARN-in-swiotlb_map_sg_a.patch \
    file://0128-arm64-dts-Add-H3ULCB-VideoBox-2.1-support.patch \
    file://0129-can-rcar_canfd-fix-possible-IRQ-storm-on-high-load.patch \
    file://0130-LVDS-ar0132-use-context-swwitch.patch \
    file://0131-media-i2c-soc_camera-Bunch-update-from-2.23.1.patch \
    file://0132-lvds-ti960-fix-frame-sync-time-for-different-ref-clo.patch \
    file://0133-lvds-add-AR0323-imager.patch \
    file://0134-lvds-add-ISX016-imager.patch \
    file://0135-LVDS-ar0233-set-frame-size-1920x1200.patch \
    file://0136-lvds-AR0233-add-different-vendor.patch \
    file://0137-lvds-poll-ub960-deserializer-lock-status.patch \
    file://0138-lvds-AR0231-modify-with-rev7-silicon.patch \
    file://0139-lvds-AR0233-modify-with-rev2-silicon.patch \
    file://0140-lvds-ti9x4-fix-remote-gpio-enablement-for-4-cams.patch \
    file://0141-media-soc_camera-imx390-Add-new-V4L-controls.patch \
    file://0142-lvds-AR233-add-rev1-silion-setup.patch \
    file://0143-LVDS-AR0231-add-rev6-rev4-on-max9286.patch \
    file://0144-lvds-add-OV10640-imager.patch \
    file://0145-lvds-ti9x4-fix-remote-gpio-enablement-on-UB913.patch \
    file://0146-lvds-add-dummy-imager-driver.patch \
    file://0147-lvds-ti9x4-use-REFCLK-23.0MHz.patch \
    file://0148-lvds-ar0231-fix-comments.patch \
    file://0149-lvds-ISX019-rename-isx016-to-isx019.patch \
    file://0150-lvds-add-ISX016-imager.patch \
    file://0151-lvds-ti9x4-add-DVP-LSB-MSB-selection.patch \
    file://0152-lvds-AR323-fix-reset-gpio-nadling.patch \
    file://0153-lvds-OV495-fix-reset-gpio-handling.patch \
    file://0154-lvds-AR0323-replace-with-REV2-setup-table.patch \
    file://0155-AR0143-add-original-ONSEMI-setup.patch \
    file://0156-AR0143-enable-3exp-in-custom-setup.patch \
    file://0157-AR0143-add-choose-of-imager-setup.patch \
    file://0158-MAX9286-fix-BWS-setup-to-reserve-reboot.patch \
    file://0159-MAX9286-adjust-POC-trigger-for-unstable-link.patch \
    file://0160-lvds-onsemi-fix-revsion-parsing.patch \
    file://0161-lvds-AR0233-add-module-trigger-parameter.patch \
    file://0162-lvds-AR0233-migrate-to-composed-tables.patch \
    file://0163-lvds-AP0101-AR014X-add-TI-serializers.patch \
    file://0164-lvds-fix-vendor-names.patch \
    file://0165-LVDS-add-GW5200-IMX390-camera.patch \
    file://0166-lvds-AR0233-add-superexposure-plus.patch \
    file://0167-lvds-AR0233-fix-matrix-size-set-default-h-vflip.patch \
    file://0168-lvds-ISX019-fix-add-address-intf-fix-read-write.patch \
    file://0169-lvds-OVT-add-dvp_order-parameter-for-ov10635.patch \
    file://0170-media-i2c-add-AR0147-imager.patch \
    file://0171-lvds-ONSEMI-fix-matrix-position-during-crop.patch \
    file://0172-media-i2c-ar0147-fix-super-exposure-artifact-line.patch \
    file://0173-lvds-ti9x4-fix-remote-gpio-setup.patch \
    file://0174-arm64-dts-renesas-ulcb-vb2-Drive-CAN-controller-rese.patch \
    file://0175-lvds-ov2775-add-exposure-gain.patch \
    file://0176-lvds-geosemi-put-imager-to-autodetect-tail.patch \
    file://0177-media-rcar_vin-add-GREY-Y8-bypass.patch \
    file://0178-lvds-add-OV2311-imager.patch \
    file://0179-media-i2c-soc_camera-Fix-more-Bad-of_node_put-errors.patch \
    file://0180-media-i2c-ov490-add-LI-cameras.patch \
    file://0181-ARM64-dts-Remove-conflicting-with-mainline-V3M-and-V.patch \
    file://0182-iommu-msm-Claim-bus-ops-on-probe.patch \
    file://0183-iommu-Clean-up-of_iommu_init_fn.patch \
    file://0184-iommu-ipmmu-vmsa-Hook-up-r8a779-70-95-DT-matching-co.patch \
    file://0185-dt-bindings-display-bridge-Document-THC63LVD1024-LVD.patch \
    file://0186-gpio-rcar-document-R8A77980-bindings.patch \
    file://0187-arm64-dts-renesas-r8a77980-add-SMP-support.patch \
    file://0188-arm64-dts-renesas-r8a77980-add-GEther-support.patch \
    file://0189-arm64-dts-renesas-v3hsk-add-GEther-support.patch \
    file://0190-arm64-dts-renesas-r8a77980-add-I2C-support.patch \
    file://0191-arm64-dts-renesas-condor-add-I2C0-support.patch \
    file://0192-arm64-dts-renesas-r8a77980-add-GPIO-support.patch \
    file://0193-arm64-dts-renesas-condor-v3hsk-specify-Ethernet-PHY-.patch \
    file://0194-arm64-dts-renesas-r8a77980-add-FCPVD-VSPD-DU-LVDS-su.patch \
    file://0195-sh_eth-fix-enum-RPADIR_BIT.patch \
    file://0196-sh_eth-remove-sh_eth_cpu_data-rpadir_value.patch \
    file://0197-sh_eth-fix-enum-A-M-PR_BIT.patch \
    file://0198-iommu-ipmmu-vmsa-Document-R-Car-V3H-and-E3-IPMMU-DT-.patch \
    file://0199-dt-bindings-phy-Renesas-R-Car-Gen3-PCIe-PHY-bindings.patch \
    file://0200-phy-Renesas-R-Car-gen3-PCIe-PHY-driver.patch \
    file://0201-dt-bindings-irqchip-renesas-irqc-Document-r8a77980-s.patch \
    file://0202-arm64-dts-renesas-r8a77980-add-INTC-EX-support.patch \
    file://0203-net-phy-allow-scanning-busses-with-missing-phys.patch \
    file://0204-arm64-dts-renesas-r8a77980-add-RWDT-support.patch \
    file://0205-arm64-enable-CMT-TMU-support-for-Renesas-SoC.patch \
    file://0206-arm64-dts-renesas-r8a77980-add-Cortex-A53-PMU-suppor.patch \
    file://0207-arm64-dts-renesas-r8a77980-move-IPMMU-nodes.patch \
    file://0208-arm64-dts-renesas-r8a779-7-8-0-move-CAN-clock-node.patch \
    file://0209-arm64-dts-renesas-r8a77980-add-CSI2-VIN-support.patch \
    file://0210-arm64-dts-renesas-r8a77970-add-MMC-support.patch \
    file://0211-arm64-dts-renesas-v3msk-add-eMMC-support.patch \
    file://0212-arm64-dts-renesas-condor-v3hsk-add-DU-LVDS-HDMI-supp.patch \
    file://0213-arm64-dts-renesas-r8a77980-add-PCIe-support.patch \
    file://0214-arm64-dts-renesas-condor-add-PCIe-support.patch \
    file://0215-arm64-dts-renesas-v3hsk-Move-lvds0-node.patch \
    file://0216-arm64-dts-renesas-r8a77980-Attach-the-SYS-DMAC-to-th.patch \
    file://0217-arm64-dts-renesas-r8a779-7-8-0-add-CMT-support.patch \
    file://0218-dt-bindings-timer-renesas-tmu-document-R8A779-7-8-0-.patch \
    file://0219-arm64-dts-renesas-r8a779-7-8-0-add-TPU-support.patch \
    file://0220-arm64-dts-renesas-r8a779-7-8-0-add-PWM-support.patch \
    file://0221-media-vsp1-Use-header-display-lists-for-all-WPF-outp.patch \
    file://0222-arm64-dts-renesas-r8a77970-add-thermal-support.patch \
    file://0223-arm64-dts-renesas-r8a77980-add-thermal-support.patch \
    file://0224-arm64-dts-renesas-r8a779-7-8-0-add-TMU-support.patch \
    file://0225-arm64-dts-renesas-r8a779-7-8-0-add-MSIOF-support.patch \
    file://0226-arm64-dts-renesas-r8a77980-Connect-R-Car-V3H-AVB-to-.patch \
    file://0227-clk-renesas-r8a77980-Add-OSC-predivider-configuratio.patch \
    file://0228-clk-renesas-r8a77980-Add-RCLK-for-watchdog-timer.patch \
    file://0229-drm-rcar-du-lvds-add-R8A77980-support.patch \
    file://0230-drivers-flag-buses-which-demand-DMA-configuration.patch \
    file://0231-gpu-host1x-Call-of_dma_configure-after-setting-bus.patch \
    file://0232-gpu-host1x-Cleanup-on-initialization-failure.patch \
    file://0233-dma-mapping-move-dma-configuration-to-bus-infrastruc.patch \
    file://0234-drivers-remove-force-dma-flag-from-buses.patch \
    file://0235-clk-renesas-r8a77980-Add-CMT-clocks.patch \
    file://0236-clk-renesas-r8a77970-Add-SD0H-SD0-clocks-for-SDHI.patch \
    file://0237-clk-renesas-r8a77970-Add-CMT-clocks.patch \
    file://0238-clk-renesas-r8a77970-Add-TMU-clocks.patch \
    file://0239-dt-bindings-display-renesas-du-document-R8A77980-bin.patch \
    file://0240-dt-bindings-display-renesas-lvds-document-R8A77980-b.patch \
    file://0241-clk-renesas-r8a77970-Add-TPU-clock.patch \
    file://0242-mmc-renesas_sdhi_internal_dmac-add-R8A77970-to-white.patch \
    file://0243-dt-bindings-mmc-tmio_mmc-document-Renesas-R8A77970-b.patch \
    file://0244-dt-bindings-thermal-rcar-gen3-thermal-document-R8A77.patch \
    file://0245-thermal-rcar_gen3_thermal-add-R8A77980-support.patch \
    file://0246-dt-bindings-thermal-rcar-thermal-document-R8A77970-b.patch \
    file://0247-thermal-rcar_thermal-add-R8A77970-support.patch \
    file://0248-clk-renesas-r8a77970-Add-RPC-clocks.patch \
    file://0249-pinctrl-sh-pfc-r8a77970-Add-QSPI-pins-groups-and-fun.patch \
    file://0250-pinctrl-sh-pfc-r8a77980-Add-QSPI-pins-groups-and-fun.patch \
    file://0251-media-rcar-rcar-csi2-Update-V3M-E3-PHTW-tables.patch \
    file://0252-soc-renesas-r8a77970-sysc-Remove-non-existent-CR7-po.patch \
    file://0253-soc-renesas-r8a77970-sysc-Correct-names-of-A2DP-A2CN.patch \
    file://0254-soc-renesas-r8a77980-sysc-Correct-names-of-A2DP-01-p.patch \
    file://0255-soc-renesas-r8a77980-sysc-Correct-A3VIP-012-power-do.patch \
    file://0256-clk-renesas-r8a77970-Add-CPEX-clock.patch \
    file://0257-media-rcar-csi2-add-R8A77980-support.patch \
    file://0258-media-rcar-vin-add-R8A77980-support.patch \
    file://0259-pinctrl-sh-pfc-r8a77970-Add-missing-MOD_SEL0-field.patch \
    file://0260-pinctrl-sh-pfc-r8a77980-Add-missing-MOD_SEL0-field.patch \
    file://0261-media-rcar-csi2-Fix-PHTW-table-values-for-E3-V3M.patch \
    file://0262-pinctrl-sh-pfc-Reduce-kernel-size-for-narrow-VIN-cha.patch \
    file://0263-pinctrl-sh-pfc-r8a77970-Deduplicate-VIN-01-pin-defin.patch \
    file://0264-pinctrl-sh-pfc-r8a77980-Deduplicate-VIN1-pin-definit.patch \
    file://0265-arm64-dts-renesas-v3msk-specify-EtherAVB-PHY-IRQ.patch \
    file://0266-sh_eth-rename-sh_eth_cpu_data-hw_checksum.patch \
    file://0267-sh_eth-RX-checksum-offload-support.patch \
    file://0268-sh_eth-offload-RX-checksum-on-R7S72100.patch \
    file://0269-sh_eth-offload-RX-checksum-on-R8A7740.patch \
    file://0270-sh_eth-offload-RX-checksum-on-R8A77980.patch \
    file://0271-sh_eth-offload-RX-checksum-on-SH7734.patch \
    file://0272-sh_eth-offload-RX-checksum-on-SH7763.patch \
    file://0273-clk-renesas-rcar-gen3-Factor-out-cpg_reg_modify.patch \
    file://0274-clk-renesas-rcar-gen3-Add-spinlock.patch \
    file://0275-clk-renesas-rcar-gen3-Add-RPC-clocks.patch \
    file://0276-clk-renesas-r8a77980-Add-RPC-clocks.patch \
    file://0277-pinctrl-sh-pfc-r8a77970-Rename-IOCTRLx-registers.patch \
    file://0278-pinctrl-sh-pfc-r8a77980-Rename-IOCTRLx-registers.patch \
    file://0279-clk-renesas-r8a77980-Fix-RPC-IF-module-clock-s-paren.patch \
    file://0280-arm64-dts-renesas-r8a77980-Add-renesas-id-to-VIN.patch \
    file://0281-arm64-dts-renesas-eagle-Add-x1-clock.patch \
    file://0282-arm64-dts-renesas-r8a77980-condor-Add-GEther-support.patch \
    file://0283-iommu-ipmmu-vmsa-Add-r8a77980-support.patch \
    file://0284-iommu-ipmmu-vmsa-Fix-NULL-pointer-dereference.patch \
    file://0285-iommu-ipmmu-vmsa-Add-r8a779-7-8-0-whitelist.patch \
    file://0286-clk-renesas-r8a77980-cpg-mssr-Add-VIN-clocks.patch \
    file://0287-clk-renesas-r8a77970-cpg-mssr-Add-IMR-clocks.patch \
    file://0288-clk-renesas-r8a77980-cpg-mssr-Add-IMR-clocks.patch \
    file://0289-clk-renesas-r8a77970-cpg-mssr-Add-ISP-clock.patch \
    file://0290-clk-renesas-r8a77980-cpg-mssr-Add-ISP-clocks.patch \
    file://0291-clk-renesas-r8a77980-cpg-mssr-Add-IMP-clocks.patch \
    file://0292-clk-renesas-r8a77980-cpg-mssr-Add-VIP-clocks.patch \
    file://0293-clk-renesas-r8a77970-cpg-mssr-Add-IMP-clocks.patch \
    file://0294-media-soc_camera-Add-CONFIG_VIDEO_ADV_DEBUG-support.patch \
    file://0295-media-platform-soc_camera-Add-V4L2-R-Car-ISP-driver.patch \
    file://0296-media-platform-soc_camera-rcar_isp-Fix-unused-variab.patch \
    file://0297-media-platform-soc_camera-rcar_vin-Update-R-Car-V3M-.patch \
    file://0298-media-platform-soc_camera-rcar_vin-Add-r8a77980-supp.patch \
    file://0299-media-platform-soc_camera-rcar_csi2-r8a77970-Update-.patch \
    file://0300-media-platform-soc_camera-rcar_csi2-Add-r8a77980-sup.patch \
    file://0301-arm64-dts-renesas-r8a77970-Convert-VIN-nodes-to-soc_.patch \
    file://0302-arm64-dts-renesas-r8a77980-Convert-VIN-nodes-to-soc_.patch \
    file://0303-arm64-dts-renesas-r8a77970-Convert-SCI2-nodes-to-soc.patch \
    file://0304-arm64-dts-renesas-r8a77980-Convert-CSI2-nodes-to-soc.patch \
    file://0305-arm64-dts-renesas-r8a77970-Add-IMR-nodes.patch \
    file://0306-arm64-dts-renesas-r8a77980-Add-IMR-nodes.patch \
    file://0307-arm64-dts-renesas-r8a77970-Add-ISP-node.patch \
    file://0308-arm64-dts-renesas-r8a77980-Add-ISP-nodes.patch \
    file://0309-arm64-dts-renesas-eagle-Add-video-input-support.patch \
    file://0310-arm64-dts-renesas-condor-Add-video-input-support.patch \
    file://0311-arm64-dts-renesas-v3msk-Add-reserved-memory-nodes.patch \
    file://0312-arm64-dts-renesas-v3hsk-Add-reserved-memory-nodes.patch \
    file://0313-arm64-dts-renesas-eagle-Add-reserved-memory-nodes.patch \
    file://0314-arm64-dts-renesas-condor-Add-reserved-memory-nodes.patch \
    file://0315-arm64-dts-renesas-v3msk-Add-mmngr-and-mmngrbuf-nodes.patch \
    file://0316-arm64-dts-renesas-v3hsk-Add-mmngr-and-mmngrbuf-nodes.patch \
    file://0317-arm64-dts-renesas-eagle-Add-mmngr-and-mmngrbuf-nodes.patch \
    file://0318-arm64-dts-renesas-condor-Add-mmngr-and-mmngrbuf-node.patch \
    file://0319-arm64-dts-renesas-v3msk-Add-vspm_if-node.patch \
    file://0320-arm64-dts-renesas-v3hsk-Add-vspm_if-node.patch \
    file://0321-arm64-dts-renesas-eagle-Add-vspm_if-node.patch \
    file://0322-arm64-dts-renesas-condor-Add-vspm_if-node.patch \
    file://0323-arm64-dts-renesas-eagle-Add-Dialog-DA9063-MFD.patch \
    file://0324-arm64-dts-renesas-Add-r8a77970-eagle-function-suppor.patch \
    file://0325-arm64-dts-renesas-Add-r8a77970-es1-support.patch \
    file://0326-arm64-dts-renesas-Add-r8a77970-v3msk-view-support.patch \
    file://0327-arm64-dts-renesas-Add-r8a77970-v3msk-kf-support.patch \
    file://0328-arm64-dts-renesas-Add-r8a77970-v3msk-vbm-support.patch \
    file://0329-arm64-dts-renesas-Add-r8a77970-v3mzf-support.patch \
    file://0330-arm64-dts-renesas-Add-r8a77980-v3hsk-vbm-support.patch \
    file://0331-arm64-dts-renesas-r8a779-7-8-0-Add-IMP-devices.patch \
    file://0332-arm64-dts-renesas-r8a77980-Add-VIP-nodes.patch \
    file://0333-arm64-dts-renesas-r8a779-78-0-Add-linux-multimedia-r.patch \
    file://0334-IMR-UIO-Driver-initial-version.patch \
    file://0335-media-rcar-imr-IMR-driver-updates-for-raw-DL.patch \
    file://0336-media-rcar-imr-Add-RSE-support.patch \
    file://0337-rcar_imr-v4l2-driver-Fix-module-support.patch \
    file://0338-V3Hsk-Condor-and-V3Msk-Eagle-Remove-cma-default-area.patch \
    file://0339-media-rcar_imr-Enable-LUCE-for-NV16-format.patch \
    file://0340-clk-cs2000-add-support-for-cs2300.patch \
    file://0341-V3H-add-support-for-8-4-channel-VideoBox-board-from-.patch \
    file://0342-arm64-dts-r8a77970-Videobox-Mini-V3-board-support.patch \
    file://0343-arm64-dts-renesas-r8a77970-v3msk-Add-ethernet0-alias.patch \
    file://0344-arm64-dts-renesas-r8a77970-Add-ISP0-alias.patch \
    file://0345-arm64-dts-renesas-r8a77980-Add-ISP-aliases.patch \
    file://0346-media-soc_camera-Add-soc_camera-host-preregister.patch \
    file://0347-arm64-renesas-r8a77980-use-CSI-4-lanes.patch \
    file://0348-Bunch-update-of-r8a77980-v3hsk-vb-4ch.dts.patch \
    file://0349-arm64-dts-renesas-r8a77980-VideoBox-Mini-fix-csi-spe.patch \
    file://0350-arm64-dts-renesas-r8a77980-v3hsk-vb-4ch-and-8ch-fix-.patch \
    file://0351-arm64-dts-renesas-r8a77980-VB-4ch-and-8ch-Add-PCIE-p.patch \
    file://0352-gpu-drm-rcar_du-Fix-physical-address-of-the-CMA-back.patch \
    file://0353-media-soc_camera-rcar_csi2-add-dump-module-param.patch \
    file://0354-media-rcar_csi2-Disable-data-type-matching.patch \
    file://0355-gpu-drm-rcar-du-Extend-VSP1-DRM-interface.patch \
    file://0356-media-platform-vsp1-Extend-DRM-VSP1-interface.patch \
    file://0357-gpu-drm-rcar-du-rcar_du_vsp-Check-if-gem-buffer-has-.patch \
    file://0358-media-platform-vsp1-Add-cropping-handling-to-VSP-alp.patch \
    file://0359-media-platform-rcar_imr-Clean-up-to-avoid-compiler-w.patch \
    file://0360-arm64-dts-renesas-r8a77970-and-r8a77980-Add-CPU-oper.patch \
    file://0361-V3H-DTS-Add-FCPR-devices.patch \
    file://0362-arm64-dts-r8a77980-v3hsk-Enable-onboard-eMMC.patch \
    file://0363-arm64-dts-renesas-r8a77980-v3hsk-vb-Xch-Fix-Ethernet.patch \
    file://0364-clocksource-drivers-sh_cmt-Add-R-Car-gen3-support.patch \
    file://0365-mtd-spi-nor-Add-R-Car-Gen3-RPC-QSPI-driver.patch \
    file://0366-mtd-spi-nor-renesas-rpc-Workaround-256-byte-data-siz.patch \
    file://0367-mtd-spi-nor-Add-s25fs512s-and-s25fs128s-01-SPI-NOR-f.patch \
    file://0368-arm64-dts-renesas-r8a77970-Add-RPC-QSPI-node.patch \
    file://0369-arm64-dts-renesas-r8a77980-Add-RPC-QSPI-node.patch \
    file://0370-arm64-dts-renesas-v3msk-Add-s25fs512s-QSPI-flash-nod.patch \
    file://0371-arm64-dts-renesas-v3mzf-Add-s25fs512s-QSPI-flash-nod.patch \
    file://0372-arm64-dts-renesas-eagle-Add-s25fs512s-QSPI-flash-nod.patch \
    file://0373-arm64-dts-renesas-v3hsk-Add-s25fs512s-QSPI-flash-nod.patch \
    file://0374-arm64-dts-renesas-condor-Add-s25fs512s-QSPI-flash-no.patch \
    file://0375-mtd-spi-nor-renesas-rpc-Support-single-mode-write-co.patch \
    file://0376-mtd-spi-nor-renesas-rpc-Add-DMA-read-support.patch \
    file://0377-r8a779-78-dtsi-Add-iccom-nodes.patch \
    file://0378-arm64-dts-renesas-Add-temperature-emergency-levels.patch \
    file://0379-r8a77980-dts-Add-vbm-v3-on-r8a77980-SoC.patch \
    file://0380-arm64-dts-r8a77970-Enable-TMU-and-CMT.patch \
    file://0381-arm64-dts-r8a77980-Enable-TMU-and-CMT.patch \
    file://0382-arm64-dts-renesas-r8a77970-and-r8a77980-Add-QoS-node.patch \
    file://0383-clk-renesas-r8a77970-cpg-mssr-Add-sadc-clock.patch \
    file://0384-arm64-dts-renesas-r8a77970-Add-sadc-node.patch \
    file://0385-iio-adc-Add-R-Car-SADC-driver.patch \
    file://0386-rcar-vin-add-ISP-source-enable.patch \
    file://0387-media-soc_camera-Add-events-support.patch \
    file://0388-media-rcar-imr-Add-stride-support-to-IMR.patch \
    file://0389-arm64-renesas-r8a77980-VB-use-REFCLK-23.0MHZ.patch \
    file://0390-arm64-dts-renesas-Add-V3x-VideoBox-FDPLink-support.patch \
    ${@oe.utils.conditional("VB_ENABLE_FDPLINK", "1", " file://0391-arm64-dts-renesas-Enable-FDPLink-output-on-V3x-Video.patch", "", d)} \
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
    renesas/r8a7795-h3ulcb-4x2g-kf.dtb \
    renesas/r8a7795-h3ulcb-vb.dtb \
    renesas/r8a7795-h3ulcb-vb2.dtb \
    renesas/r8a7795-h3ulcb-vb2.1.dtb \
    renesas/r8a7795-h3ulcb-vbm.dtb \
    renesas/r8a7795-h3ulcb-4x2g-vb.dtb \
    renesas/r8a7795-h3ulcb-4x2g-vb2.dtb \
    renesas/r8a7795-h3ulcb-4x2g-vb2.1.dtb \
    renesas/r8a7795-h3ulcb-4x2g-vbm.dtb \
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
