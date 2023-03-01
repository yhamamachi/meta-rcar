FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

COMPATIBLE_MACHINE_v3msk = "v3msk"
COMPATIBLE_MACHINE_v3hsk = "v3hsk"

KERNEL_MODULE_AUTOLOAD += "mmngrbuf"
KERNEL_MODULE_PROBECONF += "mmngrbuf"
module_conf_mmngrbuf = ""

# Support HW overlay mode
SRC_URI_append = "\
    file://0001-mmngr_drv-mmngrbuf-Take-care-of-any-migration-of-sca.patch \
"

