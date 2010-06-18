NAME = $(shell basename $(shell pwd))
TITLE = PsychoKernel F104A Starfighter (Palm Pre/Pre+)
CATEGORY = Experimental
VERSIONS = 1.4.1-40
APPINFO_DESCRIPTION = The latest bleeding-edge totally-experimental kernel from uNiXpSyChO.<br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-40", "log" : [ "Initial public release, rebased off UberKernel ${WEBOS_VERSION}-40" ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-40: Initial public release, rebased off UberKernel ${WEBOS_VERSION}-40

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = overclocking/opp6-720-opp7-800-min-opp5.patch \
		 sensors/sensors_temp_omap34xx.patch \
		 screenstate/screenstate.patch \
		 compcache/compcache.patch compcache/lowmemnotify-total-memory.patch \
		 makefiletune/armMakefile.diff
KERNEL_MODULES = compcache/compcache-0.5.4
KERNEL_DEFCONFIG = psychobuild/F104A.config

include ../../support/kernel.mk
