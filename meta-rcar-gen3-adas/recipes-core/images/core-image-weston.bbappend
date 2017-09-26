inherit ${@base_contains('DISTRO_FEATURES', 'qt5','populate_sdk_qt5',' ',d)}

IMAGE_INSTALL_append = " \
    packagegroup-opencv-sdk \
    packagegroup-surroundview \
    utest-cam-imr-drm \
    packagegroup-common \
    packagegroup-qt5 \
"

CONFLICT_DISTRO_FEATURES = "x11"