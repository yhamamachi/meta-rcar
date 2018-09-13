SUMMARY = "netevent - share input devices over net"
SECTION = "misc"

LICENSE = "CLOSED"

PN = "netevent"
PE = "1"
PV = "0.1"
PR = "r1"

SRC_URI = "git://github.com/CogentEmbedded/netevent.git"

SRCREV = "e058a35039fe1ceca9eeb154feba8e41412121a3"

S = "${WORKDIR}/git"

B = "${S}"

do_install() {
    install -d ${D}${bindir}

    install -m 0755 netevent ${D}${bindir}/
    install -m 0755 devname ${D}${bindir}/
}
