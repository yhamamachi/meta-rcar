DESCRIPTION = "Linux kernel for the R-Car Generation 3 based board"

require include/avb-control.inc
require recipes-kernel/linux/linux-yocto.inc

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}/${MACHINE}:"
COMPATIBLE_MACHINE = "(salvator-x|h3ulcb)"


RENESAS_BSP_URL = "git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git"
BRANCH = "v4.4/rcar-3.2.x"
SRCREV = "c2e607873caa620d5fd7e42cfe91f11166d6cdc0"

SRC_URI = "${RENESAS_BSP_URL};protocol=git;nocheckout=1;branch=${BRANCH}"

LINUX_VERSION ?= "4.4"
PV = "${LINUX_VERSION}+git${SRCPV}"
PR = "r1"

SRC_URI_append = " \
    file://defconfig \
    file://touch.cfg \
    ${@base_conditional("USE_AVB", "1", " file://usb-video-class.cfg", "", d)} \
    file://0001-arm64-renesas-add-H3ULCB-board-support.patch \
    file://0002-media-soc_camera-rcar_vin-fix-chip-ID-placeholder.patch \
    file://0003-spi-sh-msiof-fixes.patch \
    file://0004-spi-spidev-add-spi-gpio-into-spidev.patch \
    file://0005-spi-spi-gpio-fix-CPOL-mode.patch \
    file://0006-xhci-rcar-add-firmware-for-R-Car-H2-M2-USB-3.0-host-.patch \
    file://0007-usb-host-xhci-plat-add-support-for-the-R-Car-H3-xHCI.patch \
    file://0008-spi-spi-gpio-fix-set-CPOL-default-inverted.patch \
    file://0011-pinctrl-sh-pfc-r8a7795-Add-CAN-support.patch \
    file://0012-pinctrl-sh-pfc-r8a7795-Add-CAN-FD-support.patch \
    file://0013-can-rcar_can-Add-r8a7795-support.patch \
    file://0014-clk-shmobile-r8a7795-Add-CAN-peripheral-clock.patch \
    file://0015-clk-shmobile-r8a7795-Add-CAN-FD-clock.patch \
    file://0016-clk-shmobile-r8a7795-Add-CAN-FD-peripheral-clock.patch \
    file://0017-arm64-dts-r8a7795-Add-CAN-external-clock-support.patch \
    file://0018-arm64-dts-r8a7795-Add-CAN-support.patch \
    file://0019-can-rcar_can-add-enable-and-standby-control-pins.patch \
    file://0020-can-rcar-canfd-Add-Renesas-R-Car-CAN-FD-driver.patch \
    file://0021-arm64-dts-r8a7795-Add-CAN-FD-support.patch \
    file://0022-can-rcar_canfd-use-explicit-clock_select-from-dts.patch \
    file://0023-can-rcar_canfd-add-enable-and-standby-control-pins.patch \
    file://0040-H3-Maxim-MAX9286-support-support-10635-10640-cameras.patch \
    file://0050-arm64-renesas-Salvator-X-View-board-support.patch \
    file://0051-arm64-renesas-H3ULCB-HAD-support.patch \
    file://0052-arm64-renesas-H3ULCB-View-board-support.patch \
    file://0053-arm64-dts-r8a7795-h3ulcb-had-set-console-from-rdrive.patch \
    file://0054-arm64-dts-r8a7795-h3ulcb-had-route-RAVB-to-rdrive.patch \
    ${@base_conditional("LVDSCAMERA_ONE", "1", " file://0055-arm64-dts-r8a7795-view-boards-stream-from-1-cam.patch", "", d)} \
    ${@base_conditional("RAVB_DEBUG", "1", " file://0056-net-ethernet-renesas-ravb-packets-dump.patch", "", d)} \
"

SRC_URI_append_h3ulcb = " \
    file://leds.cfg \
    file://h3ulcb.cfg \
"

SRC_URI_append_salvator-x = " \
    file://salvator-x.cfg \
"

KERNEL_DEVICETREE_append_h3ulcb = '${@ \
    " renesas/r8a7795-h3ulcb-had.dtb " if 'h3ulcb-had' in '${MACHINE_FEATURES}' else \
    " renesas/r8a7795-h3ulcb-view.dtb " if 'h3ulcb-view' in '${MACHINE_FEATURES}' else \
    ""}'

KERNEL_DEVICETREE_append_salvator-x = '${@ \
    " renesas/r8a7795-salvator-x-view.dtb " if 'salvator-x-view' in '${MACHINE_FEATURES}' else \
    ""}'
