require recipes-bsp/u-boot/u-boot.inc

DEPENDS += "dtc-native"

UBOOT_URL = "git://github.com/renesas-rcar/u-boot.git"
BRANCH = "v2015.04/rcar-3.2.x"

LIC_FILES_CHKSUM = "file://Licenses/README;md5=c7383a594871c03da76b3707929d2919"

SRC_URI = "${UBOOT_URL};branch=${BRANCH}"
SRC_URI_append = " \
    file://0001-uboot-add-H3ULCB-board-support.patch \
    file://0002-uboot-ravb-add-chk-cut-for-speed-workaround.patch \
    file://0005-uboot-ravb-r8a7795-remove-PHY-skews.patch \
"
SRC_URI_append_h3ulcb = '${@ \
    " file://0003-uboot-H3ULCB-support-fixed-PHY.patch \
      file://0004-uboot-H3ULCB-console-on-scif1.patch \
      file://0006-uboot-h3ulcb-set-all-RAVB-pins-strengh-to-maximum.patch " \
    if 'h3ulcb-had' in '${MACHINE_FEATURES}' else \
    ""}'
SRCREV = "20a18bcee6603b94f7c745880d1fe09e98a70876"

PV = "v2015.04+git${SRCPV}"

EXTRA_OEMAKE_append = " KCFLAGS=-fgnu89-inline"

UBOOT_SREC ?= "u-boot-elf.srec"
UBOOT_SREC_IMAGE ?= "u-boot-elf-${MACHINE}-${PV}-${PR}.srec"
UBOOT_SREC_SYMLINK ?= "u-boot-elf-${MACHINE}.srec"

do_deploy_append() {
    install -m 644 ${S}/${UBOOT_SREC} ${DEPLOYDIR}/${UBOOT_SREC_IMAGE}
    cd ${DEPLOYDIR}
    rm -f ${UBOOT_SREC} ${UBOOT_SREC_SYMLINK}
    ln -sf ${UBOOT_SREC_IMAGE} ${UBOOT_SREC_SYMLINK}
    ln -sf ${UBOOT_SREC_IMAGE} ${UBOOT_SREC}
}
