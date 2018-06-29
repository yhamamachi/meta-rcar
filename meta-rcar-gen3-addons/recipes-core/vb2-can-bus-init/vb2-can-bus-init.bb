SUMMARY = "Startup script for Videobox V2 CAN buses"
LICENSE = "CLOSED"

SRC_URI = "file://can_settings.sh \
           file://99-persistent-can-names.rules \
"

S = "${WORKDIR}"

do_install() {
	install -d ${D}/${sysconfdir}/init.d
	install -m755 ${WORKDIR}/can_settings.sh ${D}/${sysconfdir}/init.d

    #support for udev
    install -d ${D}/${sysconfdir}/udev/rules.d
    install -m 0644 ${WORKDIR}/99-persistent-can-names.rules ${D}/${sysconfdir}/udev/rules.d
}

inherit update-rc.d

INITSCRIPT_NAME = "can_settings.sh"
INITSCRIPT_PARAMS = "start 20 2 3 4 5 . stop 20 0 1 6 ."
