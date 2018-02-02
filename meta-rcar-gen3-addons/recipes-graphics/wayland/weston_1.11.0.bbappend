FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

PATHCTOOL="git"

DEPENDS += " gstreamer1.0-plugins-base "

SRC_URI_append_rcar-gen3 = " \
    file://0001-Add-virtual-output-support.patch \
    file://0002-Add-gst-recorder-for-h264-output-streaming.patch \
    file://0003-Make-streaming-available-with-gl-and-v4l2-renderer.patch \
    file://0004-Provide-additional-settings-to-omx-recorder-via-reco.patch \
"

SRC_URI += " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'surroundview', 'file://weston_remove_repaint.ini', '', d)} \
"

do_install_append() {
    if ${@bb.utils.contains('DISTRO_FEATURES', 'surroundview', 'true', 'false', d)}; then
        install -m 0644 ${WORKDIR}/weston_remove_repaint.ini  ${D}/${sysconfdir}/xdg/weston/weston.ini
    fi
}
