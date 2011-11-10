NAME = $(shell basename $(shell pwd))
TITLE = F14 Tomcat (Pre2)
DEVICE = pre2
CATEGORY = Alpha
VERSIONS = 2.1.0-38
APPINFO_DESCRIPTION = The latest bleeding-edge totally-experimental kernel from uNiXpSyChO.<br><br>\
Features:<br> * Screenstate-v1<br> * Manual Voltage manipulation<br> * 1.4GHz\
<br> * Temp Scaling<br> * Low Battery scaleback<br> * No more TMC error!<br><br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br><br>${KERNEL_DISCLAIMER}<br>
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-38", "log" : [ "boot lower OPP. make temp scaling more aggressive. move LCD on/off code to proper place. dont override policy->min when scaling." ] }, \
{ "version" : "${WEBOS_VERSION}-23", "log" : [ "try a new lowmem hack." ] }, \
{ "version" : "${WEBOS_VERSION}-22", "log" : [ "rebuild for webOS 2.1.0." ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-38: boot lower OPP. make temp scaling more aggressive. move LCD on/off code to proper place. dont override policy->min when scaling.<br>${WEBOS_VERSION}-23: try a new lowmem hack.<br>${WEBOS_VERSION}-22: rebuild for webOS 2.1.0.<br>

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = psychobuild/F14.patch \
		 sensors/omap34xx_temp.patch \
		 makefiletune/armMakefile.diff \
		 compcache/compcache.patch memory/tmc_mem.patch
EXTERNAL_MODULES = compcache/compcache-0.5.4
KERNEL_DEFCONFIG = psychobuild/F14.config
TYPE = Kernel

include ../../support/kernel.mk

# Override the compiler
CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs09q1armel/build/arm-2009q1/bin/arm-none-linux-gnueabi-
