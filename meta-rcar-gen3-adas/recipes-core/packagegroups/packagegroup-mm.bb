DESCRIPTION = "Multimedia packages"

LICENSE = "BSD-3-Clause & GPLv2+ & LGPLv2+"

inherit packagegroup

PACKAGES = " \
    packagegroup-mm \
"

# Various multimedia packages
RDEPENDS_packagegroup-mm = " \
    mm-init \
    pulseaudio-server \
    pulseaudio-misc \
    pulseaudio-module-cli \
    pulseaudio-module-remap-sink \
    pulseaudio-module-remap-source \
    pulseaudio-module-loopback \
    gstreamer1.0-plugins-good-pulse \
"
