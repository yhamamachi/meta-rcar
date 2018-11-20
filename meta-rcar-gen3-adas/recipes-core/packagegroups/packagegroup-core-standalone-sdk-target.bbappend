RDEPENDS_${PN}_append = " \
    packagegroup-opencv-sdk \
    ${@bb.utils.contains('DISTRO_FEATURES', "qt5", "packagegroup-qt5", "", d)} \
    packagegroup-surroundview \
    packagegroup-surroundview-drm \
"