NAME = $(shell basename $(shell pwd))
TITLE = F105 Thunderchief (Palm Pre/Pre+)
CATEGORY = Experimental
DEVICECOMPATIBILITY = [\"Pre\"]
VERSIONS = 1.4.1-109 1.4.2-109 1.4.5-109
APPINFO_DESCRIPTION = The latest bleeding-edge totally-experimental kernel from uNiXpSyChO.<br><br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br><br>${KERNEL_DISCLAIMER}<br>
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-109", "log" : [ "fix cpufreq policy update." ] }, \
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
{ "version" : "${WEBOS_VERSION}-47", "log" : [ "Initial release for 1GHz support" ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-109: fix cpufreq policy update.<br>${WEBOS_VERSION}-108: add battery scaling.<br>${WEBOS_VERSION}-106: add charger cpu scaleback override sysfs.<br>${WEBOS_VERSION}-99: fix store_vdd1_vsel<br>${WEBOS_VERSION}-98: cut down on voltage. hide low vsel settings.<br>${WEBOS_VERSION}-92: Do voltage scaling immediately after Vsel change.<br>${WEBOS_VERSION}-91: added Vsel limits.<br>${WEBOS_VERSION}-88: added selectable voltage & temp scaling. removed OPP1&2 from display.<br>${WEBOS_VERSION}-85: added low temp reset on overheating. add nexgen-screenstate. bump DSP rate<br>${WEBOS_VERSION}-83: match SR71 OPP6 voltage. repackage<br>${WEBOS_VERSION}-76: re-enable memory overcommit. put 500MHz voltage back and bump up 1GHz voltage.<br>${WEBOS_VERSION}-74: Fix for PC USB charging.<br>${WEBOS_VERSION}-69: Fix for current_mA in TS detection.<br>${WEBOS_VERSION}-67: make screenstate monitor current and voltage. bug fixes. remove brightness checking. overclocking tweaks.<br>${WEBOS_VERSION}-60: Voltage tweaking.<br>

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = overclocking/F105-overclocking.patch \
		 sensors/sensors_temp_omap34xx.patch \
		 screenstate/screenstate.patch \
		 compcache/compcache.patch memory/tmc_mem.patch \
		 overclocking/override.patch \
		 makefiletune/armMakefile.diff
EXTERNAL_MODULES = compcache/compcache-0.5.4

KERNEL_DEFCONFIG = psychobuild/F105.config
KERNEL_UPSTART   = psychobuild/F102A.upstart
TYPE = Kernel

include ../../support/kernel.mk
