SUMMARY = "udev rules for R-Car Gen3 CV Library"
LICENSE = "CLOSED"

SRC_URI = " \
    file://51-imp.rules \
    file://52-cmem.rules \
    file://53-vip.rules \
    file://54-isp.rules \
    file://55-fcpr.rules \
    file://56-csi2.rules \
    file://57-vin.rules \
    file://58-vsp1.rules \
    file://59-du.rules \
    file://60-lvds.rules \
"

do_install () {
    install -d ${D}${sysconfdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/51-imp.rules ${D}${sysconfdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/52-cmem.rules ${D}${sysconfdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/53-vip.rules ${D}${sysconfdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/54-isp.rules ${D}${sysconfdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/55-fcpr.rules ${D}${sysconfdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/56-csi2.rules ${D}${sysconfdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/57-vin.rules ${D}${sysconfdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/58-vsp1.rules ${D}${sysconfdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/59-du.rules ${D}${sysconfdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/60-lvds.rules ${D}${sysconfdir}/udev/rules.d/
}
