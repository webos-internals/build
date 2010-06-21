NAME = $(shell basename $(shell pwd))
TITLE = F105 Thunderchief (Palm Pre/Pre+)
CATEGORY = Experimental
VERSIONS = 1.4.1-47 1.4.2-47 1.4.5-47
APPINFO_DESCRIPTION = The latest bleeding-edge totally-experimental kernel from uNiXpSyChO.<br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-47", "log" : [ "Initial release for 1GHz support" ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-47: Initial release for 1GHz support

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = overclocking/opp6-720-opp7-1005-min-opp5.patch \
		 sensors/sensors_temp_omap34xx.patch \
		 screenstate/screenstate.patch screenstate/cap-min-freq.patch \
		 compcache/compcache.patch memory/tmc_mem.patch \
		 makefiletune/armMakefile.diff
KERNEL_MODULES = compcache/compcache-0.5.4

KERNEL_DEFCONFIG = psychobuild/F102A.config
KERNEL_UPSTART   = psychobuild/F102A.upstart

include ../../support/kernel.mk
