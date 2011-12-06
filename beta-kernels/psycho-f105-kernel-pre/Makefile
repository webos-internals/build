NAME = $(shell basename $(shell pwd))
TITLE = F105 Thunderchief (Pre/Pre+)
CATEGORY = Beta
DEVICE = pre
VERSIONS = 2.1.0-83 1.4.5-188
APPINFO_DESCRIPTION = The latest bleeding-edge totally-experimental kernel from uNiXpSyChO.<br><br>\
Features:<br> * New screenstate v2 with vdemand<br> * 1GHz<br> * 200MHz VDD2<br> * More govenors<br><br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br><br>${KERNEL_DISCLAIMER}<br>
HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git

ifeq ($(findstring 1.4.5,${WEBOS_VERSION}),1.4.5)

APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-188", "log" : [ "add ondemand-ng (screenstate for ondemand gov)." ] }, \
{ "version" : "${WEBOS_VERSION}-184", "log" : [ "fix bug where user cant change sysfs entries." ] }, \
{ "version" : "${WEBOS_VERSION}-183", "log" : [ "drop high temp alarm. fix battery percent scaleback sysfs." ] }, \
{ "version" : "${WEBOS_VERSION}-179", "log" : [ "backport some fixes from 2.1.0 branch.  change sysfs display from jiffies to secs." ] }, \
{ "version" : "${WEBOS_VERSION}-171", "log" : [ "force some preemption. change IO sched. add PPP comp." ] }, \
{ "version" : "${WEBOS_VERSION}-169", "log" : [ "split battery and temp monitoring. more 200MHz pwnage." ] }, \
{ "version" : "${WEBOS_VERSION}-162", "log" : [ "fix charger override." ] }, \
{ "version" : "${WEBOS_VERSION}-161", "log" : [ "fix vdd1 vsel changes. add support to change screenstate default voltages. override fixups." ] }, \
{ "version" : "${WEBOS_VERSION}-158", "log" : [ "add screenstate v2 with dynamic vdemand. add more govs. removed ondemand tickle." ] }, \
{ "version" : "${WEBOS_VERSION}-143", "log" : [ "Increase default voltages for wimpy Pres." ] }, \
{ "version" : "${WEBOS_VERSION}-142", "log" : [ "fix games." ] }, \
{ "version" : "${WEBOS_VERSION}-140", "log" : [ "add ondemand tickle gov. kernel tweaks." ] }, \
{ "version" : "${WEBOS_VERSION}-131", "log" : [ "drop SDRC hack." ] }, \
{ "version" : "${WEBOS_VERSION}-130", "log" : [ "add vdd2 freq display. SDRC hack." ] }, \
{ "version" : "${WEBOS_VERSION}-129", "log" : [ "allow vdd2 voltage changes in override." ] }, \
{ "version" : "${WEBOS_VERSION}-125", "log" : [ "drop vdd2 voltage. minor hacks." ] }, \
{ "version" : "${WEBOS_VERSION}-119", "log" : [ "overclock vdd2 to 200MHz. fix override sticky bug." ] }, \
{ "version" : "${WEBOS_VERSION}-110", "log" : [ "fix cpufreq policy update." ] }, \
{ "version" : "${WEBOS_VERSION}-108", "log" : [ "add battery scaling." ] }, \
{ "version" : "${WEBOS_VERSION}-106", "log" : [ "add charger cpu scaleback override sysfs." ] }, \
{ "version" : "${WEBOS_VERSION}-99", "log" : [ "fix store_vdd1_vsel." ] }, \
{ "version" : "${WEBOS_VERSION}-98", "log" : [ "cut down on voltage. hide low vsel settings." ] }, \
{ "version" : "${WEBOS_VERSION}-92", "log" : [ "Do voltage scaling immediately after Vsel change." ] }, \
{ "version" : "${WEBOS_VERSION}-91", "log" : [ "added Vsel limits." ] }, \
{ "version" : "${WEBOS_VERSION}-88", "log" : [ "added selectable voltage & temp scaling. removed OPP1&2 from display." ] }, \
{ "version" : "${WEBOS_VERSION}-85", "log" : [ "added low temp reset on overheating. add nexgen-screenstate. bump DSP rate" ] }, \
{ "version" : "${WEBOS_VERSION}-83", "log" : [ "match SR71 OPP6 voltage. repackage" ] }, \
{ "version" : "${WEBOS_VERSION}-76", "log" : [ "re-enable memory overcommit. put 500MHz voltage back and bump up 1GHz voltage." ] }, \
{ "version" : "${WEBOS_VERSION}-74", "log" : [ "Fix for PC USB charging." ] }, \
{ "version" : "${WEBOS_VERSION}-69", "log" : [ "Fix for current_mA in TS detection." ] }, \
{ "version" : "${WEBOS_VERSION}-67", "log" : [ "make screenstate monitor current and voltage. bug fixes. remove brightness checking. overclocking tweaks." ] }, \
{ "version" : "${WEBOS_VERSION}-60", "log" : [ "Voltage tweaking." ] }, \
{ "version" : "${WEBOS_VERSION}-59", "log" : [ "screenstate updates. CPU IDLE update.  New freqs." ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-188: add ondemand-ng (screenstate for ondemand gov).<br>${WEBOS_VERSION}-184: fix bug where user cant change sysfs entries.<br>${WEBOS_VERSION}-183: drop high temp alarm. fix battery percent scaleback sysfs.<br>${WEBOS_VERSION}-179: backport some fixes from 2.1.0 branch.  change sysfs display from jiffies to secs.<br>${WEBOS_VERSION}-171: force some preemption. change IO sched. add PPP comp.<br>${WEBOS_VERSION}-169: split battery and temp monitoring. more 200MHz pwnage.<br>${WEBOS_VERSION}-162: fix charger override.<br>${WEBOS_VERSION}-161: fix vdd1 vsel changes. add support to change screenstate default voltages. override fixups.<br>${WEBOS_VERSION}-158: add screenstate v2 with dynamic vdemand. add more govs. removed ondemand tickle.<br>${WEBOS_VERSION}-143: Increase default voltages for wimpy Pres<br>${WEBOS_VERSION}-142: fix games.<br>${WEBOS_VERSION}-140: add ondemand tickle gov. kernel tweaks.<br>${WEBOS_VERSION}-131: drop SDRC hack.<br>${WEBOS_VERSION}-130: add vdd2 freq display. SDRC hack.<br>${WEBOS_VERSION}-129: allow vdd2 voltage changes in override.<br>${WEBOS_VERSION}-125: drop vdd2 voltage. minor hacks.<br>${WEBOS_VERSION}-119: overclock vdd2 to 200MHz. fix override sticky bug.<br>${WEBOS_VERSION}-110: fix cpufreq policy update.<br>${WEBOS_VERSION}-108: add battery scaling.<br>${WEBOS_VERSION}-106: add charger cpu scaleback override sysfs.<br>${WEBOS_VERSION}-99: fix store_vdd1_vsel<br>${WEBOS_VERSION}-98: cut down on voltage. hide low vsel settings.<br>${WEBOS_VERSION}-92: Do voltage scaling immediately after Vsel change.<br>${WEBOS_VERSION}-91: added Vsel limits.<br>

