NAME = $(shell basename $(shell pwd))
TITLE = UberKernel (Pre2)
DEVICE = pre2
CATEGORY = Experimental
VERSIONS = 2.0.1-75 2.1.0-75
APPINFO_DESCRIPTION = A collection of all the best kernel improvements for the Palm Pre2, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to <a href=http://developer.palm.com/blog/2010/03/a-statement-on-the-overclocking-patches/>void your warranty</a> if things go wrong.</b><br>\
Current additions include:<ul>\
<li>A new 1.1 GHz kernel operating points, ported to the Palm Pre 2 by uNiXpSyChO.</li>\
<li>Modification of the lowmemnotify threshold calculation to take into account free swap space, written by rwhitby</li>\
<li>A new <a href=http://lwn.net/Articles/334649/><b>compcache</b> compressed RAM swap kernel module</a> ported to the Palm Pre/Pre+ by uNiXpSyChO & rwhitby</li>\
<li>The OMAP3630 internal CPU temperature sensor is made available for measuring the true CPU temperature, ported to the Palm Pre 2 by ka6sox & rwhitby.</li>\
<li>All standard Linux 2.6.24 <a href=http://www.ibm.com/developerworks/linux/library/l-cpufreq-1/index.html>cpufreq governors</a> made available for selection via the Govnah application.</li>\
<li>Additions to the USB mass storage driver for XBox 360 compatibility.  Note that your USB drive may be reformatted when you plug it into an XBox 360.</li>\
<li>Support for kernel crypto modules required by TrueCrypt</li>\
</ul><br>\
All additions are disabled by default, and must be enabled by using the Govnah application.<br>\
For more information, visit <a href=${HOMEPAGE}>${HOMEPAGE}</a>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-75", "log" : [ "Added 1.1GHz overclocking" ] }, \
{ "version" : "${WEBOS_VERSION}-19", "log" : [ "Refreshed patches for webOS 2.1.0" ] }, \
{ "version" : "${WEBOS_VERSION}-3", "log" : [ "Added temperature sensor" ] }, \
{ "version" : "${WEBOS_VERSION}-2", "log" : [ "Initial version" ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-75: Added 1.1GHz overclocking.<br>\
${WEBOS_VERSION}-19: Refreshed patches for webOS 2.1.0.<br>\
${WEBOS_VERSION}-3: Added temperature sensor.<br>\
${WEBOS_VERSION}-2: Initial version.

HOMEPAGE = http://www.webos-internals.org/wiki/Application:UberKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git

KERNEL_PATCHES = overclocking/600-1000-1100-pre2.patch overclocking/defconfig-standard-pre2.patch \
		 sensors/omap34xx_temp.patch sensors/defconfig-safe.patch \
		 defconfig/defconfig.pre2.cpugov \
		 makefiletune/armMakefile.diff \
		 compcache/compcache.patch compcache/lowmemnotify-total-memory.patch \
		 usb/f_mass_storage.patch crypto/truecrypt-support-pre2.patch \
		 idcode/idcode.patch console/enable-console.patch

EXTERNAL_MODULES = compcache/compcache-0.5.4
TYPE = Kernel

include ../../support/kernel.mk

# Override the compiler
CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs09q1armel/build/arm-2009q1/bin/arm-none-linux-gnueabi-
