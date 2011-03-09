NAME = $(shell basename $(shell pwd))
TITLE = SR71 Blackbird (Pre/Pre+)
CATEGORY = Experimental
DEVICE = pre
VERSIONS = 2.1.0-21
APPINFO_DESCRIPTION = The latest bleeding-edge totally-experimental kernel from uNiXpSyChO.<br><br>\
For more information, visit ${HOMEPAGE}<br><br>\
<b>WARNING: This Kernel may not boot on all devices and may cause damage!</b>\
<br><br>Features:<br> * 1.2GHz<br> * Ondemand Tickle gov<br> * Painfully fast!<br><br>
DESCRIPTION = <br>${APPINFO_DESCRIPTION}<br><br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-21", "log" : [ "Rebuild for webOS 2.1.0." ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-21: Rebuild for webOS 2.1.0<br>

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = psychobuild/SR71-overclocking.patch \
		 sensors/omap34xx_temp.patch \
		 psychobuild/ss-ovrd-tcl.patch \
		 compcache/lowmemnotify-total-memory.patch \
		 makefiletune/armMakefile.diff

KERNEL_DEFCONFIG = psychobuild/SR71.config
#KERNEL_UPSTART   = psychobuild/F102A.upstart
TYPE = Kernel

include ../../support/kernel.mk
