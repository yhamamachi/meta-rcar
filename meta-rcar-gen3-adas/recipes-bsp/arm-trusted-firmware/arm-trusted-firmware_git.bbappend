FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

COMPATIBLE_MACHINE_eagle = "eagle"
COMPATIBLE_MACHINE_v3msk = "v3msk"
COMPATIBLE_MACHINE_condor = "condor"
COMPATIBLE_MACHINE_v3hsk = "v3hsk"
COMPATIBLE_MACHINE_falcon = "falcon"
ATFW_OPT_r8a77970 = "LSI=V3M RCAR_DRAM_SPLIT=0 RCAR_LOSSY_ENABLE=0 PMIC_ROHM_BD9571=0 RCAR_SYSTEM_SUSPEND=0 SPD=none"
ATFW_OPT_r8a77980 = "LSI=V3H RCAR_DRAM_SPLIT=0 RCAR_LOSSY_ENABLE=0 PMIC_ROHM_BD9571=0 RCAR_SYSTEM_SUSPEND=0 SPD=none RCAR_SECURE_BOOT=0"
ATFW_OPT_r8a779a0 = "LSI=V3U RCAR_DRAM_SPLIT=0 RCAR_LOSSY_ENABLE=0 PMIC_ROHM_BD9571=0 RCAR_SYSTEM_SUSPEND=0 SPD=none RCAR_SECURE_BOOT=0 CTX_INCLUDE_AARCH32_REGS=0"

ATFW_OPT_append = " ${@oe.utils.conditional("CA57CA53BOOT", "1", " PSCI_DISABLE_BIGLITTLE_IN_CA57BOOT=0", "", d)}"
ATFW_OPT_append = " LIFEC_DBSC_PROTECT_ENABLE=0"
ATFW_OPT_append_rcar-gen3-v3x = " RCAR_AVS_SETTING_ENABLE=0"
ATFW_OPT_RPC = "${@oe.utils.conditional("DISABLE_RPC_ACCESS", "1", " RCAR_RPC_HYPERFLASH_LOCKED=1", "RCAR_RPC_HYPERFLASH_LOCKED=0", d)}"
ATFW_OPT_append = " ${ATFW_OPT_RPC}"

SRC_URI_append = " \
    file://0001-plat-renesas-rcar-bl31-Enable-RPC-access-if-necessar.patch \
    file://0002-plat-rcar_sip_svc-Fix-build-error-when-PMIC_ROHM_BD9.patch \
    file://0003-lib-psci-Fix-CPU0-offline-issue-on-the-V3x-SoCs.patch \
    file://0004-drivers-renesas-io_memdrv-Invalidate-cache-before-ex.patch \
    file://0005-drivers-renesas-rcar-pfc-Update-common-registers.patch \
    file://0006-plat-renesas-rcar-Add-R-Car-V3H-support.patch \
    file://0007-renesas-Remove-redundant-definitions.patch \
    file://0008-plat-renesas-rcar-Add-R-Car-V3U-support.patch \
    file://0009-plat-renesas-Workaround-bakery_lock-build-issue.patch \
    file://0010-plat-renesas-Add-ICUMXA-support.patch \
    file://0011-renesas-rcar-bl2_plat_setup-Workaround-U-Boot-cache-.patch \
    file://0012-V3U-PSCI-support-WIP.patch \
    file://0013-plat-renesas-rcar-V3U-System-reset-support.patch \
    file://0014-plat-rcar-common-disable-R-Car-PCIe-fixup-if-V3U.patch \
    file://0015-renesas-rcar-preliminary-gicv3-support.patch \
    file://0016-plat-renesas-rcar-aarch64-Add-GICv3-interrupt-props.patch \
    file://0017-TF-A-GIC-driver-Add-barrier-before-eoi.patch \
    file://0018-lib-cpu-Check-SCU-presence-in-DSU-before-accessing-D.patch \
"

# Override the do_ipl_opt_compile function to add the ${ATFW_OPT_RPC} option
do_ipl_opt_compile () {
    oe_runmake distclean
    oe_runmake bl2 bl31 rcar_layout_tool rcar_srecord PLAT=${PLATFORM} SPD=opteed MBEDTLS_COMMON_MK=1 ${EXTRA_ATFW_OPT} ${ATFW_OPT_LOSSY} ${ATFW_OPT_RPC}
}

do_ipl_opt_deploy_append () {
    install -m 0644 ${S}/tools/renesas/rcar_layout_create/bootparam_sa0.bin ${DEPLOYDIR}/bootparam_sa0-${EXTRA_ATFW_CONF}.bin
    install -m 0644 ${S}/tools/renesas/rcar_layout_create/cert_header_sa6.bin ${DEPLOYDIR}/cert_header_sa6-${EXTRA_ATFW_CONF}.bin
}

do_deploy_append() {
    install -m 0644 ${S}/tools/renesas/rcar_layout_create/bootparam_sa0.bin ${DEPLOYDIR}/bootparam_sa0.bin
    install -m 0644 ${S}/tools/renesas/rcar_layout_create/cert_header_sa6.bin ${DEPLOYDIR}/cert_header_sa6.bin
}

do_deploy_append_rcar-gen3-v3x() {
    rm -f ${DEPLOYDIR}/bootparam_sa0.bin
    rm -f ${DEPLOYDIR}/bootparam_sa0.srec
}
