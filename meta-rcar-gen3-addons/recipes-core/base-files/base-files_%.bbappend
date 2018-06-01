FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://cameras \
"


do_install_append() {
    if ${@bb.utils.contains('MACHINE_FEATURES', 'videobox_v2', 'true', 'false', d)}; then
        echo "/dev/md0 /mnt auto defaults,nofail,noatime,data=writeback,commit=20,discard 0 0" >> ${D}/${sysconfdir}/fstab
        echo "/dev/mmcblk1p2 /home/root           auto       defaults,nofail             0  0" >> ${D}/${sysconfdir}/fstab
        echo "videobox2" > ${D}${sysconfdir}/hostname
    fi
    if ${@bb.utils.contains('MACHINE_FEATURES', 'videobox', 'true', 'false', d)}; then
        echo "/dev/nvme0n1p1 /mnt auto defaults,nofail,noatime,data=writeback,commit=20,discard 0 0" >> ${D}/${sysconfdir}/fstab
        echo "/dev/mmcblk1p2 /home/root           auto       defaults,nofail             0  0" >> ${D}/${sysconfdir}/fstab
        echo "videobox" > ${D}${sysconfdir}/hostname
    fi

    install -m 0644 ${WORKDIR}/cameras  ${D}/${sysconfdir}/
}

FILES_${PN} += "\
    ${sysconfdir}/cameras \
"
