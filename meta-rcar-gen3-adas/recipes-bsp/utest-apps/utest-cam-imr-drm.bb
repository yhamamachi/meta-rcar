SUMMARY = "Unit test for VIN-IMR-DRM camera capture pipe"
LICENSE = "CLOSED"

inherit cmake

S = "${WORKDIR}/git"

BRANCH = "rcar_gen3"
SRC_URI = "git://github.com/CogentEmbedded/utest-cam-imr-drm.git;branch=${BRANCH} \
	   file://0001-Fix-Yocto-Project-2.8-Zeus-build-issue.patch \
	   file://0002-Improve-crop-handling-for-buggy-drivers.patch \
	   file://0003-VIN-PNG-dump-support-grey-format.patch"
#SRCREV = "cecd8094fe5d6c41b8a4401fd1bad3961a10b173"
#Go back for gray fmt support (broken during 8ch support?)
SRCREV = "4b01ac9158e92d1d0559e6172fd9e2e6018f170b"

PV = "v1.0+renesas+git"

DEPENDS = " \
    libspnav \
    libdrm \
    libinput \
    gstreamer1.0-plugins-base \
    mmngr-user-module \
    mmngrbuf-user-module \
"

do_install() {
    install -d ${D}${bindir}
    install -m 755 ${B}/utest/utest-cam-imr-drm ${D}${bindir}
}

EXTRA_OECMAKE += " -DCMAKE_SYSROOT=${STAGING_DIR_TARGET}"
