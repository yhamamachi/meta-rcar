SUMMARY = "OpenGL Mathematics"
HOMEPAGE = "http://glm.g-truc.net"
DESCRIPTION = "OpenGL Mathematics (GLM) is a header only C++ mathematics library for graphics software based on the OpenGL Shading Language (GLSL) specifications."
LICENSE = "MIT"
SECTION = "multimedia"

inherit pkgconfig cmake

SRC_URI = "\
    https://github.com/g-truc/${BPN}/archive/${PV}.tar.gz \
"

ALLOW_EMPTY_${PN} = "1"

FILES_${PN}-dev += "/usr/lib/cmake/"

