FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-net-phy-support-fixed-PHY.patch \
    ${@bb.utils.contains('MACHINE_FEATURES', 'h3ulcb-had', ' file://0002-net-ravb-remove-APSR-quirk.patch', '', d)} \
    file://0003-net-ravb-fix-unsafe-phy-access.patch \
    file://0004-configs-rcar-gen3-add-CMD_GPIO.patch \
    file://0005-common-cmd_source.c-Fix-the-source-command-failure-u.patch \
    file://0006-configs-rcar-gen3-common-Enable-U-Boot-scripts.patch \
    file://0007-configs-rcar-gen3-common-Enable-echo-command.patch \
    file://0008-configs-rcar-gen3-common-Enable-setexpr-command.patch \
    file://0009-configs-rcar-gen3-common-Enable-askenv-command.patch \
    file://0010-configs-rcar-gen3-common-Enable-hush-parser.patch \
    file://0011-configs-rcar-gen3-common-Enable-GPT-support.patch \
    file://0012-ARM-rcar_gen3-Add-I2C-definitions.patch \
    file://0013-i2c-rcar_i2c-add-16bit-addressing.patch \
    file://0014-mtd-spi-QSPI-flash-support.patch \
    file://0019-tools-env-Correct-include-kconfig.patch \
    file://0020-arm-renesas-Add-Renesas-R8A7797-SoC-support.patch \
    file://0021-board-renesas-Add-V3M-Eagle-board.patch \
    file://0023-board-renesas-Add-V3MSK-board.patch \
    file://0024-arm-renesas-Add-Renesas-R8A7798-SoC-support.patch \
    file://0025-board-renesas-Add-Condor-board.patch \
    file://0026-board-renesas-Add-V3MZF-board.patch \
    file://0027-board-renesas-Add-V3HSK-board.patch \
    file://0028-board-renesas-Add-M3NULCB-board.patch \
    file://0041-ARM-rcar_gen3-Add-RPC-flash-definitions.patch \
    file://0042-mtd-Add-RPC-HyperFlash-support.patch \
    file://0043-board-renesas-salvator-x-Enable-RPC-clock.patch \
    file://0044-board-renesas-ulcb-Enable-RPC-clock.patch \
    file://0045-configs-r8a7795_salvator-x-Enable-RPC-HyperFlash-sup.patch \
    file://0046-configs-r8a7796_salvator-x-Enable-RPC-HyperFlash-sup.patch \
    file://0047-configs-h3ulcb-Enable-RPC-HyperFlash-support.patch \
    file://0048-configs-m3ulcb-Enable-RPC-HyperFlash-support.patch \
    file://0049-configs-m3nulcb-Enable-RPC-HyperFlash-support.patch \
    ${@bb.utils.contains('MACHINE_FEATURES', 'h3ulcb-had', ' file://0061-board-renesas-ulcb-console-on-scif1.patch', '', d)} \
    ${@bb.utils.contains('MACHINE_FEATURES', 'h3ulcb-had', ' file://0062-board-renesas-ulcb-set-all-RAVB-pins-strengh-to-maximum.patch', '', d)} \
    ${@bb.utils.contains('MACHINE_FEATURES', 'h3ulcb-had', ' file://0063-board-renesas-ulcb-support-fixed-PHY.patch', '', d)} \
"
