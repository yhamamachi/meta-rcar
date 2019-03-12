FILESEXTRAPATHS_prepend := '${THISDIR}/${PN}-${PV}:'

SRC_URI_append = " \
    file://0001-Allow-to-boot-without-input-device.patch \
    file://0002-Share-toytoolkit-lib.patch \
    file://0003-add-window-set-fullscreen-at-output.patch \
    file://0004-Add-display_poll-function.patch \
    file://0005-Add-wl-ivi-shell-surface-creating-support.patch \
    file://0006-Add-widget_set_surface_allocation-func.patch \
    file://0007-Add-call-for-setting-fullscreen-with-IVI.patch \
"

FILES_${PN} += " ${libdir}/libweston-toytoolkit*"

do_install_append() {
    if [ "X${USE_MULTIMEDIA}" = "X1" ]; then
        if [ "${MACHINE}" = "m3nulcb" ] ; then
            sed -i 's|media1|media0|g' ${WORKDIR}/weston.ini
        fi
    fi
}
