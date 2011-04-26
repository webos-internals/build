NAME = $(shell basename $(shell pwd))
TITLE = SR71 Blackbird (Pre2)
DEVICE = pre2
CATEGORY = Experimental
VERSIONS = 2.1.0-40
APPINFO_DESCRIPTION = The latest bleeding-edge totally-experimental kernel from uNiXpSyChO.<br><br>\
Features:<br> * screenstate-v2 and ondemandtcl<br> * Voltage tweaking<br> * 1.2GHz\
<br> * Temp Scaling<br> * Low Battery scaleback<br> * No more TMC error!<br><br>\
For more information, visit ${HOMEPAGE}<br>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br><br>${KERNEL_DISCLAIMER}<br>
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-40", "log" : [ "cleanup compiler warnings. screenstate and override fixes." ] }, \
{ "version" : "${WEBOS_VERSION}-34", "log" : [ "fix unaligned access in voltage array. screenstate fixups. code cleanup. fix sysfs voltage input for voltage array (Govnah will happier)." ] }, \
{ "version" : "${WEBOS_VERSION}-25", "log" : [ "refresh for webOS 2.1.0. add SSv2 and override modules." ] }, \
{ "version" : "${WEBOS_VERSION}-9", "log" : [ "Initial version for Pre2." ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-40: cleanup compiler warnings. screenstate and override fixes.<br>${WEBOS_VERSION}-34: fix unaligned access in voltage array. screenstate fixups. code cleanup. fix sysfs voltage input for voltage array (Govnah will happier).<br>${WEBOS_VERSION}-25: refresh for webOS 2.1.0. add SSv2 and override modules.<br>${WEBOS_VERSION}-9: Initial version for Pre2.<br>

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = psychobuild/SR71-pre2.patch \
		 sensors/omap34xx_temp.patch \
		 psychobuild/ssv2-ovrd-pre2.patch \
		 makefiletune/armMakefile.diff \
		 compcache/compcache.patch memory/tmc_mem.patch
EXTERNAL_MODULES = compcache/compcache-0.5.4
KERNEL_DEFCONFIG = psychobuild/SR71-pre2.config
TYPE = Kernel

include ../../support/kernel.mk

# Override the compiler
CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs09q1armel/build/arm-2009q1/bin/arm-none-linux-gnueabi-
