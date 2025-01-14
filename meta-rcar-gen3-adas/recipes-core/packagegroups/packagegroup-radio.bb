DESCRIPTION = "Radio packages"

LICENSE = "BSD-3-Clause & GPLv2+ & LGPLv2+"

inherit packagegroup

PACKAGES = " \
    packagegroup-radio \
"

PULSEAUDIO_RADIO_PACKAGES = " \
    pulseaudio-module-bluetooth-discover \
    pulseaudio-module-bluetooth-policy \
    pulseaudio-module-bluez5-device \
    pulseaudio-module-bluez5-discover \
"

RDEPENDS_packagegroup-radio = " \
    bluez5 \
    bluez5-testtools \
    linux-firmware-wl18xx \
    ofono \
    ofono-tests \
    si-tools \
    ti-bt \
    ti-bt-firmware \
    iw \
    ${@bb.utils.contains('DISTRO_FEATURES', "pulseaudio", "${PULSEAUDIO_RADIO_PACKAGES}", "", d)} \
"
