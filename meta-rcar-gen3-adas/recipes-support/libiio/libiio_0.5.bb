require ${BPN}.inc

S = "${WORKDIR}/git"

SRC_URI = "git://github.com/analogdevicesinc/${BPN}.git"

# tag: v0.5
SRCREV = "6cb4f4de68039456272fe94e84ab196ed372d3b2"

LIC_FILES_CHKSUM ??= "file://COPYING;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