KERNEL_PATCHES = psychobuild/F105-overclocking.patch \
		 sensors/sensors_temp_omap34xx.patch \
		 psychobuild/ssv2-ovrd.patch \
		 psychobuild/ondemand-ng.patch \
		 compcache/compcache.patch memory/tmc_mem.patch \
		 psychobuild/fbconsole.patch \
		 psychobuild/F105-logo.patch \
		 makefiletune/armMakefile.diff
EXTERNAL_MODULES = compcache/compcache-0.5.4

KERNEL_UPSTART   = psychobuild/F102A.upstart

else

APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-83", "log" : [ "add ondemand-ng (screenstate for ondemand gov)." ] }, \
{ "version" : "${WEBOS_VERSION}-71", "log" : [ "add SIO scheduler. add SSv3." ] }, \
{ "version" : "${WEBOS_VERSION}-68", "log" : [ "re-order locking." ] }, \
{ "version" : "${WEBOS_VERSION}-62", "log" : [ "drop high temp alarm. code cleanup. fix battery percent scaleback sysfs." ] }, \
{ "version" : "${WEBOS_VERSION}-56", "log" : [ "misc changes to defaults." ] }, \
{ "version" : "${WEBOS_VERSION}-53", "log" : [ "Allow 1s charger poll." ] }, \
{ "version" : "${WEBOS_VERSION}-51", "log" : [ "raise readahead. increase HZ." ] }, \
{ "version" : "${WEBOS_VERSION}-41", "log" : [ "cleanup compiler warnings. screenstate and override fixes." ] }, \
{ "version" : "${WEBOS_VERSION}-35", "log" : [ "remove debugging code." ] }, \
{ "version" : "${WEBOS_VERSION}-33", "log" : [ "fix unaligned access in voltage array. screenstate fixups. code cleanup. fix sysfs voltage input for voltage array (Govnah will happier)." ] }, \
{ "version" : "${WEBOS_VERSION}-17", "log" : [ "nullify unused bridge driver function, FTW." ] }, \
{ "version" : "${WEBOS_VERSION}-16", "log" : [ "make screenstate dumb again. remove constraints. tmc memory hack." ] }, \
{ "version" : "${WEBOS_VERSION}-8", "log" : [ "remove some 200Mhz pwnage. add disgusting hack for freq flopping. add delay for screen on and off." ] }, \
{ "version" : "${WEBOS_VERSION}-4", "log" : [ "rebuild for webOS 2.1.0." ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-83: add ondemand-ng (screenstate for ondemand gov).<br>${WEBOS_VERSION}-71: add SIO scheduler. add SSv3.<br>${WEBOS_VERSION}-68: re-order locking.<br>${WEBOS_VERSION}-62: drop high temp alarm. code cleanup. fix battery percent scaleback sysfs.<br>${WEBOS_VERSION}-56: misc changes to defaults.<br>${WEBOS_VERSION}-53: Allow 1s charger poll.<br>${WEBOS_VERSION}-51: raise readahead. increase HZ.<br>${WEBOS_VERSION}-41: cleanup compiler warnings. screenstate and override fixes.<br>${WEBOS_VERSION}-35: remove debugging code.<br>${WEBOS_VERSION}-33: fix unaligned access in voltage array. screenstate fixups. code cleanup. fix sysfs voltage input for voltage array (Govnah will happier).<br>${WEBOS_VERSION}-17: nullify unused bridge driver function, FTW.<br>${WEBOS_VERSION}-16: make screenstate dumb again. remove constraints. tmc memory hack.<br>${WEBOS_VERSION}-8: remove some 200Mhz pwnage. add disgusting hack for freq flopping. add delay for screen on and off.<br>${WEBOS_VERSION}-4: rebuild for webOS 2.1.0.<br>

KERNEL_PATCHES = psychobuild/F105-overclocking.patch \
                 sensors/omap34xx_temp.patch \
                 psychobuild/ssv3-ovrd.patch \
                 psychobuild/ssv3-ovrd-pre.patch \
		 psychobuild/ondemand-ng-pre.patch \
                 compcache/lowmemnotify-total-memory.patch \
                 psychobuild/fbconsole.patch \
                 psychobuild/F105-logo.patch \
                 psychobuild/250_hz.patch \
                 psychobuild/iosched_blk.patch \
                 psychobuild/sio.patch \
                 psychobuild/comptune.patch

endif

KERNEL_DEFCONFIG = psychobuild/F105.config
TYPE = Kernel

include ../../support/kernel.mk

