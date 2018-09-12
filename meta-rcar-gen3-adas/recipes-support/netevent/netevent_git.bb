SUMMARY = "netevent - share input devices over net"
SECTION = "misc"

LICENSE = "CLOSED"

PN = "netevent"
PE = "1"
PV = "0.1"
PR = "r1"

SRC_URI = "git://github.com/CogentEmbedded/netevent.git"

SRCREV = "295fe47e6b2587cc78aba3cb6277e49648c7e852"

S = "${WORKDIR}/git"

B = "${S}"

do_install() {
    install -d ${D}${bindir}

    install -m 0755 netevent ${D}${bindir}/
    install -m 0755 devname ${D}${bindir}/
}
