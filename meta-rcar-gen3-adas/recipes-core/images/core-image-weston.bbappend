IMAGE_INSTALL_append = " \
    packagegroup-mm \
    packagegroup-radio \
    packagegroup-bsp \
    ${@bb.utils.contains('DISTRO_FEATURES', "opencv-sdk", "packagegroup-opencv-sdk", "", d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', "surroundview", "packagegroup-surroundview", "", d)} \
"

# CONFLICT_DISTRO_FEATURES = "x11"
