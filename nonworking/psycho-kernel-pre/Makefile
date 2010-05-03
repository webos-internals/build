NAME = $(shell basename $(shell pwd))
TITLE = PsychoKernel (Palm Pre/Pre+)
DESCRIPTION = The latest bleeding-edge totally-experimental kernel from uNiXpSyChO.<br>${KERNEL_DISCLAIMER}
CATEGORY = Experimental
VERSIONS = 1.4.1-13
SCREENSHOTS = 

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = overclocking/opp6-720-opp7-800-min-opp5.patch overclocking/defconfig-safe.patch \
		 sensors/sensors_temp_omap34xx.patch sensors/defconfig-safe.patch \
		 screenstate/screenstate.patch screenstate/defconfig-safe.patch

include ../../support/kernel.mk
