NAME = $(shell basename $(shell pwd))
TITLE = F104A Starfighter (Pre/Pre+)
CATEGORY = Experimental
DEVICE = pre
VERSIONS = 2.1.0-41
APPINFO_DESCRIPTION = The latest experimental kernel from uNiXpSyChO.<br><br>\
Features:<br> * Screenstate v2<br> * 1.1GHz<br> * More govenors<br><br>\
For more information, visit ${HOMEPAGE}<br>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}<br>
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-41", "log" : [ "merge latest screenstate code." ] }, \
{ "version" : "${WEBOS_VERSION}-35", "log" : [ "remove debugging code." ] }, \
{ "version" : "${WEBOS_VERSION}-33", "log" : [ "fix unaligned access in voltage array. screenstate fixups. code cleanup. fix sysfs voltage input for voltage array (Govnah will happier)." ] }, \
{ "version" : "${WEBOS_VERSION}-30", "log" : [ "rebuild for webOS 2.1.0" ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-41: merge latest screenstate code<br>${WEBOS_VERSION}-35: remove debugging code.<br>${WEBOS_VERSION}-33: fix unaligned access in voltage array. screenstate fixups. code cleanup. fix sysfs voltage input for voltage array (Govnah will happier).<br>${WEBOS_VERSION}-30: rebuild for webOS 2.1.0<br>

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = psychobuild/F104A-overclocking.patch \
		 sensors/omap34xx_temp.patch \
		 psychobuild/ssv2-ovrd.patch \
		 compcache/lowmemnotify-total-memory.patch \
		 psychobuild/preempt.patch \
		 makefiletune/armMakefile.diff

KERNEL_DEFCONFIG = psychobuild/F104A.config
#KERNEL_UPSTART   = psychobuild/F104A.upstart
TYPE = Kernel

include ../../support/kernel.mk
