NAME = $(shell basename $(shell pwd))
TITLE = UberKernel (Pixi/Pixi+)
DEVICE   = pixi
CATEGORY = Stable
VERSIONS = 1.4.5-178 1.4.5.1-178
APPINFO_DESCRIPTION = A collection of all the best kernel improvements for the Palm Pixi/Pixi+, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to <a href=http://developer.palm.com/blog/2010/03/a-statement-on-the-overclocking-patches/>void your warranty</a> if things go wrong.</b><br>\
Current additions include:<ul>\
<li>748.8MHz, 768MHz, 787.2MHz and 806.4MHz kernel operating points, based on information from the Android community, ported to the Palm Pixi/Pixi+ by codecrumb and rwhitby</li>\
<li>Modification of the lowmemnotify threshold calculation to take into account free swap space, written by rwhitby</li>\
<li>A new <a href=http://lwn.net/Articles/334649/><b>compcache</b> compressed RAM swap kernel module</a> ported to the Palm Pixi/Pixi+ by uNiXpSyChO & rwhitby</li>\
<li>All standard Linux 2.6.24 <a href=http://www.ibm.com/developerworks/linux/library/l-cpufreq-1/index.html>cpufreq governors</a> made available for selection via the Govnah application</li>\
<li>Additions to the USB mass storage driver for XBox 360 compatibility.  Note that your USB drive may be reformatted when you plug it into an XBox 360.</li>\
<li>Support for kernel crypto modules required by TrueCrypt</li>\
<li>Userspace Input device required by KeyBoss and the Virtual Keyboard for keypad input control.</li>\
<li>Support for controlling the adjacent key filter in the keypad driver. Use KeyBoss to control this parameter.</li>\
</ul><br>\
All additions are disabled by default, and must be enabled by using the Govnah application.<br>\
For more information, visit <a href=${HOMEPAGE}>${HOMEPAGE}</a>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-178", "log" : [ "Added webOS 1.4.5.1 compatibility" ] }, \
{ "version" : "${WEBOS_VERSION}-157", "log" : [ "Added 806MHz Pixi overclocking" ] }, \
{ "version" : "${WEBOS_VERSION}-149", "log" : [ "Added uinput into kernel", "Added ability to control adjacent key filter" ] }, \
{ "version" : "${WEBOS_VERSION}-128", "log" : [ "Added 787MHz Pixi overclocking" ] }, \
{ "version" : "${WEBOS_VERSION}-124", "log" : [ "Disable Palm diagnostics reporting when installed" ] }, \
{ "version" : "${WEBOS_VERSION}-122", "log" : [ "Make UberKernel/Pixi overclocking compliant with the 7 principes of kernel design and packaging" ] }, \
{ "version" : "${WEBOS_VERSION}-121", "log" : [ "Added 768MHz Pixi overclocking", "Added crypto module support for TrueCrypt" ] }, \
{ "version" : "${WEBOS_VERSION}-118", "log" : [ "Added 750MHz Pixi overclocking" ] }, \
{ "version" : "${WEBOS_VERSION}-113", "log" : [ "Added USB mass storage patch for XBox360 compatibility" ] }, \
{ "version" : "${WEBOS_VERSION}-74", "log" : [ "Improved verification of target files for no existing modifications" ] }, \
{ "version" : "${WEBOS_VERSION}-58", "log" : [ "Incorporated compile flag performance improvements" ] }, \
{ "version" : "${WEBOS_VERSION}-43", "log" : [ "Updated with latest postinst and prerm OTA safety measures" ] }, \
{ "version" : "${WEBOS_VERSION}-40", "log" : [ "First Pixi custom kernel" ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-178: Added webOS 1.4.5.1 compatibility.<br>\
${WEBOS_VERSION}-157: Added 806MHz Pixi overclocking.<br>\
${WEBOS_VERSION}-149: Added uinput into kernel. Added ability to control adjacent key filter.<br>\
${WEBOS_VERSION}-128: Added 787MHz Pixi overclocking.<br>\
${WEBOS_VERSION}-124: Disable Palm diagnostics reporting when installed.<br>\
${WEBOS_VERSION}-122: Make UberKernel/Pixi overclocking compliant with the 7 principles of kernel design and packaging.<br>\
${WEBOS_VERSION}-121: Added 768MHz Pixi overclocking. Added crypto module support for TrueCrypt.<br>\
${WEBOS_VERSION}-118: Added 750MHz Pixi overclocking.<br>\
${WEBOS_VERSION}-113: Added USB mass storage patch for XBox360 compatibility.<br>\
${WEBOS_VERSION}-74: Improved verification of target files for no existing modifications.<br>\
${WEBOS_VERSION}-50: Incorporated compile flag performance improvements.<br>\
${WEBOS_VERSION}-43: Updated with latest postinst and prerm OTA safety measures.<br>\
${WEBOS_VERSION}-40: First Pixi custom kernel

HOMEPAGE = http://www.webos-internals.org/wiki/Application:UberKernel
SRC_GIT = git://github.com/webos-internals/kernel-patches.git
KERNEL_PATCHES = overclocking/pixi-acpuclock.patch \
		 overclocking/pixi-freq-table.patch overclocking/pixi-freq-set.patch \
		 makefiletune/armMakefile.diff \
		 defconfig/defconfig.pixi.cpugov \
		 compcache/compcache.patch compcache/lowmemnotify-total-memory.patch \
		 usb/f_mass_storage.patch crypto/truecrypt-support-pixi.patch \
		 keypad/gpio-keypad.patch
EXTERNAL_MODULES = compcache/compcache-0.5.4
TYPE = Kernel

include ../../support/kernel.mk
