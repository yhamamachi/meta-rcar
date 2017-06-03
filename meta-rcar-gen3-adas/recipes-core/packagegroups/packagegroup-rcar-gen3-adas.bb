DESCRIPTION = "Demo package"
LICENSE = "GPL"

inherit packagegroup

PACKAGES = " \
	packagegroup-opencv-sdk \
	packagegroup-surroundview \
"

RDEPENDS_packagegroup-surroundview = '${@ " \
    spacenavd \
    libspnav \
    glm \
    nlopt \
    gstreamer1.0-omx \
    gstreamer1.0-plugins-base-app libgstapp-1.0 \
    yaml-cpp \
" if 'surroundview' in '${DISTRO_FEATURES}' else ""}'

RDEPENDS_packagegroup-opencv-sdk = '${@ " \
    opencv \
    opencv-apps \
    opencv-samples \
    opencv-dbg \
    opencv-staticdev \
    python-opencv \
    libopencv-calib3d \
    libopencv-contrib \
    libopencv-core \
    libopencv-features2d \
    libopencv-flann \
    libopencv-gpu \
    libopencv-highgui \
    libopencv-imgproc \
    libopencv-legacy \
    libopencv-ml \
    libopencv-nonfree \
    libopencv-objdetect \
    libopencv-photo \
    libopencv-stitching \
    libopencv-superres \
    libopencv-video \
    libopencv-videostab \
    libopencv-ocl  \
    gstreamer1.0-plugins-base-app \
" if 'opencv-sdk' in '${DISTRO_FEATURES}' else ""}'