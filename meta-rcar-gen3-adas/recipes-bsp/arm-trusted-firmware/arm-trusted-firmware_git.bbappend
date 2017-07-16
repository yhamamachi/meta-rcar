FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

ATFW_OPT_append = " ${@base_conditional("CA57CA53BOOT", "1", " PSCI_DISABLE_BIGLITTLE_IN_CA57BOOT=0", "", d)}"
ATFW_OPT_append += " ${@base_conditional("DISABLE_RPC_ACCESS", "1", " RCAR_DISABLE_NONSECURE_RPC_ACCESS=1", "", d)}"

SRC_URI_append = " \
    file://0001-plat-renesas-rcar-Make-RPC-secure-settings-optional.patch \
"
