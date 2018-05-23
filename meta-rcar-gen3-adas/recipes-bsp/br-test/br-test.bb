SUMMARY = "Tool to communicate with Broadcom switch"
SECTION = "core"

LICENSE = "CLOSED"

PE = "1"
PV = "0.1"

SRC_URI = " \
    file://br-test.tar.gz \
    file://init-eth-1000.sh \
"

S = "${WORKDIR}/br-test"

do_install() {
    install -d ${D}${bindir}
    install -m 755 br_test ${D}${bindir}
    install -d ${D}/${sysconfdir}/init.d
    install -m755 ${WORKDIR}/init-eth-1000.sh ${D}/${sysconfdir}/init.d
}

inherit update-rc.d

INITSCRIPT_NAME = "init-eth-1000.sh"
INITSCRIPT_PARAMS = "start 20 2 3 4 5 . stop 20 0 1 6 ."

FILES_${PN} = " \
    ${bindir}/br_test \
    ${sysconfdir}/init.d/init-eth-1000.sh \
"
