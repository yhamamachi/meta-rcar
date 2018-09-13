DESCRIPTION = "Linux iccom library"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=442d4e9f738ff4d05ae6215ae20caa6c"

PN = "libiccom"
PR = "r0"
RDEPENDS_${PN} = "kernel-module-iccom"

SRC_URI = "git://github.com/CogentEmbedded/libiccom.git;branch=master"
SRCREV = "2dd7fa9add05f310e0604a3d8de6b895a0c51c90"
S = "${WORKDIR}/git"

COMPATIBLE_MACHINE = "eagle|condor|v3msk|v3mzf|v3hsk"

PACKAGE_ARCH = "${MACHINE_ARCH}"

CFLAGS[unexport] = "1"

do_compile() {
    cd ${S}/
    oe_runmake
}

do_install () {
    # Create destination folders
    install -d ${D}${libdir}
    install -d ${D}${includedir}
    install -d ${D}${bindir}

    # Copy library
    install -m 0755 ${S}/out/libiccom.so.1.0 ${D}${libdir}

    # Create symbolic link
    cd ${D}${libdir}
    ln -sf libiccom.so.1.0 libiccom.so.1
    ln -sf libiccom.so.1 libiccom.so

    install -m 0644 ${S}/public/* ${D}${includedir}

    install -m 0755 ${S}/out/iccom-test ${D}${bindir}
}

RPROVIDES_${PN} += "linux-iccomlib"

PACKAGES =+ "libiccom-test"
FILES_libiccom-test = "${bindir}/iccom-test"
