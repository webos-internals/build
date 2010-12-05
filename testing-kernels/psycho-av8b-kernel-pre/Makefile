NAME = $(shell basename $(shell pwd))
TITLE = AV8B Harrier II (Palm Pre/Pre+)
CATEGORY = Experimental
DEVICE = pre
VERSIONS = 1.4.5-134
APPINFO_DESCRIPTION = The latest bleeding-edge totally-experimental kernel from uNiXpSyChO.<br><br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br><br>${KERNEL_DISCLAIMER}<br>
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-134", "log" : [ "Initial release. Dynamic voltage scaling based on CPU load. vdemand gov." ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-134: Initial release. Dynamic voltage scaling based on CPU load. vdemand gov.<br>

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = sensors/sensors_temp_omap34xx.patch \
		 psychobuild/AV8B.patch \
		 compcache/compcache.patch memory/tmc_mem.patch \
		 makefiletune/armMakefile.diff
EXTERNAL_MODULES = compcache/compcache-0.5.4

KERNEL_DEFCONFIG = psychobuild/AV8B.config
KERNEL_UPSTART   = psychobuild/F102A.upstart
TYPE = Kernel

include ../../support/kernel.mk
