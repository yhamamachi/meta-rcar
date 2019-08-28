SUMMARY = "A collection of cpuburn programs tuned for different ARM hardware"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=ae766a928c7d79122a7441142f174500"

COMPATIBLE_MACHINE = "aarch64"

SRC_URI = " \
    git://git@github.com/kuoe0/cpuburn-arm.git;protocol=ssh;nobranch=1 \
"

SRCREV = "bfef5117c535c4bfece7ba7659c59eeca798d5ac"

S = "${WORKDIR}/git"

do_compile() {
    ${CC} ${CFLAGS} ${LDFLAGS} cpuburn-a53.S -o cpuburn-a53
}

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${S}/cpuburn-a53 ${D}${bindir}/
}

