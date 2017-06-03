FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI = " \
	file://weston_exp.sh \
"

# Add Weston configuration script
do_install_append() {
    install -d ${D}/etc/profile.d
    install -m 0755 ${WORKDIR}/weston_exp.sh ${D}/etc/profile.d
}
FILES_${PN} += " /etc/profile.d/weston_exp.sh \
"
