FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    ${@bb.utils.contains('MACHINE_FEATURE', 'videobox_v2', 'file://videobox_v2/fstab', '', d)} \
"


do_install_append() {
    if ${@bb.utils.contains('MACHINE_FEATURE', 'videobox_v2', 'true', 'false', d)}; then
        install -m 0644 ${WORKDIR}/videobox_v2/fstab ${D}/${sysconfdir}/
    fi

}
