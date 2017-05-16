FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://weston.service \
"

do_install_append() {
    if [ "X${USE_GLES}" = "X1" ]; then
        sed -e "/RequiresMountsFor=\/run/a Wants=rc.pvr.service" \
            -e "/RequiresMountsFor=\/run/a After=rc.pvr.service" \
            -e "s/\$OPTARGS/--idle-time=0 \$OPTARGS/" \
            -i ${D}/${systemd_system_unitdir}/weston.service
    fi

    if [ "X${USE_MULTIMEDIA}" = "X1" ]; then
        if [ "X${USE_V4L2_RENDERER}" = "X1" ]; then
            sed -e "s/\$OPTARGS/--use-v4l2 \$OPTARGS/" \
                -i ${D}/${systemd_system_unitdir}/weston.service
        fi
    fi
}
