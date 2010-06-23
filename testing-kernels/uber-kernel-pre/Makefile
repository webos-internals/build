NAME = $(shell basename $(shell pwd))
TITLE = UberKernel (Pre/Pre+)
DEVICE = pre
CATEGORY = Experimental
VERSIONS = 1.4.1-50 1.4.2-50 1.4.5-50
APPINFO_DESCRIPTION = A collection of all the best kernel improvements for the Palm Pre/Pre+, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to <a href=http://developer.palm.com/blog/2010/03/a-statement-on-the-overclocking-patches/>void your warranty</a> if things go wrong.<b><br>\
Current additions include:<ul>\
<li>720MHz and 800MHz kernel operating points (OPP6 and OPP7 for VDD1), based on the open source OMAP3440 kernel port, ported to the Palm Pre/Pre+ by uNiXpSyChO</li>\
<li>All standard Linux 2.6.24 <a href=http://www.ibm.com/developerworks/linux/library/l-cpufreq-1/index.html>cpufreq governors</a> made available for selection via the Govnah application</li>\
<li>The OMAP3430 internal CPU temperature sensor is made available for measuring the true CPU temperature, ported to the Palm Pre/Pre+ by ka6sox & rwhitby</li>\
<li>A new <b>screenstate</b> governor created by uNiXpSyChO specifically for the Palm Pre/Pre+ which runs at a higher speed when the screen is on, and a lower speed when the screen is off</li>\
<li>A new <a href=http://lwn.net/Articles/334649/><b>compcache</b> compressed RAM swap kernel module</a> ported to the Palm Pre/Pre+ by uNiXpSyChO & rwhitby</li>\
<li>Modification of the lowmemnotify threshold calculation to take into account free swap space, written by rwhitby</li>\
</ul><br>\
All additions are disabled by default, and must be enabled by separate packages or scripts (not included in this package).<br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-50", "log" : [ "Incorporated compile flag performance improvements from WarthogKernel experimentation stream" ] }, \
{ "version" : "${WEBOS_VERSION}-43", "log" : [ "Updated with latest postinst and prerm OTA safety measures" ] }, \
{ "version" : "${WEBOS_VERSION}-40", "log" : [ "Enabled lower frequencies for screenstate minimum" ] }, \
{ "version" : "${WEBOS_VERSION}-37", "log" : [ "Include free swap in memory calculations" ] }, \
{ "version" : "${WEBOS_VERSION}-35", "log" : [ "Added compcache compressed RAM swap kernel module (not loaded by default)" ] }, \
{ "version" : "${WEBOS_VERSION}-32", "log" : [ "Update and cleanup of charging code in screenstate governor" ] }, \
{ "version" : "${WEBOS_VERSION}-21", "log" : [ "Limit IVA2 block to 360MHz as per the mystery bug mentioned in the Palm kernel patch" ] }, \
{ "version" : "${WEBOS_VERSION}-16", "log" : [ "Improved screenstate transition detection" ] }, \
{ "version" : "${WEBOS_VERSION}-13", "log" : [ "Initial public release" ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-50: Incorporated compile flag performance improvements from WarthogKernel experimentation stream.<br>${WEBOS_VERSION}-43: Updated with latest postinst and prerm OTA safety measures.<br>${WEBOS_VERSION}-40: Enabled lower frequencies for screenstate minimum.<br>${WEBOS_VERSION}-37: Include free swap in memory calculations.<br>${WEBOS_VERSION}-35: Added compcache compressed RAM swap kernel module (not loaded by default).<br>${WEBOS_VERSION}-32: Update and cleanup of charging code in screenstate governor.<br>${WEBOS_VERSION}-21: Limit IVA2 block to 360MHz as per the mystery bug mentioned in the Palm kernel patch.<br>${WEBOS_VERSION}-16: Improved screenstate transition detection.<br>${WEBOS_VERSION}-13: Initial public release

HOMEPAGE = http://www.webos-internals.org/wiki/Application:UberKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = overclocking/opp6-720-opp7-800-min-opp5.patch overclocking/defconfig-standard.patch \
		 sensors/sensors_temp_omap34xx.patch sensors/defconfig-safe.patch \
		 screenstate/screenstate.patch \
		 makefiletune/armMakefile.diff \
		 defconfig/defconfig.pre.cpugov \
		 compcache/compcache.patch compcache/lowmemnotify-total-memory.patch
KERNEL_MODULES = compcache/compcache-0.5.4

include ../../support/kernel.mk
