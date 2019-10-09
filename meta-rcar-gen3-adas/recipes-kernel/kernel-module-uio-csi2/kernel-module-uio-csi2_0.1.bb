SUMMARY = "CSI2 UIO Driver Module"
LICENSE = "GPLv2 & MIT"
LIC_FILES_CHKSUM = " \
    file://GPL-COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
    file://MIT-COPYING;md5=fea016ce2bdf2ec10080f69e9381d378 \
    "

inherit module

PR = "r0"
PV = "0.1"

SRC_URI = " \
    file://Makefile \
    file://uio_csi2.c \
    file://GPL-COPYING \
    file://MIT-COPYING \
    "

S = "${WORKDIR}"

# Prefer V4L2 rcar_csi2 driver over UIO uio_csi2
KERNEL_MODULE_AUTOLOAD_append = " rcar_csi2"
# KERNEL_MODULE_AUTOLOAD_append = "uio_csi2"
KERNEL_MODULE_PROBECONF_append = "uio_csi2"

module_conf_uio_csi2 = 'blacklist uio_csi2'
module_conf_uio_csi2_r8a7795 = "options uio_csi2 clear_int"
module_conf_uio_csi2_r8a7796 = "options uio_csi2 clear_int"
