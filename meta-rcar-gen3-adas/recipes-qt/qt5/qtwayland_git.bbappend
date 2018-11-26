FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

DEPENDS_append_class-target = " mesa virtual/mesa "
DEPENDS_append_class-target = " gles-user-module wayland mesa virtual/egl"

SRC_URI_append = " \
    file://0001-Add-QT_WAYLAND_DISPLAY-variable-to-choose-display.patch \
"