NAME = $(shell basename $(shell pwd))
TITLE = PsychoKernel F102A Delta Dagger (Palm Pre/Pre+)
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
KERNEL_PATCHES = overclocking/opp6-720-opp7-800-min-opp5.patch overclocking/defconfig-safe.patch \
		 sensors/sensors_temp_omap34xx.patch sensors/defconfig-safe.patch \
		 screenstate/screenstate.patch screenstate/defconfig-safe.patch \
		 psychobuild/kstrip.patch
KERNEL_DEFCONFIG = psychobuild/F102A.config

include ../../support/kernel.mk
