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
