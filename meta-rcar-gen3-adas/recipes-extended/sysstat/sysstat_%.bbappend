inherit python-dir

do_install_append() {
	# install contrib tools like irqstat into a separate package
    install -m 755 ${S}/contrib/irqtop/irqtop ${D}${bindir}
    install -m 755 ${S}/contrib/irqstat/irqstat ${D}${bindir}
}

PACKAGE_BEFORE_PN += "${PN}-contrib"

RDEPENDS_${PN}-contrib += " \
    perl-module-getopt-long \
    ${PYTHON_PN}-terminal \
    ${PYTHON_PN}-textutils \
    numactl \
"

FILES_${PN}-contrib = " \
    ${bindir}/irqtop \
    ${bindir}/irqstat \
"

