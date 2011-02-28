NAME = $(shell basename $(shell pwd))
TITLE = UberKernel (Pre/Pre+)
DEVICE = pre
CATEGORY = Experimental
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
]
CHANGELOG = \
${WEBOS_VERSION}-1: Initial version for webOS 2.1.0 on Pre/Pre+.

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
