DESCRIPTION = "BSP packages (explicitly requested by Renesas)"

LICENSE = "BSD-3-Clause & GPLv2+ & LGPLv2+"

inherit packagegroup

PACKAGES = " \
    packagegroup-bsp \
    packagegroup-bsp-devdbg \
    packagegroup-bsp-custom \
"

# Packages mandatory for BSP (but often not needed)
RDEPENDS_packagegroup-bsp = " \
    git \
    git-perltools \
    make \
    cmake \
    gcc \
    g++ \
"

# Packages mandatory for BSP (useful for development/debug)
RDEPENDS_packagegroup-bsp-devdbg = " \
    opkg \
    perf \
    iperf3 \
    strace \
    trace-cmd \
    gdb \
    gdbserver \
    procps \
    vim \
    nano \
    iproute2 \
    iproute2-tc \
    linuxptp \
    openssh \
    openssh-sftp \
    openssh-sftp-server \
    devmem2 \
    wget \
    curl \
"

# Various packages needed for all boards
RDEPENDS_packagegroup-bsp-custom = " \
    kernel-modules \
    kernel-devicetree \
    can-utils \
    libsocketcan \
    spidev-dbg spidev-test \
    e2fsprogs \
    e2fsprogs-tune2fs \
    ethtool \
    pciutils \
    usbutils \
    util-linux \
    mtd-utils \
    capture \
    v4l2-fw \
    bonnie++ \
    lmbench \
    libpcap \
    eglibc-utils \
    ldd \
    rsync \
    iio-utils \
    most-tools \
    subversion \
"

# Utest (IMR, IMP, etc demos) related packages
RDEPENDS_packagegroup-bsp-utest = " \
    utest-cam-imr-drm \
    netevent \
    gstreamer1.0-plugins-base \
    libgstallocators-1.0 \
    gstreamer1.0-plugins-base-app \
    libgstapp-1.0 \
    libdrm \
    kernel-module-mmngr \
    kernel-module-mmngrbuf \
    mmngr-user-module \
    libyaml \
    libinput \
    linux-renesas-uapi \
"
