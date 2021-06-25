RDEPENDS_packagegroup-bsp-testpkg_append = " \
    br-test \
    tbench \
    e2fsprogs-resize2fs \
    iio-utils \
    spidev-dbg spidev-test \
    v4l2-fw \
"

RDEPENDS_packagegroup-bsp-utest_append = " \
    kernel-module-mmngr \
    kernel-module-mmngrbuf \
    mmngr-user-module \
    linux-renesas-uapi \
    netevent \
    utest-cam-imr-drm \
"

RDEPENDS_packagegroup-bsp-testpkg_append = " \
    capture \
"
