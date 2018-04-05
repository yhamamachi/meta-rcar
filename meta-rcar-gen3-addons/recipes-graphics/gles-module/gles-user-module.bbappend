FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

pkg_postinst_${PN}() {
    if ${@bb.utils.contains('DISTRO_FEATURES', 'surroundview', 'true', 'false', d)}; then
        echo 'WseglNumBuffers=4' >> $D${sysconfdir}/etc/powervr.ini
    fi
}