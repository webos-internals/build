NAME = $(shell basename $(shell pwd))
TITLE = Stock Kernel (Palm Pre/Pre+)
DESCRIPTION = An unmodified kernel, recompiled from source code published by Palm.<br>\
This kernel should be identical in function to the official webOS ${WEBOS_VERSION} kernel from Palm.<br>\
It is useful mainly for testing the kernel packaging and upgrade processes.<br>${KERNEL_DISCLAIMER}
CATEGORY = Stable
VERSIONS = 1.4.1-1

HOMEPAGE = http://opensource.palm.com
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = 
# Perhaps consider this in the future:
# KERNEL_PATCHES = sensors/sensors_temp_omap34xx.patch sensors/defconfig-safe.patch

include ../../support/kernel.mk
