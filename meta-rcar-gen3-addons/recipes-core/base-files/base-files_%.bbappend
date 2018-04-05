FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://videobox_v2/fstab \
    file://videobox/fstab \
    file://videobox_v2/fstab_ro \
    file://videobox/fstab_ro \
    file://cameras \
"


do_install_append() {
    if ${@bb.utils.contains('MACHINE_FEATURES', 'videobox_v2', 'true', 'false', d)}; then
        if ${@bb.utils.contains('DISTRO_FEATURES', 'videobox-recorder', 'true', 'false', d)}; then
            install -m 0644 ${WORKDIR}/videobox_v2/fstab_ro ${D}/${sysconfdir}/fstab
        else
            install -m 0644 ${WORKDIR}/videobox_v2/fstab ${D}/${sysconfdir}/fstab
        fi
        echo "videobox2" > ${D}${sysconfdir}/hostname
    fi
    if ${@bb.utils.contains('MACHINE_FEATURES', 'videobox', 'true', 'false', d)}; then
        if ${@bb.utils.contains('DISTRO_FEATURES', 'videobox-recorder', 'true', 'false', d)}; then
            install -m 0644 ${WORKDIR}/videobox/fstab_ro ${D}/${sysconfdir}/fstab
        else
            install -m 0644 ${WORKDIR}/videobox/fstab ${D}/${sysconfdir}/fstab
        fi
        echo "videobox" > ${D}${sysconfdir}/hostname
    fi

    install -m 0644 ${WORKDIR}/cameras  ${D}/${sysconfdir}/
}

FILES_${PN} += "\
    ${sysconfdir}/cameras \
"
