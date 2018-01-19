

RDEPENDS_${PN}_remove = " \
	qtwebkit-dev \
	qtwebkit-mkspecs \
	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtwebkit-qmlplugins', '', d)} \
"
