FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

PATHCTOOL="git"

SRC_URI_append_rcar-gen3 = " \
    file://0001-Add-virtual-output-support.patch \
    file://0002-Add-gst-recorder-for-h264-output-streaming.patch \
    file://0003-Make-streaming-available-with-gl-and-v4l2-renderer.patch \
    file://0004-Provide-additional-settings-to-omx-recorder-via-reco.patch \
"
