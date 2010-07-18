NAME = $(shell basename $(shell pwd))
TITLE = SR71 Blackbird (Palm Pre/Pre+)
CATEGORY = Experimental
VERSIONS = 1.4.1-81 1.4.2-81 1.4.5-81
APPINFO_DESCRIPTION = The latest bleeding-edge totally-experimental kernel from uNiXpSyChO.<br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-81", "log" : [ "turn down the afterburners. raise voltage on 6 & 7 slots. bring back anticipatory." ] }, \
{ "version" : "${WEBOS_VERSION}-80", "log" : [ "up voltages. add back OPP1 and OPP2 slots." ] }, \
{ "version" : "${WEBOS_VERSION}-78", "log" : [ "Initial release for 1.2GHz support. NextGen Screenstate with temp monitoring." ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-81: turn down the afterburners. raise voltage on 6 & 7 slots. bring back anticipatory.<br>${WEBOS_VERSION}-80: up voltages. add back OPP1 and OPP2 slots.<br>${WEBOS_VERSION}-78: Initial release for 1.2GHz support. NextGen Screenstate with temp monitoring.<br>

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = psychobuild/SR71-overclocking.patch \
		 sensors/sensors_temp_omap34xx.patch \
		 psychobuild/nexgen-screenstate.patch \
		 compcache/compcache.patch memory/tmc_mem.patch \
		 makefiletune/armMakefile.diff
KERNEL_MODULES = compcache/compcache-0.5.4

KERNEL_DEFCONFIG = psychobuild/SR71.config
#KERNEL_UPSTART   = psychobuild/F102A.upstart

include ../../support/kernel.mk
