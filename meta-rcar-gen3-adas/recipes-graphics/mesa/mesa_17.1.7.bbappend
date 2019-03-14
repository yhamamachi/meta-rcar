
ALLOW_EMPTY_libwayland-egl = "1"

do_install_append() {
    if [ -z "$(ls -A ${D}${libdir}/pkgconfig)" ]; then
        rm -rf ${D}${libdir}/pkgconfig
    fi
}
