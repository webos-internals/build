NAME = $(shell basename $(shell pwd))
TITLE = F105 Thunderchief (Palm Pre/Pre+)
CATEGORY = Experimental
VERSIONS = 1.4.1-68 1.4.2-68 1.4.5-68
APPINFO_DESCRIPTION = The latest bleeding-edge totally-experimental kernel from uNiXpSyChO.<br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-68", "log" : [ "Fix for current_mA in TS detection." ] }, \
{ "version" : "${WEBOS_VERSION}-67", "log" : [ "make screenstate monitor current and voltage. bug fixes. remove brightness checking. overclocking tweaks." ] }, \
{ "version" : "${WEBOS_VERSION}-60", "log" : [ "Voltage tweaking." ] }, \
{ "version" : "${WEBOS_VERSION}-59", "log" : [ "screenstate updates. CPU IDLE update.  New freqs." ] }, \
{ "version" : "${WEBOS_VERSION}-47", "log" : [ "Initial release for 1GHz support" ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-68: Fix for current_mA in TS detection.<br>${WEBOS_VERSION}-67: make screenstate monitor current and voltage. bug fixes. remove brightness checking. overclocking tweaks.<br>${WEBOS_VERSION}-60: Voltage tweaking.<br>${WEBOS_VERSION}-59: screenstate updates. CPU IDLE update.  New freqs.<br>${WEBOS_VERSION}-47: Initial release for 1GHz support

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = overclocking/F105-overclocking.patch \
		 sensors/sensors_temp_omap34xx.patch \
		 screenstate/screenstate.patch \
		 compcache/compcache.patch memory/tmc_mem.patch \
		 makefiletune/armMakefile.diff
KERNEL_MODULES = compcache/compcache-0.5.4

KERNEL_DEFCONFIG = psychobuild/F105.config
KERNEL_UPSTART   = psychobuild/F102A.upstart

include ../../support/kernel.mk
