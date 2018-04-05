
IMAGE_INSTALL_append = " \
    ${@base_contains('MACHINE_FEATURES', 'videobox_v2','packagegroup-vb2',' ',d)} \
    ${@base_contains('MACHINE_FEATURES', 'videobox','br-test',' ',d)} \
"
