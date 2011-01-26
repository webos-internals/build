NAME = $(shell basename $(shell pwd))
TITLE = SR71 Blackbird (Pre2)
DEVICE = pre2
CATEGORY = Experimental
VERSIONS = 2.0.1-9
APPINFO_DESCRIPTION = The latest bleeding-edge totally-experimental kernel from uNiXpSyChO.<br><br>\
Features:<br> * screenstate and ondemandtcl<br> * Smartrelex Voltage tuning<br> * 1.2GHz\
<br> * Temp Scaling<br> * Low Battery scaleback<br> * No more TMC error!<br><br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br><br>${KERNEL_DISCLAIMER}<br>
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-9", "log" : [ "Initial version for Pre2." ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-9: Initial version for Pre2.

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = psychobuild/SR71.patch \
		 sensors/omap34xx_temp.patch sensors/defconfig-safe.patch \
		 makefiletune/armMakefile.diff \
		 compcache/compcache.patch memory/tmc_mem.patch
EXTERNAL_MODULES = compcache/compcache-0.5.4
KERNEL_DEFCONFIG = psychobuild/SR71.config
TYPE = Kernel

include ../../support/kernel.mk

# Override the compiler
CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs09q1armel/build/arm-2009q1/bin/arm-none-linux-gnueabi-
