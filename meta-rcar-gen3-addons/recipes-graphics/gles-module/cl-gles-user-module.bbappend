FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

pkg_postinst_${PN}() {
    echo 'WseglNumBuffers=4' >> $D${sysconfdir}/powervr.ini
}
