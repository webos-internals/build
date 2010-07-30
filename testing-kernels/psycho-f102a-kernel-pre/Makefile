NAME = $(shell basename $(shell pwd))
TITLE = F102A Delta Dagger (Palm Pre/Pre+)
CATEGORY = Experimental
DEVICECOMPATIBILITY = [\"Pre\"]
VERSIONS = 1.4.1-83 1.4.2-83 1.4.5-83
APPINFO_DESCRIPTION = The latest bleeding-edge totally-experimental kernel from uNiXpSyChO.<br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-75", "log" : [ "Numerous screenstate updates. IO scheduler changes. No more screen brightness checking." ] }, \
{ "version" : "${WEBOS_VERSION}-59", "log" : [ "screenstate updates for charging.  CPU IDLE update. disable mem overcommit." ] }, \
{ "version" : "${WEBOS_VERSION}-43", "log" : [ "Initial public release, rebased off UberKernel ${WEBOS_VERSION}-40" ] }, \
]
CHANGELOG =  ${WEBOS_VERSION}-75: Numerous screenstate updates. IO scheduler changes. No more screen brightness checking.<br>${WEBOS_VERSION}-59: screenstate updates for charging.  CPU IDLE update. disable mem overcommit.<br>${WEBOS_VERSION}-43: Initial public release, rebased off UberKernel ${WEBOS_VERSION}-40

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = overclocking/opp6-720-opp7-800-min-opp5.patch \
		 sensors/sensors_temp_omap34xx.patch \
		 screenstate/screenstate.patch screenstate/cap-min-freq.patch \
		 compcache/compcache.patch memory/tmc_mem.patch \
		 makefiletune/armMakefile.diff
EXTERNAL_MODULES = compcache/compcache-0.5.4

KERNEL_DEFCONFIG = psychobuild/F102A.config
KERNEL_UPSTART   = psychobuild/F102A.upstart
TYPE = Kernel

include ../../support/kernel.mk
