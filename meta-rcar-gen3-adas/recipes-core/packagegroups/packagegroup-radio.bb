DESCRIPTION = "Radio packages"

LICENSE = "BSD-3-Clause & GPLv2+ & LGPLv2+"

inherit packagegroup

PACKAGES = " \
    packagegroup-radio \
"

RDEPENDS_packagegroup-radio = " \
    si-tools \
    linux-firmware-wl18xx \
    wireless-tools \
    ti-bt \
    ti-bt-firmware \
    bluez5 \
    bluez5-testtools \
    pulseaudio-module-bluez5-device \
    pulseaudio-module-bluez5-discover \
    pulseaudio-module-bluetooth-discover \
    pulseaudio-module-bluetooth-policy \
    ofono \
    ofono-tests \
"
