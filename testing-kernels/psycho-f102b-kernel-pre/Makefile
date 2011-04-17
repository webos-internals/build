NAME = $(shell basename $(shell pwd))
TITLE = F102B Delta Dagger (Pre/Pre+)
CATEGORY = Experimental
DEVICE = pre
VERSIONS = 2.1.0-37
APPINFO_DESCRIPTION = The latest beta kernel from uNiXpSyChO.<br><br>\
Features:<br> * screenstate V2<br> * Dynamic voltage scaling<br> * 800MHz\
<br> * Temp Scaling<br> * Low Battery scaleback<br> * No more TMC error!<br> * Lean and fast. No bloat!<br><br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br><br>${KERNEL_DISCLAIMER}<br>
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-37", "log" : [ "screenstate fixes. improve voltage reset on freq change. move LCD on/off code to correct place. RC6." ] }, \
{ "version" : "${WEBOS_VERSION}-26", "log" : [ "add preemption. RC5." ] }, \
{ "version" : "${WEBOS_VERSION}-25", "log" : [ "rebuild for webOS 2.1.0" ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-37: screenstate fixes. improve voltage reset on freq change. move LCD on/off code to correct place. RC6.<br>${WEBOS_VERSION}-26: add preemption. RC5.<br>${WEBOS_VERSION}-25: rebuild for webOS 2.1.0<br>

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = sensors/omap34xx_temp.patch \
		 psychobuild/F102B.patch \
		 psychobuild/preempt.patch \
		 memory/tmc_mem.patch \
		 makefiletune/armMakefile.diff
#EXTERNAL_MODULES = compcache/compcache-0.5.4

KERNEL_DEFCONFIG = psychobuild/F102B.config
#KERNEL_UPSTART   = psychobuild/F102B.upstart
TYPE = Kernel

include ../../support/kernel.mk
