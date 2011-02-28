NAME = $(shell basename $(shell pwd))
TITLE = UberKernel (Pre/Pre+)
DEVICE = pre
CATEGORY = Experimental
VERSIONS = 1.4.5-158 2.1.0-1
VERSIONS = 2.1.0-1
APPINFO_DESCRIPTION = A collection of all the best kernel improvements for the Palm Pre/Pre+, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to <a href=http://developer.palm.com/blog/2010/03/a-statement-on-the-overclocking-patches/>void your warranty</a> if things go wrong.</b><br>\
Current additions include:<ul>\
<li>New 720MHz, 800MHz and 1GHz kernel operating points, based on the open source OMAP3440 kernel port, ported to the Palm Pre/Pre+ by uNiXpSyChO.</li>\
<li>Automatic temperature limiting support, written by uNiXpSyChO, ka6sox & rwhitby specifically for the Palm Pre/Pre+, which scales down the processor speed when a configurable temperature limit is reached.</li>\
<li>Automatic battery usage limiting support, written by uNiXpSyChO specifically for the Palm Pre/Pre+, which scales down the processor speed when a configurable low battery limit is reached.</li>\
<li>A new <b>screenstate</b> governor created by uNiXpSyChO specifically for the Palm Pre/Pre+ which runs at a higher speed when the screen is on, and a lower speed when the screen is off. The screenstate governor also clamps the frequency to 500MHz when the device is charging (this functionality is configurable).</li>\
<li>Modification of the lowmemnotify threshold calculation to take into account free swap space, written by rwhitby. This reduces the occurrence of the Too Many Cards error.</li>\
<li>A new <a href=http://lwn.net/Articles/334649/><b>compcache</b> compressed RAM swap kernel module</a> ported to the Palm Pre/Pre+ by uNiXpSyChO & rwhitby. This effectively increases your available swap space, at the expense of access speed.</li>\
<li>The OMAP3430 internal CPU temperature sensor is made available for measuring the true CPU temperature, ported to the Palm Pre/Pre+ by ka6sox & rwhitby.</li>\
<li>All standard Linux 2.6.24 <a href=http://www.ibm.com/developerworks/linux/library/l-cpufreq-1/index.html>cpufreq governors</a> made available for selection via the Govnah application.</li>\
<li>Additions to the USB mass storage driver for XBox 360 compatibility.  Note that your USB drive may be reformatted when you plug it into an XBox 360.</li>\
<li>Support for kernel crypto modules required by TrueCrypt</li>\
<li>Userspace Input device required by KeyBoss and the Virtual Keyboard for keypad input control.</li>\
<li>Support for controlling the adjacent key filter in the keypad driver. Use KeyBoss to control this parameter.</li>
</ul><br>\
All additions are controlled by using the Govnah application.<br>\
For more information, visit <a href=${HOMEPAGE}>${HOMEPAGE}</a>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-1", "log" : [ "Initial version for webOS 2.1.0 on Pre/Pre+" ] }, \
{ "version" : "1.4.5-158", "log" : [ "Removed superfluous vdd2 entries" ] }, \
{ "version" : "1.4.5-138", "log" : [ "Added uinput into kernel", "Added ability to control adjacent key filter" ] }, \
{ "version" : "1.4.5-124", "log" : [ "Disable Palm diagnostics reporting when installed" ] }, \
{ "version" : "1.4.5-123", "log" : [ "Enable cpu frequency debug" ] }, \
{ "version" : "1.4.5-121", "log" : [ "Added crypto module support for TrueCrypt" ] }, \
{ "version" : "1.4.5-119", "log" : [ "Robustified the battery percentage and cpu temperature checks in the early boot period." ] }, \
{ "version" : "1.4.5-113", "log" : [ "Added ability to control core voltages at each frequency", "Added ability to override screenstate charger frequency limiter", "Added a new configurable frequency limiter based on percentage battery remaining", "Reduced 1GHz voltage to save power, based on F105 testing results", "Added USB mass storage patch for XBox360 compatibility" ] }, \
{ "version" : "1.4.5-92", "log" : [ "Removed 550MHz, added 1GHz" ] }, \
{ "version" : "1.4.5-87", "log" : [ "Limited frequency to 500MHz when temperature exceeds configurable limits (defaults to 55 degrees)" ] }, \
{ "version" : "1.4.5-74", "log" : [ "Limited frequency to 500MHz when charging on Touchstone to prevent overheating", "Improved verification of target files for no existing modifications" ] }, \
{ "version" : "1.4.5-58", "log" : [ "Limited frequency to 500MHz when charging at 1A to prevent overheating" ] }, \
{ "version" : "1.4.5-50", "log" : [ "Incorporated compile flag performance improvements" ] }, \
{ "version" : "1.4.5-43", "log" : [ "Updated with latest postinst and prerm OTA safety measures" ] }, \
{ "version" : "1.4.5-40", "log" : [ "Enabled lower frequencies for screenstate minimum" ] }, \
{ "version" : "1.4.5-37", "log" : [ "Includes free swap in Too Many Cards memory calculations" ] }, \
{ "version" : "1.4.5-35", "log" : [ "Added compcache compressed RAM swap kernel module (not loaded by default)" ] }, \
{ "version" : "1.4.5-32", "log" : [ "Update and cleanup of charging code in screenstate governor" ] }, \
{ "version" : "1.4.5-21", "log" : [ "Limit IVA2 block to 360MHz as per the mystery bug mentioned in the Palm kernel patch" ] }, \
{ "version" : "1.4.5-16", "log" : [ "Improved screenstate transition detection" ] }, \
{ "version" : "1.4.5-13", "log" : [ "Initial public release" ] }, \
]
CHANGELOG = \
2.1.0-1: Initial version for webOS 2.1.0 on Pre/Pre+.<br>\
1.4.5-158: Removed superfluous vdd2 entries.<br>\
1.4.5-138: Added uinput into kernel. Added ability to control adjacent key filter.<br>\
1.4.5-124: Disable Palm diagnostics reporting when installed.<br>\
1.4.5-123: Enable cpu frequency debug.<br>\
1.4.5-121: Added crypto module support for TrueCrypt.<br>\
1.4.5-119: Robustified the battery percentage and cpu temperature checks in the early boot period.<br>\
1.4.5-113: Added ability to control core voltages at each frequency. Added ability to override screenstate charger frequency limiter. Added a new configurable frequency limiter based on percentage battery remaining. Reduced 1GHz voltage to save power, based on F105 testing results. Added USB mass storage patch for XBox360 compatibility.<br>\
1.4.5-92: Removed 550MHz, added 1GHz.<br> \
1.4.5-87: Limited frequency to 500MHz when temperature exceeds configurable limits (defaults to 55 degrees).<br> \
1.4.5-74: Limited frequency to 500MHz when charging on Touchstone to prevent overheating. Improved verification of target files for no existing modifications.<br>\
1.4.5-58: Limited frequency to 500MHz when charging at 1A to prevent overheating.<br>\
1.4.5-50: Incorporated compile flag performance improvements.<br>\
1.4.5-43: Updated with latest postinst and prerm OTA safety measures.<br>\
1.4.5-40: Enabled lower frequencies for screenstate minimum.<br>\
1.4.5-37: Includes free swap in Too Many Cards memory calculations.<br>\
1.4.5-35: Added compcache compressed RAM swap kernel module (not loaded by default).<br>\
1.4.5-32: Update and cleanup of charging code in screenstate governor.<br>\
1.4.5-21: Limit IVA2 block to 360MHz as per the mystery bug mentioned in the Palm kernel patch.<br>\
1.4.5-16: Improved screenstate transition detection.<br>\
1.4.5-13: Initial public release

HOMEPAGE = http://www.webos-internals.org/wiki/Application:UberKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = overclocking/600-720-800-1000-min-opp5.patch overclocking/defconfig-standard.patch \
		 sensors/sensors_temp_omap34xx.patch sensors/defconfig-safe.patch \
		 screenstate/screenstate.patch \
		 makefiletune/armMakefile.diff \
		 defconfig/defconfig.pre.cpugov \
		 compcache/compcache.patch compcache/lowmemnotify-total-memory.patch \
		 overclocking/override.patch overclocking/defconfig-override.patch \
		 usb/f_mass_storage.patch crypto/truecrypt-support-pre.patch \
		 idcode/idcode.patch \
		 keypad/maxim7359-keypad.patch uinput/defconfig-pre-y.patch
EXTERNAL_MODULES = compcache/compcache-0.5.4
TYPE = Kernel

include ../../support/kernel.mk
