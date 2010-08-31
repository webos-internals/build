NAME = $(shell basename $(shell pwd))
TITLE = F104A Starfighter (Palm Pre/Pre+)
CATEGORY = Experimental
DEVICECOMPATIBILITY = [\"Pre\"]
VERSIONS = 1.4.1-107 1.4.2-107 1.4.5-107
APPINFO_DESCRIPTION = The latest bleeding-edge totally-experimental kernel from uNiXpSyChO.<br>\
For more information, visit ${HOMEPAGE}<br>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}<br>
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-107", "log" : [ "fix low end." ] }, \
{ "version" : "${WEBOS_VERSION}-106", "log" : [ "new engine and afterburners." ] }, \
{ "version" : "${WEBOS_VERSION}-83", "log" : [ "Merge with F102A codebase. Repackage." ] }, \
{ "version" : "${WEBOS_VERSION}-43", "log" : [ "Initial public release, rebased off UberKernel ${WEBOS_VERSION}-40" ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-107: fix low end<br>${WEBOS_VERSION}-106: new engine and afterburners.<br>${WEBOS_VERSION}-83: Merge with F102A codebase. Repackage.<br>${WEBOS_VERSION}-43: Initial public release, rebased off UberKernel ${WEBOS_VERSION}-40

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = psychobuild/F104A-overclocking.patch \
		 sensors/sensors_temp_omap34xx.patch \
		 screenstate/screenstate.patch \
		 compcache/compcache.patch memory/tmc_mem.patch \
		 overclocking/override.patch \
		 makefiletune/armMakefile.diff
EXTERNAL_MODULES = compcache/compcache-0.5.4

KERNEL_DEFCONFIG = psychobuild/F104A.config
KERNEL_UPSTART   = psychobuild/F104A.upstart
TYPE = Kernel

include ../../support/kernel.mk
