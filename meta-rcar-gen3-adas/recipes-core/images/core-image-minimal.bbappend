COMPATIBLE_MACHINE_v3msk = "v3msk"
COMPATIBLE_MACHINE_v3hsk = "v3hsk"

IMAGE_INSTALL_append = " \
    packagegroup-bsp-utest \
    packagegroup-bsp-devpkg \
    packagegroup-bsp-testpkg \
    packagegroup-bsp-v3x \
    packagegroup-bsp-python3 \
    packagegroup-v3x \
"

