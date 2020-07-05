SUMMARY = "BSP configuration (default/ADAS) script"
LICENSE = "CLOSED"

S = "${WORKDIR}"

SCRIPT_NAME_r8a77970 = "bsp-config_v3m.sh"
SCRIPT_NAME_r8a77980 = "bsp-config_v3h.sh"

SRC_URI = " \
    file://${SCRIPT_NAME} \
"

do_install() {
    install -d ${D}${bindir}
    install -m 755 ${S}/${SCRIPT_NAME} ${D}${bindir}/bsp-config.sh
}
