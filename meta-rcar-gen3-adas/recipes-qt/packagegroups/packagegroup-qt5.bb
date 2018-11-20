DESCRIPTION = "Qt5 packages"

LICENSE = "BSD-3-Clause & GPLv2+ & LGPLv2+"

inherit packagegroup

PACKAGES = " \
    packagegroup-qt5 \
"

QT_WAYLAND_PKGS = '${@ " \
    qtwayland \
    qtwayland-tools \
    qtwayland-plugins \
" if 'wayland' in '${DISTRO_FEATURES}' else ""}'

RDEPENDS_packagegroup-qt5 =  '${@ " \
    qtbase-plugins \
    qtbase-examples \
    qtdeclarative \
    qtdeclarative-tools \
    qtdeclarative-qmlplugins \
    qtxmlpatterns \
    qtxmlpatterns-examples \
    qtmultimedia \
    qtmultimedia-plugins \
    qtmultimedia-qmlplugins \
    qtquickcontrols2 \
    qtquickcontrols2-qmlplugins \
    qtquickcontrols \
    qtquickcontrols-qmlplugins \
    qtgraphicaleffects \
    qtgraphicaleffects-qmlplugins \
    qtserialbus \
    qtsvg \
    qt3d \
    qt3d-runtime \
    qtlocation \
    qtsvg-plugins \
    ${QT_WAYLAND_PKGS} \
    icu libicudata libicuuc libicui18n \
    packagegroup-fonts-truetype \
" if 'qt5' in '${DISTRO_FEATURES}' else ""}'