NAME = $(shell basename $(shell pwd))
TITLE = F104A Starfighter (Pre/Pre+)
CATEGORY = Beta
DEVICE = pre
VERSIONS = 1.4.5-189 1.4.5.1-189 2.1.0-84
APPINFO_DESCRIPTION = The latest experimental kernel from uNiXpSyChO.<br><br>\
Features:<br> * Screenstate v2<br> * 1.1GHz<br> * More govenors<br><br>\
For more information, visit ${HOMEPAGE}<br>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}<br>
HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://github.com/webos-internals/kernel-patches.git

ifeq ($(findstring 1.4.5,${WEBOS_VERSION}),1.4.5)

APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-189", "log" : [ "add ondemand-ng (screenstate for ondemand gov)." ] }, \
{ "version" : "${WEBOS_VERSION}-185", "log" : [ "add SSv2." ] }, \
{ "version" : "${WEBOS_VERSION}-110", "log" : [ "fix cpufreq policy update." ] }, \
{ "version" : "${WEBOS_VERSION}-108", "log" : [ "add battery scaling." ] }, \
{ "version" : "${WEBOS_VERSION}-107", "log" : [ "fix low end." ] }, \
{ "version" : "${WEBOS_VERSION}-106", "log" : [ "new engine and afterburners." ] }, \
{ "version" : "${WEBOS_VERSION}-83", "log" : [ "Merge with F102A codebase. Repackage." ] }, \
{ "version" : "${WEBOS_VERSION}-43", "log" : [ "Initial public release, rebased off UberKernel ${WEBOS_VERSION}-40" ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-189: add ondemand-ng (screenstate for ondemand gov).<br>${WEBOS_VERSION}-185: add SSv2<br>${WEBOS_VERSION}-110: fix cpufreq policy update.<br>${WEBOS_VERSION}-108: add battery scaling.<br>${WEBOS_VERSION}-107: fix low end<br>${WEBOS_VERSION}-106: new engine and afterburners.<br>${WEBOS_VERSION}-83: Merge with F102A codebase. Repackage.<br>${WEBOS_VERSION}-43: Initial public release, rebased off UberKernel ${WEBOS_VERSION}-40

KERNEL_PATCHES = psychobuild/F104A-overclocking.patch \
		 sensors/sensors_temp_omap34xx.patch \
		 psychobuild/ssv2-ovrd.patch \
		 psychobuild/ondemand-ng.patch \
		 compcache/compcache.patch memory/tmc_mem.patch \
		 psychobuild/fbconsole.patch psychobuild/F104-logo.patch \
		 makefiletune/armMakefile.diff
EXTERNAL_MODULES = compcache/compcache-0.5.4

KERNEL_UPSTART   = psychobuild/F104A.upstart

else

APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-84", "log" : [ "add ondemand-ng (screenstate for ondemand gov)." ] }, \
{ "version" : "${WEBOS_VERSION}-59", "log" : [ "allow 1s charger poll. changes to defaults." ] }, \
{ "version" : "${WEBOS_VERSION}-44", "log" : [ "use VSEL instead of SR to voltage scale. add VDD2 voltage scaling. show charger polling in seconds and vdemand polling in milliseconds. OMG? users beware!" ] }, \
{ "version" : "${WEBOS_VERSION}-41", "log" : [ "merge latest screenstate code." ] }, \
{ "version" : "${WEBOS_VERSION}-35", "log" : [ "remove debugging code." ] }, \
{ "version" : "${WEBOS_VERSION}-33", "log" : [ "fix unaligned access in voltage array. screenstate fixups. code cleanup. fix sysfs voltage input for voltage array (Govnah will happier)." ] }, \
{ "version" : "${WEBOS_VERSION}-30", "log" : [ "rebuild for webOS 2.1.0" ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-84: add ondemand-ng (screenstate for ondemand gov).<br>${WEBOS_VERSION}-59: allow 1s charger poll. changes to defaults.<br>${WEBOS_VERSION}-44: use VSEL instead of SR to voltage scale. add VDD2 voltage scaling. show charger polling in seconds and vdemand polling in milliseconds. OMG? users beware!<br>${WEBOS_VERSION}-41: merge latest screenstate code<br>${WEBOS_VERSION}-35: remove debugging code.<br>${WEBOS_VERSION}-33: fix unaligned access in voltage array. screenstate fixups. code cleanup. fix sysfs voltage input for voltage array (Govnah will happier).<br>${WEBOS_VERSION}-30: rebuild for webOS 2.1.0<br>

KERNEL_PATCHES = psychobuild/F104A-overclocking.patch \
		 sensors/omap34xx_temp.patch \
		 psychobuild/ssv2-ovrd.patch \
		 psychobuild/ondemand-ng-pre.patch \
		 psychobuild/fbconsole.patch \
		 psychobuild/F104-logo.patch \
		 compcache/lowmemnotify-total-memory.patch \
		 psychobuild/preempt.patch \
		 makefiletune/armMakefile.diff

endif

KERNEL_DEFCONFIG = psychobuild/F104A.config
TYPE = Kernel

include ../../support/kernel.mk
