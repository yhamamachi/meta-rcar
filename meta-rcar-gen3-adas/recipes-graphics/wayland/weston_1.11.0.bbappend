FILESEXTRAPATHS_prepend := '${THISDIR}/${PN}-${PV}:'

SRC_URI_append = " \
    file://0001-Allow-to-boot-without-input-device.patch \
"
