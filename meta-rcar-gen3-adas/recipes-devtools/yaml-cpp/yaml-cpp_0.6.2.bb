DESCRIPTION = "yaml-cpp is a YAML parser and emitter in C++ matching the YAML 1.2 spec"
HOMEPAGE = "https://github.com/jbeder/yaml-cpp/"
SECTION = "libs"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=6a8aaf0595c2efc1a9c2e0913e9c1a2c"

DEPENDS = "boost"

PR = "r0"

S = "${WORKDIR}/yaml-cpp-${PN}-${PV}"

SRC_URI = "https://github.com/jbeder/yaml-cpp/archive/${PN}-${PV}.tar.gz"
SRC_URI[md5sum] = "5b943e9af0060d0811148b037449ef82"
SRC_URI[sha256sum] = "e4d8560e163c3d875fd5d9e5542b5fd5bec810febdcba61481fe5fc4e6b1fd05"

inherit cmake

EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DYAML_CPP_BUILD_TESTS=OFF"

FILES_${PN}-dev += "${libdir}/cmake"

