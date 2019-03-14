FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append_class-native = " file://1-3-elfutils-Fix-gcc-compile-time-alignment-errors.patch"
