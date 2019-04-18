IMAGE_INSTALL_append = " \
    ${@bb.utils.contains('DISTRO_FEATURES', "opencv-sdk", "packagegroup-opencv-sdk", "", d)} \
    packagegroup-surroundview-drm \
    packagegroup-bsp \
    packagegroup-bsp-devdbg \
    packagegroup-bsp-custom \
    packagegroup-bsp-utest \
    packagegroup-bsp-python2 \
"

IMAGE_INSTALL_append_rcar-gen3-v3x = " \
    packagegroup-v3x \
"
