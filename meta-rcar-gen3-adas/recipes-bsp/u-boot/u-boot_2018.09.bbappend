FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-uboot-ravb-remove-APSR-quirk.patch \
    file://0002-net-ravb-fix-unsafe-phy-access.patch \
    file://0003-configs-rcar-gen3-Enable-askenv-command.patch \
    file://0004-configs-rcar-gen3-Enable-GPT-support.patch \
    file://0005-i2c-rcar_i2c-Add-R-Car-Gen3-support.patch \
    file://0006-configs-rcar-gen3-common-Increase-CONFIG_SYS_MALLOC_.patch \
    file://0007-clk-renesas-cpg-Update-SD-IF-clock-handling.patch \
    file://0008-clk-renesas-r8a77970-cpg-mssr-Fix-SD-clock.patch \
    file://0009-pinctl-renesas-pfc-r8a77970-Fix-PFC-flags.patch \
    file://0010-arm-dts-r8a77970-Add-mmc0-node.patch \
    file://0011-arm-r8a77970-eagle-Add-eMMC-support.patch \
    file://0012-mmc-renesas_sdhi-Add-R-Car-V3H-support.patch \
    file://0013-ARM-rmobile-Add-R8A77970-V3MSK-board-support.patch \
    file://0014-ARM-rmobile-Add-R8A77980-Condor-board-support.patch \
    file://0015-ARM-rmobile-Add-R8A77980-V3HSK-board-support.patch \
    file://0016-ARM-rmobile-Add-R8A7795-H3ULCB-HAD-board-support.patch \
    file://0017-arm-renesas-v3msk-Add-CPLD-support.patch \
    file://0018-arm-renesas-v3hsk-Add-CPLD-support.patch \
    file://0019-arm-renesas-Enable-RPC-HF-MTD-support-for-all-Salvat.patch \
    file://0020-arm-renesas-Enable-RPC-HF-MTD-support-for-all-ULCB-b.patch \
"
