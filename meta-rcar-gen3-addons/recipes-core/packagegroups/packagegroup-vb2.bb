DESCRIPTION = "Videobox 2 init scripts package group"
LICENSE = "MIT"


inherit packagegroup

PACKAGES = "\
    packagegroup-vb2 \
    "

RDEPENDS_packagegroup-vb2 = "\
    vb2-hw-init \
    vb2-can-bus-init \
    "
