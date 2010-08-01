NAME = $(shell basename $(shell pwd))
TITLE = WarthogKernel (Pre/Pre+)
DEVICE = pre
CATEGORY = Experimental
DEVICECOMPATIBILITY = [\"Pre\"]
VERSIONS = 1.4.1-87 1.4.2-87 1.4.5-87
APPINFO_DESCRIPTION = In the jungle, the mighty jungle, the lion sleeps tonight. Oh wait... <br><br>\
A testbed of kernel patches for the Palm Pre/Pre+, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to <a href=http://developer.palm.com/blog/2010/03/a-statement-on-the-overclocking-patches/>void your warranty</a> if things go wrong.<b><br>\
Current additions include:<ul>\
<li>Optimized compile flags</li>\
<li>720MHz, 800Mhz and 1050MHz kernel operating points (OPP5, OPP6 & OPP7 for VDD1), based on the open source OMAP3440 kernel port, ported to the Palm Pre/Pre+ by uNiXpSyChO</li>\
<li>All standard Linux 2.6.24 <a href=http://www.ibm.com/developerworks/linux/library/l-cpufreq-1/index.html>cpufreq governors</a> made available for selection via the Govnah application</li>\
<li>The OMAP3430 internal CPU temperature sensor is made available for measuring the true CPU temperature, ported to the Palm Pre/Pre+ by ka6sox & rwhitby</li>\
<li>A new <b>screenstate</b> governor created by uNiXpSyChO specifically for the Palm Pre/Pre+ which runs at a higher speed when the screen is on, and a lower speed when the screen is off</li>\
<li>A new <a href=http://lwn.net/Articles/334649/><b>compcache</b> compressed RAM swap kernel module</a> ported to the Palm Pre/Pre+ by uNiXpSyChO & rwhitby</li>\
<li>Automatic temperature limiting support, written by uNiXpSyChO, ka6sox & rwhitby</li>\
</ul><br>\
All additions are disabled by default, and must be enabled by separate packages or scripts (not included in this package).<br>\
For more information, visit <a href=${HOMEPAGE}>${HOMEPAGE}</a>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-87", "log" : [ "Limited frequency to 500MHz when temperature exceeds configurable limits (defaults to 55 degrees)" ] }, \
{ "version" : "${WEBOS_VERSION}-86", "log" : [ "Build using official 1.4.5 sources" ] }, \
{ "version" : "${WEBOS_VERSION}-77", "log" : [ "Add unixpsycho dsp settings" ] }, \
{ "version" : "${WEBOS_VERSION}-76", "log" : [ "Back out sbromwich changes. 550Mhz is gone but 800Mhz returns" ] }, \
{ "version" : "${WEBOS_VERSION}-73", "log" : [ "Incorporate sbromwich changes" ] }, \
{ "version" : "${WEBOS_VERSION}-69", "log" : [ "Pick up new screenstate changes by uNiXpSyChO" ] }, \
{ "version" : "${WEBOS_VERSION}-62", "log" : [ "Disable MODVERSIONS" ] }, \
{ "version" : "${WEBOS_VERSION}-58", "log" : [ "Turn off some debug options" ] }, \
{ "version" : "${WEBOS_VERSION}-56", "log" : [ "Turn on all TCP congest algos and CPU governors. And a bit more." ] }, \
{ "version" : "${WEBOS_VERSION}-48", "log" : [ "Updated compcache compile flags" ] }, \
{ "version" : "${WEBOS_VERSION}-43", "log" : [ "Updated with latest postinst and prerm OTA safety measures" ] }, \
{ "version" : "${WEBOS_VERSION}-40", "log" : [ "Enabled lower frequencies for screenstate minimum" ] }, \
{ "version" : "${WEBOS_VERSION}-38", "log" : [ "Updated gcc toolchain as well as optimized compile flags" ] }, \
{ "version" : "${WEBOS_VERSION}-37", "log" : [ "Include free swap in memory calculations" ] }, \
{ "version" : "${WEBOS_VERSION}-35", "log" : [ "Added compcache compressed RAM swap kernel module (not loaded by default)" ] }, \
{ "version" : "${WEBOS_VERSION}-32", "log" : [ "Update and cleanup of charging code in screenstate governor" ] }, \
{ "version" : "${WEBOS_VERSION}-21", "log" : [ "Limit IVA2 block to 360MHz as per the mystery bug mentioned in the Palm kernel patch" ] }, \
{ "version" : "${WEBOS_VERSION}-16", "log" : [ "Improved screenstate transition detection" ] }, \
{ "version" : "${WEBOS_VERSION}-13", "log" : [ "Initial public release" ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-87: Limited frequency to 500MHz when temperature exceeds configurable limits (defaults to 55 degrees).<br>\
${WEBOS_VERSION}-86: Build using official 1.4.5 sources.<br>\
${WEBOS_VERSION}-77: Add unixpsycho dsp settings.<br>\
${WEBOS_VERSION}-76: Back out sbromwich changes. 550Mhz is gone but 800Mhz returns.<br>\
${WEBOS_VERSION}-73: Incorporate sbromwich changes.<br>\
${WEBOS_VERSION}-69: Pick up new screenstate changes by uNiXpSyChO.<br>\
${WEBOS_VERSION}-62: Disable MODVERSIONS.<br>\
${WEBOS_VERSION}-58: Turn off some debug options.<br>\
${WEBOS_VERSION}-56: Turn on all TCP congest algos and CPU governors. And a bit more.<br>\
${WEBOS_VERSION}-48: Updated compcache compile flags.<br>\
${WEBOS_VERSION}-43: Updated with latest postinst and prerm OTA safety measures.<br>\
${WEBOS_VERSION}-40: Enabled lower frequencies for screenstate minimum.<br>\
${WEBOS_VERSION}-38: Updated gcc toolchain as well as optimized compile flags.<br>\
${WEBOS_VERSION}-37: Include free swap in memory calculations.<br>\
${WEBOS_VERSION}-35: Added compcache compressed RAM swap kernel module (not loaded by default).<br>\
${WEBOS_VERSION}-32: Update and cleanup of charging code in screenstate governor.<br>\
${WEBOS_VERSION}-21: Limit IVA2 block to 360MHz as per the mystery bug mentioned in the Palm kernel patch.<br>\
${WEBOS_VERSION}-16: Improved screenstate transition detection.<br>\
${WEBOS_VERSION}-13: Initial public release

HOMEPAGE = http://www.webos-internals.org/wiki/Application:WarthogKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = warthogbuild/opp5-720-opp6-800-opp7-1050.patch overclocking/defconfig-standard.patch \
		 sensors/sensors_temp_omap34xx.patch sensors/defconfig-safe.patch \
		 screenstate/screenstate.patch \
		 makefiletune/armMakefile.diff \
		 warthogbuild/smartreflex-opp.patch \
		 defconfig/defconfig.pre.cpugov	defconfig/defconfig.pre.tcpcong warthogbuild/defconfig-nodebug-pre.patch \
		 compcache/compcache.patch compcache/lowmemnotify-total-memory.patch \
		 overclocking/override.patch
EXTERNAL_MODULES = compcache/compcache-0.5.4
TYPE = Kernel

include ../../support/kernel.mk

# Override the compiler
#CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs10q1armel/build/arm-2010q1/bin/arm-none-linux-gnueabi-

#folk/board-sirloin-headset-detect.c.diff \
#folk/omap_misc_hsuart.c.diff folk/omap_fb.c.diff \
#folk/pm_cpuidle.c.diff warthogbuild/defconfig-folk-pre.diff \
