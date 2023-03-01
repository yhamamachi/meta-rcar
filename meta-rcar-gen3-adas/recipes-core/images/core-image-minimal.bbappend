COMPATIBLE_MACHINE_v3msk = "v3msk"
COMPATIBLE_MACHINE_v3hsk = "v3hsk"

IMAGE_INSTALL_append = " \
    packagegroup-bsp \
    packagegroup-bsp-custom \
    packagegroup-bsp-devdbg \
    packagegroup-bsp-utest \
"

IMAGE_INSTALL_append_rcar-gen3-v3x = " \
    packagegroup-bsp-python3 \
    packagegroup-v3x \
    packagegroup-v3x-test \
"
