IMAGE_INSTALL_append = " \
    ${@bb.utils.contains('DISTRO_FEATURES', "opencv-sdk", "packagegroup-opencv-sdk", "", d)} \
    packagegroup-surroundview \
    packagegroup-radio \
    packagegroup-bsp \
    packagegroup-bsp-devdbg \
    packagegroup-bsp-custom \
    packagegroup-bsp-utest \
    packagegroup-mm \
"

CONFLICT_DISTRO_FEATURES = "x11"
