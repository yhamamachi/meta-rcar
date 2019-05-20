FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-uboot-ravb-remove-APSR-quirk.patch \
    file://0002-net-ravb-fix-unsafe-phy-access.patch \
    file://0003-configs-rcar-gen3-Enable-askenv-command.patch \
    file://0004-configs-rcar-gen3-Enable-GPT-support.patch \
    file://0005-ARM-rmobile-Add-R8A77970-V3MSK-board-support.patch \
    file://0006-ARM-rmobile-Add-R8A77980-Condor-board-support.patch \
    file://0007-ARM-rmobile-Add-R8A77980-V3HSK-board-support.patch \
    file://0008-ARM-rmobile-Add-R8A7795-H3ULCB-HAD-board-support.patch \
    file://0009-arm-renesas-Enable-RPC-HF-MTD-support-for-all-Salvat.patch \
    file://0010-arm-renesas-Enable-RPC-HF-MTD-support-for-all-ULCB-b.patch \
"
