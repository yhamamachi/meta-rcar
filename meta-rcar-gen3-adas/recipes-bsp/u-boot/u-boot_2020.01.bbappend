FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

RPC_ENABLED = " \
    file://0017-arm-renesas-Enable-RPC-HF-MTD-support-for-all-Salvat.patch \
    file://0018-arm-renesas-Enable-RPC-HF-MTD-support-for-all-ULCB-b.patch \
"

RPC_DISABLED = " \
    file://0017-arm-dts-r8a77970-Disable-RPC-on-all-R-Car-V3M-boards.patch \
    file://0018-arm-dts-r8a77980-Disable-RPC-on-all-R-Car-V3H-boards.patch \
"

SRC_URI_append = " \
    file://0001-net-ravb-fix-unsafe-phy-access.patch \
    file://0002-configs-rcar-gen3-Enable-askenv-command.patch \
    file://0003-configs-rcar-gen3-common-Increase-CONFIG_SYS_MALLOC_.patch \
    file://0004-net-sh_eth-Toggle-PHY-GPIO-reset-pin.patch \
    file://0005-clk-renesas-cpg-Update-SD-IF-clock-handling.patch \
    file://0006-clk-renesas-r8a77970-cpg-mssr-Fix-SD-clock.patch \
    file://0007-ARM-dts-r8a77970-eagle-Add-eMMC-support.patch \
    file://0008-configs-r8a77970-Eagle-Enable-MMC-support-by-default.patch \
    file://0009-ARM-dts-r8a77970-Eagle-Add-RAVB-PHY-GPIO-reset-pin.patch \
    file://0010-spi-renesas_rpc_spi-Add-r8a77980-support.patch \
    file://0011-mmc-renesas_sdhi-Add-R-Car-V3H-support.patch \
    file://0012-ARM-rmobile-Add-R8A77970-V3MSK-board-support.patch \
    file://0013-ARM-rmobile-Add-R8A77980-V3HSK-board-support.patch \
    file://0014-ARM-rmobile-Add-R8A7795-H3ULCB-HAD-board-support.patch \
    file://0015-arm-renesas-v3msk-Add-CPLD-support.patch \
    file://0016-arm-renesas-v3hsk-Add-CPLD-support.patch \
    ${@oe.utils.conditional("DISABLE_RPC_ACCESS", "1", "${RPC_DISABLED}", "${RPC_ENABLED}", d)} \
    file://0019-mmc-mmc-Set-clock-when-reverting-to-safe-bus-mode.patch \
    file://0020-net-sh_eth-Workaround-cache-issues.patch \
    file://0021-net-sh_eth-Fix-RX-error-handling.patch \
"
