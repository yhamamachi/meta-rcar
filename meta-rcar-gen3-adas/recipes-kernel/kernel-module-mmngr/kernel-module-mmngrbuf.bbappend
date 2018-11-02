FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " file://0001-free-dma-buf-on-error.patch"

KERNEL_MODULE_AUTOLOAD += "mmngrbuf"
KERNEL_MODULE_PROBECONF += "mmngrbuf"
module_conf_mmngrbuf = ""
