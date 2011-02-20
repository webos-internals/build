NAME = $(shell basename $(shell pwd))
TITLE = F14 Tomcat (Pre2)
DEVICE = pre2
CATEGORY = Experimental
VERSIONS = 2.0.1-11
APPINFO_DESCRIPTION = The latest bleeding-edge totally-experimental kernel from uNiXpSyChO.<br><br>\
Features:<br> * screenstate<br> * Manual Voltage manipulation<br> * 1.4GHz\
<br> * Temp Scaling<br> * Low Battery scaleback<br> * No more TMC error!<br><br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br><br>${KERNEL_DISCLAIMER}<br>
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-11", "log" : [ "wifi hack. added back missing tickle stuff." ] }, \
{ "version" : "${WEBOS_VERSION}-10", "log" : [ "robustified temp monitoring. split battery and temp monitoring workers. override fixes." ] }, \
{ "version" : "${WEBOS_VERSION}-8", "log" : [ "fix vdd2 freq display" ] }, \
{ "version" : "${WEBOS_VERSION}-7", "log" : [ "Initial version. BLEEDING Alpha release!" ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-11: wifi hack. added back missing tickle stuff.<br>${WEBOS_VERSION}-10: robustified temp monitoring. split battery and temp monitoring workers. override fixes.<br>${WEBOS_VERSION}-8: fix vdd2 freq display<br>${WEBOS_VERSION}-7: Initial version. BLEEDING Alpha release!

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = psychobuild/F14.patch \
		 sensors/omap34xx_temp.patch sensors/defconfig-safe.patch \
		 makefiletune/armMakefile.diff \
		 compcache/compcache.patch memory/tmc_mem.patch
EXTERNAL_MODULES = compcache/compcache-0.5.4
KERNEL_DEFCONFIG = psychobuild/F14.config
TYPE = Kernel

include ../../support/kernel.mk

# Override the compiler
CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs09q1armel/build/arm-2009q1/bin/arm-none-linux-gnueabi-
