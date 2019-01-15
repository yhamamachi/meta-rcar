FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-clk-renesas-Allow-reconfiguring-SDHI-clock-on-Gen3.patch \
    ${@bb.utils.contains('MACHINE_FEATURES', 'h3ulcb-had', ' file://0002-net-ravb-remove-APSR-quirk.patch', '', d)} \
    file://0003-net-ravb-fix-unsafe-phy-access.patch \
    file://0009-configs-rcar-gen3-common-Enable-askenv-command.patch \
    file://0011-configs-rcar-gen3-common-Enable-GPT-support.patch \
    file://0025-board-renesas-Add-Condor-board.patch \
    file://0028-board-renesas-Add-M3NULCB-board.patch \
    file://0040-arm-renesas-Enable-RPC-HF-MTD-support-for-all-Salvat.patch \
    file://0041-arm-renesas-Enable-RPC-HF-MTD-support-for-all-ULCB-b.patch \
    file://0042-arm-cpu-armv8-Disable-dcache.patch \
    ${@bb.utils.contains('MACHINE_FEATURES', 'h3ulcb-had', 'file://0061-board-renesas-ulcb-console-on-scif1.patch', '', d)} \
    ${@bb.utils.contains('MACHINE_FEATURES', 'h3ulcb-had', 'file://0062-board-renesas-ulcb-set-all-RAVB-pins-strengh-to-maximum.patch', '', d)} \
    ${@bb.utils.contains('MACHINE_FEATURES', 'h3ulcb-had', 'file://0063-board-renesas-ulcb-support-fixed-PHY.patch', '', d)} \
"
