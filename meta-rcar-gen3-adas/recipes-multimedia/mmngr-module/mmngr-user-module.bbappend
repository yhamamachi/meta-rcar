FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

COMPATIBLE_MACHINE_eagle = "eagle"
COMPATIBLE_MACHINE_v3msk = "v3msk"
COMPATIBLE_MACHINE_condor = "condor"
COMPATIBLE_MACHINE_v3mzf = "v3mzf"
COMPATIBLE_MACHINE_v3hsk = "v3hsk"
COMPATIBLE_MACHINE_falcon = "falcon"

SRC_URI_append = " \
        file://0001-cached-buffers-support.patch;patchdir=${WORKDIR}/git \
"
