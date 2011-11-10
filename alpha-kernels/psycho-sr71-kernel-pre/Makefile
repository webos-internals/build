NAME = $(shell basename $(shell pwd))
TITLE = SR71 Blackbird (Pre/Pre+)
CATEGORY = Alpha
DEVICE = pre
VERSIONS = 2.1.0-77 1.4.5-144
APPINFO_DESCRIPTION = The latest bleeding-edge totally-experimental kernel from uNiXpSyChO.<br><br>\
For more information, visit ${HOMEPAGE}<br><br>\
<b>WARNING: This Kernel may not boot on all devices and may cause damage!</b>\
<br><br>Features:<br> * 1.2GHz<br> * Ondemand Tickle gov<br> * Painfully fast!<br><br>
DESCRIPTION = <br>${APPINFO_DESCRIPTION}<br><br>${KERNEL_DISCLAIMER}
HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git

ifeq (${WEBOS_VERSION},1.4.5)
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-144", "log" : [ "added ondemand tickle gov." ] }, \
{ "version" : "${WEBOS_VERSION}-111", "log" : [ "drop voltages since girlie-Pre cant run it anyway. update to latest override module. " ] }, \
{ "version" : "${WEBOS_VERSION}-92", "log" : [ "Do voltage scaling immediately after Vsel change." ] }, \
{ "version" : "${WEBOS_VERSION}-91", "log" : [ "added selectable voltage & temp scaling." ] }, \
{ "version" : "${WEBOS_VERSION}-84", "log" : [ "raise DSP clock. add low temp reset for screenstate." ] }, \
{ "version" : "${WEBOS_VERSION}-82", "log" : [ "add more voltage to high-end. repackage for webOS 1.4.5." ] }, \
{ "version" : "${WEBOS_VERSION}-81", "log" : [ "turn down the afterburners. raise voltage on 6 & 7 slots. bring back anticipatory." ] }, \
{ "version" : "${WEBOS_VERSION}-80", "log" : [ "up voltages. add back OPP1 and OPP2 slots." ] }, \
{ "version" : "${WEBOS_VERSION}-78", "log" : [ "Initial release for 1.2GHz support. NextGen Screenstate with temp monitoring." ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-144: added ondemand tickle gov.<br>${WEBOS_VERSION}-111: drop voltages since girlie-Pre cant run it anyway. update to latest override module.<br>${WEBOS_VERSION}-92: Do voltage scaling immediately after Vsel change.<br>${WEBOS_VERSION}-91: added selectable voltage & temp scaling.<br>${WEBOS_VERSION}-84: raise DSP clock. add low temp reset for screenstate.<br>${WEBOS_VERSION}-82: add more voltage to high-end. repackage for webOS 1.4.5.<br>${WEBOS_VERSION}-81: turn down the afterburners. raise voltage on 6 & 7 slots. bring back anticipatory.<br>${WEBOS_VERSION}-80: up voltages. add back OPP1 and OPP2 slots.<br>${WEBOS_VERSION}-78: Initial release for 1.2GHz support. NextGen Screenstate with temp monitoring.<br>

KERNEL_PATCHES = psychobuild/SR71-overclocking.patch \
		 sensors/sensors_temp_omap34xx.patch \
		 psychobuild/ss-ovrd-tcl.patch \
		 compcache/compcache.patch memory/tmc_mem.patch \
		 makefiletune/armMakefile.diff
EXTERNAL_MODULES = compcache/compcache-0.5.4

#KERNEL_UPSTART   = psychobuild/F102A.upstart

else

APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-77", "log" : [ "add 200MHZ VDD2.  last hurrah for Pre." ] }, \
{ "version" : "${WEBOS_VERSION}-73", "log" : [ "Rebuild for webOS 2.1.0." ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-77: add 200MHZ VDD2.  last hurrah for Pre.<br>${WEBOS_VERSION}-73: Rebuild for webOS 2.1.0<br>

KERNEL_PATCHES = psychobuild/SR71-overclocking.patch \
		 sensors/omap34xx_temp.patch \
		 psychobuild/ssv2-ovrd.patch \
		 psychobuild/fbconsole.patch \
		 psychobuild/SR71-logo.patch \
		 compcache/lowmemnotify-total-memory.patch \
		 makefiletune/armMakefile.diff

#KERNEL_UPSTART   = psychobuild/F102A.upstart

endif

KERNEL_DEFCONFIG = psychobuild/SR71.config
TYPE = Kernel

include ../../support/kernel.mk
