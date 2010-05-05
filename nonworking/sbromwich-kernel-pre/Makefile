NAME = $(shell basename $(shell pwd))
TITLE = SBromwichKernel (Palm Pre/Pre+)
CATEGORY = Experimental
VERSIONS = 1.4.1-16
APPINFO_DESCRIPTION = The latest bleeding-edge totally-experimental kernel from sbromwich.<br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "1.4.1-16", "log" : [ "Improved screenstate transition detection" ] }, \
{ "version" : "1.4.1-13", "log" : [ "Initial public release" ] }, \
]
CHANGELOG = 1.4.1-16: Improved screenstate transition detection.<br>1.4.1-13: Initial public release

HOMEPAGE = http://www.webos-internals.org/wiki/Application:SBromwichKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = overclocking/opp6-720-opp7-800-min-opp5.patch overclocking/defconfig-safe.patch \
		 sensors/sensors_temp_omap34xx.patch sensors/defconfig-safe.patch \
		 screenstate/screenstate.patch screenstate/defconfig-safe.patch

include ../../support/kernel.mk
