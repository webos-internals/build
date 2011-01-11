NAME = $(shell basename $(shell pwd))
TITLE = F105 Thunderchief (Palm Pre/Pre+)
CATEGORY = Experimental
DEVICE = pre
VERSIONS = 1.4.5-158
APPINFO_DESCRIPTION = The latest bleeding-edge totally-experimental kernel from uNiXpSyChO.<br><br>\
Features:<br> * New screenstate v2 with vdemand<br> * 1GHz<br> * 200MHz VDD2<br> * More govenors<br><br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br><br>${KERNEL_DISCLAIMER}<br>
APPINFO_CHANGELOG = [ \
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
CHANGELOG = ${WEBOS_VERSION}-158: add screenstate v2 with dynamic vdemand. add more govs. removed ondemand tickle.<br>${WEBOS_VERSION}-143: Increase default voltages for wimpy Pres<br>${WEBOS_VERSION}-142: fix games.<br>${WEBOS_VERSION}-140: add ondemand tickle gov. kernel tweaks.<br>${WEBOS_VERSION}-131: drop SDRC hack.<br>${WEBOS_VERSION}-130: add vdd2 freq display. SDRC hack.<br>${WEBOS_VERSION}-129: allow vdd2 voltage changes in override.<br>${WEBOS_VERSION}-125: drop vdd2 voltage. minor hacks.<br>${WEBOS_VERSION}-119: overclock vdd2 to 200MHz. fix override sticky bug.<br>${WEBOS_VERSION}-110: fix cpufreq policy update.<br>${WEBOS_VERSION}-108: add battery scaling.<br>${WEBOS_VERSION}-106: add charger cpu scaleback override sysfs.<br>${WEBOS_VERSION}-99: fix store_vdd1_vsel<br>${WEBOS_VERSION}-98: cut down on voltage. hide low vsel settings.<br>${WEBOS_VERSION}-92: Do voltage scaling immediately after Vsel change.<br>${WEBOS_VERSION}-91: added Vsel limits.<br>${WEBOS_VERSION}-88: added selectable voltage & temp scaling. removed OPP1&2 from display.<br>

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = psychobuild/F105-overclocking.patch \
		 sensors/sensors_temp_omap34xx.patch \
		 psychobuild/ssv2-ovrd.patch \
		 compcache/compcache.patch memory/tmc_mem.patch \
		 makefiletune/armMakefile.diff
EXTERNAL_MODULES = compcache/compcache-0.5.4

KERNEL_DEFCONFIG = psychobuild/F105.config
KERNEL_UPSTART   = psychobuild/F102A.upstart
TYPE = Kernel

include ../../support/kernel.mk
