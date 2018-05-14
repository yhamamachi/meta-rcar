SUMMARY = "Camera application test: V4L2->DRM"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=ddc54369736c59f0b2ff1490c67e91ca"

S = "${WORKDIR}/capture_drm"

DEPENDS = " libdrm"

export DRM_INCLUDEDIR = "${STAGING_DIR_TARGET}/usr/include/drm"

SRC_URI = " \
    file://capture_drm.tar.gz \
"

do_compile() {
    oe_runmake
}

do_install() {
    install -d ${D}${bindir}
    install -m 755 ${S}/capture_drm ${D}${bindir}
}

FILES_${PN} = " \
    ${bindir}/capture_drm \
"
