DESCRIPTION = "BSP packages (explicitly requested by Renesas)"

LICENSE = "BSD-3-Clause & GPLv2+ & LGPLv2+"

inherit packagegroup

PACKAGES = " \
    packagegroup-bsp-v3x \
"

RDEPENDS_packagegroup-bsp-v3x = " \
    i2c-tools \
    iio-utils \
    kernel-devicetree \
    kernel-modules \
    spidev-dbg spidev-test \
    v4l2-fw \
    netevent \
    media-ctl libv4l \
    utest-cam-imr-drm \
"

