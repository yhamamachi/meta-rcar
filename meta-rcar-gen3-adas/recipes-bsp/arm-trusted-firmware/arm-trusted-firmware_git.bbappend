FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

ATFW_OPT_append = " ${@base_conditional("CA57CA53BOOT", "1", " PSCI_DISABLE_BIGLITTLE_IN_CA57BOOT=0", "", d)}"

SRC_URI_append = " \
    file://0001-plat-rcar-bl2_secure_setting-Enable-access-to-RPC.patch \
"
