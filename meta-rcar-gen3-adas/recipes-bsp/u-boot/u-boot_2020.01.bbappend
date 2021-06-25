FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

RPC_DISABLED = " \
    file://0008-arm-dts-r8a77970-Disable-RPC-on-all-R-Car-V3M-boards.patch \
    file://0009-arm-dts-r8a77980-Disable-RPC-on-all-R-Car-V3H-boards.patch \
    file://0010-arm-dts-r8a779a0-falcon-Disable-RPC-on-V3U-Falcon-bo.patch \
"

SRC_URI_append = " \
    file://0001-configs-r8a779a0_falcon-Enable-askenv-command.patch \
    file://0002-clk-renesas-cpg-Update-SD-IF-clock-handling.patch \
    file://0003-clk-renesas-r8a77970-cpg-mssr-Fix-SD-clock.patch \
    file://0004-ARM-dts-r8a77970-eagle-Add-eMMC-support.patch \
    file://0005-configs-r8a77970-Eagle-Enable-MMC-support-by-default.patch \
    file://0006-arm-renesas-Enable-RPC-HF-MTD-support-for-all-Salvat.patch \
    file://0007-arm-renesas-Enable-RPC-HF-MTD-support-for-all-ULCB-b.patch \
    ${@oe.utils.conditional("DISABLE_RPC_ACCESS", "1", "${RPC_DISABLED}", "", d)} \
"
