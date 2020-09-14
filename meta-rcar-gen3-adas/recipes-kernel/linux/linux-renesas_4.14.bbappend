FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

COMPATIBLE_MACHINE_eagle = "eagle"
COMPATIBLE_MACHINE_v3msk = "v3msk"
COMPATIBLE_MACHINE_condor = "condor"
COMPATIBLE_MACHINE_v3mzf = "v3mzf"
COMPATIBLE_MACHINE_v3hsk = "v3hsk"

SRC_URI_append = " \
    ${@oe.utils.conditional("DISABLE_RPC_ACCESS", "1", "", " file://hyperflash.cfg", d)} \
    ${@oe.utils.conditional("SDHI_SEQ", "1", " file://sdhi_seq.cfg", "", d)} \
    file://nvme.cfg \
    file://imr.cfg \
    file://disable-unused.cfg \
    file://renesas.scc \
    ${@oe.utils.conditional("KF_ENABLE_SD3", "1", " file://0047-arm64-dts-renesas-ulcb-kf-enable-sd3.patch", "", d)} \
    ${@oe.utils.conditional("KF_ENABLE_MOST", "1", " file://0048-arm64-dts-renesas-ulcb-kf-enable-most.patch", "", d)} \
    ${@oe.utils.conditional("KF_ENABLE_IMX219", "1", " file://0115-arm64-dts-renesas-ulcb-kf-enable-enable-IMX219.patch", "", d)} \
    ${@oe.utils.conditional("KF_PANEL_MODEL", "TX31D200VM0BAA", " file://0121-arm64-dts-renesas-ulcb-kf-Set-KOE-TX31D200VM0BAA-128.patch", "", d)} \
    ${@oe.utils.conditional("KF_PANEL_MODEL", "AA104XD12", " file://0121-arm64-dts-renesas-ulcb-kf-Set-Mitsubishi-AA104XD12-1.patch", "", d)} \
    ${@oe.utils.conditional("KF_PANEL_MODEL", "AA121TD01", " file://0121-arm64-dts-renesas-ulcb-kf-Set-Mitsubishi-AA121TD01-1.patch", "", d)} \
    ${@oe.utils.conditional("VB_ENABLE_FDPLINK", "1", " file://0391-arm64-dts-renesas-Enable-FDPLink-output-on-V3x-Video.patch", "", d)} \
"

SRC_URI_append_h3ulcb = " file://ulcb.cfg"
SRC_URI_append_m3ulcb = " file://ulcb.cfg"
SRC_URI_append_m3nulcb = " file://ulcb.cfg"
SRC_URI_append_salvator-x = " file://salvator-x.cfg"

SRC_URI_append_rcar-gen3-v3x = " \
    file://v3x.cfg \
    file://cma.cfg \
    ${@oe.utils.conditional("DISABLE_RPC_ACCESS", "1", "", " file://qspi.cfg", d)} \
"

KERNEL_DEVICETREE_append_h3ulcb = " \
    renesas/r8a7795-es1-h3ulcb-view.dtb \
    renesas/r8a7795-es1-h3ulcb-had-alfa.dtb \
    renesas/r8a7795-es1-h3ulcb-had-beta.dtb \
    renesas/r8a7795-es1-h3ulcb-kf.dtb \
    renesas/r8a7795-es1-h3ulcb-vb.dtb \
    renesas/r8a7795-es1-h3ulcb-vb2.dtb \
    renesas/r8a7795-es1-h3ulcb-vbm.dtb \
    renesas/r8a7795-h3ulcb-view.dtb \
    renesas/r8a7795-h3ulcb-had-alfa.dtb \
    renesas/r8a7795-h3ulcb-had-beta.dtb \
    renesas/r8a7795-h3ulcb-kf.dtb \
    renesas/r8a7795-h3ulcb-4x2g-kf.dtb \
    renesas/r8a7795-h3ulcb-vb.dtb \
    renesas/r8a7795-h3ulcb-vb2.dtb \
    renesas/r8a7795-h3ulcb-vb2.1.dtb \
    renesas/r8a7795-h3ulcb-vbm.dtb \
    renesas/r8a7795-h3ulcb-4x2g-vb.dtb \
    renesas/r8a7795-h3ulcb-4x2g-vb2.dtb \
    renesas/r8a7795-h3ulcb-4x2g-vb2.1.dtb \
    renesas/r8a7795-h3ulcb-4x2g-vbm.dtb \
    renesas/r8a7795-h3ulcb-vb2.1-gmsl2.dtb \
    renesas/r8a7795-h3ulcb-4x2g-vb2.1-gmsl2.dtb \
"

KERNEL_DEVICETREE_append_m3ulcb = " \
    renesas/r8a7796-m3ulcb-view.dtb \
    renesas/r8a7796-m3ulcb-kf.dtb \
"

KERNEL_DEVICETREE_append_m3nulcb = " \
    renesas/r8a77965-m3nulcb-kf.dtb \
"

KERNEL_DEVICETREE_append_salvator-x = " \
    renesas/r8a7795-es1-salvator-x-view.dtb \
    renesas/r8a7795-salvator-x-view.dtb \
    renesas/r8a7796-salvator-x-view.dtb \
"

KERNEL_DEVICETREE_append_rcar-gen3-v3x = " \
    renesas/r8a77970-es1-eagle.dtb \
    renesas/r8a77970-es1-eagle-function.dtb \
    renesas/r8a77970-eagle.dtb \
    renesas/r8a77970-eagle-function.dtb \
    renesas/r8a77970-es1-v3msk.dtb \
    renesas/r8a77970-es1-v3msk-kf.dtb \
    renesas/r8a77970-es1-v3msk-vbm.dtb \
    renesas/r8a77970-es1-v3msk-vbm-v2.dtb \
    renesas/r8a77970-es1-v3msk-vbm-v3.dtb \
    renesas/r8a77970-es1-v3msk-view.dtb \
    renesas/r8a77970-v3msk.dtb \
    renesas/r8a77970-v3msk-kf.dtb \
    renesas/r8a77970-v3msk-vbm.dtb \
    renesas/r8a77970-v3msk-vbm-v2.dtb \
    renesas/r8a77970-v3msk-vbm-v3.dtb \
    renesas/r8a77970-v3msk-view.dtb \
    renesas/r8a77970-v3mzf.dtb \
    renesas/r8a77980-condor.dtb \
    renesas/r8a77980-v3hsk.dtb \
    renesas/r8a77980-v3hsk-vbm.dtb \
    renesas/r8a77980-v3hsk-vbm-v2.dtb \
    renesas/r8a77980-v3hsk-vbm-v3.dtb \
    renesas/r8a77980-v3hsk-vb-4ch.dtb \
    renesas/r8a77980-v3hsk-vb-8ch.dtb \
    renesas/r8a77980-v3hsk-vb-gmsl-8ch.dtb \
    renesas/r8a77980-v3hsk-vb-gmsl2-2x2.dtb \
    renesas/r8a77980-v3hsk-vb-gmsl2-4.dtb \
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
    install -m 0644 ${STAGING_KERNEL_DIR}/include/uapi/linux/rcar-imr.h ${D}/usr/include/linux/
    install -m 0644 ${STAGING_KERNEL_DIR}/include/uapi/linux/rcar-ipmmu-domains.h ${D}/usr/include/linux/
}

PACKAGES += "${PN}-uapi"
FILES_${PN}-uapi = "/usr/include"
