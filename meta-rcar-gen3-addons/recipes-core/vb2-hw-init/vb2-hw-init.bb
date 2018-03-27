SUMMARY = "Startup	 script for Videobox V2 hardware"
LICENSE = "CLOSED"

SRC_URI = "file://vb2-hw-init.sh"

S = "${WORKDIR}"

do_install() {
	install -d ${D}/${sysconfdir}/init.d
	install -m755 ${WORKDIR}/vb2-hw-init.sh ${D}/${sysconfdir}/init.d
}

inherit allarch update-rc.d

INITSCRIPT_NAME = "vb2-hw-init.sh"
INITSCRIPT_PARAMS = "start 20 2 3 4 5 . stop 20 0 1 6 ."
