FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

COMPATIBLE_MACHINE_eagle = "eagle"
COMPATIBLE_MACHINE_v3msk = "v3msk"
COMPATIBLE_MACHINE_condor = "condor"
COMPATIBLE_MACHINE_v3hsk = "v3hsk"

KF_ENABLE_M3V3SK8GB := "${@bb.utils.contains("KERNEL_DEVICETREE", "renesas/r8a7796-m3ulcb-2x4g.dtb", "1", "", d)}"

SRC_URI_append = " \
    ${@oe.utils.conditional("DISABLE_RPC_ACCESS", "1", "", " file://hyperflash.cfg", d)} \
    file://nvme.cfg \
    file://imr.cfg \
    file://disable-unused.cfg \
    file://enable.cfg \
    file://renesas.scc \
    ${@oe.utils.conditional("KF_ENABLE_SD3", "1", " file://0047-arm64-dts-renesas-ulcb-kf-enable-sd3.patch", "", d)} \
    ${@oe.utils.conditional("KF_ENABLE_MOST", "1", " file://0048-arm64-dts-renesas-ulcb-kf-enable-most.patch", "", d)} \
    ${@oe.utils.conditional("KF_PANEL_MODEL", "TX31D200VM0BAA", " file://0121-arm64-dts-renesas-ulcb-kf-Set-KOE-TX31D200VM0BAA-128.patch", "", d)} \
    ${@oe.utils.conditional("KF_PANEL_MODEL", "AA104XD12", " file://0121-arm64-dts-renesas-ulcb-kf-Set-Mitsubishi-AA104XD12-1.patch", "", d)} \
    ${@oe.utils.conditional("KF_PANEL_MODEL", "AA121TD01", " file://0121-arm64-dts-renesas-ulcb-kf-Set-Mitsubishi-AA121TD01-1.patch", "", d)} \
    ${@oe.utils.conditional("KF_ENABLE_M3V3SK8GB", "1", " file://0525-arm64-dts-renesas-Add-r8a7796-m3ulcb-2x4g-kf.dts.patch", "", d)} \
"

SRC_URI_append_h3ulcb = " file://ulcb.cfg"
SRC_URI_append_m3ulcb = " file://ulcb.cfg"
SRC_URI_append_m3nulcb = " file://ulcb.cfg"
SRC_URI_append_salvator-x = " file://salvator-x.cfg"

SRC_URI_append_rcar-gen3-v3x = " \
    file://v3x.cfg \
    file://cma.cfg \
    file://ipmmu.cfg \
    ${@oe.utils.conditional("DISABLE_RPC_ACCESS", "1", "", " file://qspi.cfg", d)} \
"

KERNEL_DEVICETREE_append_h3ulcb = " \
    renesas/r8a7795-es1-h3ulcb-kf.dtb \
    renesas/r8a7795-h3ulcb-kf.dtb \
    renesas/r8a7795-h3ulcb-4x2g-kf.dtb \
    renesas/ulcb-kf-cn10-gmsl2.dtbo \
    renesas/ulcb-kf-cn10-pca.dtbo \
    renesas/ulcb-kf-cn11.dtbo \
    renesas/ulcb-kf-cn11-gmsl2.dtbo \
    renesas/ulcb-kf-cn11-pca.dtbo \
    renesas/ulcb-kf-most.dtbo \
    renesas/ulcb-kf-sd3.dtbo \
"

KERNEL_DEVICETREE_append_m3ulcb = " \
    renesas/r8a7796-m3ulcb-kf.dtb \
    ${@oe.utils.conditional("KF_ENABLE_M3V3SK8GB", "1", " renesas/r8a7796-m3ulcb-2x4g-kf.dtb", "", d)} \
"

KERNEL_DEVICETREE_append_m3nulcb = " \
    renesas/r8a77965-m3nulcb-kf.dtb \
"

KERNEL_DEVICETREE_append_rcar-gen3-v3x = " \
    renesas/r8a77970-es1-eagle.dtb \
    renesas/r8a77970-es1-eagle-function.dtb \
    renesas/r8a77970-es1-v3msk.dtb \
    renesas/r8a77970-eagle.dtb \
    renesas/r8a77970-eagle-function.dtb \
    renesas/r8a77970-v3msk.dtb \
    renesas/r8a77980-condor.dtb \
    renesas/r8a77980-v3hsk.dtb \
"

# Prefer generic-uio driver over kernel drivers
KERNEL_MODULE_PROBECONF_append = " rcar_imr"
KERNEL_MODULE_PROBECONF_append = " rcar_csi2"
KERNEL_MODULE_PROBECONF_append = " rcar_vin"
KERNEL_MODULE_PROBECONF_append = " vsp1"
KERNEL_MODULE_PROBECONF_append = " rcar-du-drm"
KERNEL_MODULE_PROBECONF_append = " rcar_lvds"
module_conf_rcar_imr = "blacklist rcar_imr"
module_conf_rcar_csi2 = "blacklist rcar_csi2"
module_conf_rcar_vin = "blacklist rcar_vin"
module_conf_vsp1 = "blacklist vsp1"
module_conf_rcar-du-drm = "blacklist rcar-du-drm"
module_conf_rcar_lvds = "blacklist rcar_lvds"

KERNEL_MODULE_AUTOLOAD_append = " uio_pdrv_genirq"
KERNEL_MODULE_PROBECONF_append = " uio_pdrv_genirq"
module_conf_uio_pdrv_genirq_append = 'options uio_pdrv_genirq of_id="generic-uio"'

# Install RCAR Gen3 specific UAPI headers
do_install_append_rcar-gen3() {
    install -d ${D}/usr/include/linux/
#    install -m 0644 ${STAGING_KERNEL_DIR}/include/uapi/linux/rcar-imr.h ${D}/usr/include/linux/
    install -m 0644 ${STAGING_KERNEL_DIR}/include/uapi/linux/rcar-ipmmu-domains.h ${D}/usr/include/linux/
}

PACKAGES += "${PN}-uapi"
FILES_${PN}-uapi = "/usr/include"
