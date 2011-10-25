NAME = $(shell basename $(shell pwd))
TITLE = WarthogKernel (Pixi/Pixi+)
DEVICE = pixi
CATEGORY = Beta
VERSIONS = 1.4.5-178
APPINFO_DESCRIPTION = In the jungle, the mighty jungle, the lion sleeps tonight. Oh wait... <br><br>\
A testbed of kernel patches for the Palm Pixi/Pixi+, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to <a href=http://developer.palm.com/blog/2010/03/a-statement-on-the-overclocking-patches/>void your warranty</a> if things go wrong.</b><br>\
Current additions include:<ul>\
<li>748.8, 768, 787 & 800MHz kernel operating points, based on information from the Android community, ported to the Palm Pixi/Pixi+ by codecrumb and rwhitby</li>\
<li>Modification of the lowmemnotify threshold calculation to take into account free swap space, written by rwhitby</li>\
<li>A new <a href=http://lwn.net/Articles/334649/><b>compcache</b> compressed RAM swap kernel module</a> ported to the Palm Pixi/Pixi+ by uNiXpSyChO & rwhitby</li>\
<li>A new <a href=http://lwn.net/Articles/334649/><b>compcache</b> compressed RAM swap kernel module</a> ported to the Palm Pixi/Pixi+ by uNiXpSyChO & rwhitby</li>\
<li>All standard Linux 2.6.24 <a href=http://www.ibm.com/developerworks/linux/library/l-cpufreq-1/index.html>cpufreq governors</a> made available for selection via the Govnah application</li>\
</ul><br>\
All additions are disabled by default, and must be enabled by separate packages or scripts (not included in this package).<br>\
For more information, visit <a href=${HOMEPAGE}>${HOMEPAGE}</a>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-178", "log" : [ "Added webOS 1.4.5.1 compatibility" ] }, \
{ "version" : "${WEBOS_VERSION}-166", "log" : [ "Added 825, 835, 849 speeds. MAY EAT YOUR PHONE" ] }, \
{ "version" : "${WEBOS_VERSION}-133", "log" : [ "Added 787 & 800MHz Pixi overclocking. TrueCrypt support" ] }, \
{ "version" : "${WEBOS_VERSION}-124", "log" : [ "Make Pixi overclocking compliant with the 7 principes of kernel design and packaging" ] }, \
{ "version" : "${WEBOS_VERSION}-120", "log" : [ "Added 768MHz Pixi overclocking" ] }, \
{ "version" : "${WEBOS_VERSION}-118", "log" : [ "Added 750MHz Pixi overclocking" ] }, \
{ "version" : "${WEBOS_VERSION}-113", "log" : [ "Turn off additional TCP congest algos. Stick with cubic. Added USB mass storage patch for XBox360 compatibility." ] }, \
{ "version" : "${WEBOS_VERSION}-100", "log" : [ "Defconfig cleanup, sched_fair tweak, default AS scheduler" ] }, \
{ "version" : "${WEBOS_VERSION}-85", "log" : [ "Build using official 1.4.5 sources" ] }, \
{ "version" : "${WEBOS_VERSION}-74", "log" : [ "Back off sbromwich changes" ] }, \
{ "version" : "${WEBOS_VERSION}-62", "log" : [ "Disable MODVERSIONS." ] }, \
{ "version" : "${WEBOS_VERSION}-58", "log" : [ "Turn off some debug options" ] }, \
{ "version" : "${WEBOS_VERSION}-50", "log" : [ "Turn on all TCP congest algos and CPU governors" ] }, \
{ "version" : "${WEBOS_VERSION}-48", "log" : [ "Updated compcache compile flags" ] }, \
{ "version" : "${WEBOS_VERSION}-43", "log" : [ "Updated with latest postinst and prerm OTA safety measures" ] }, \
{ "version" : "${WEBOS_VERSION}-40", "log" : [ "First Pixi custom kernel" ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-178: Added webOS 1.4.5.1 compatibility.<br>\
${WEBOS_VERSION}-166: Added 825, 835, 849 speeds. MAY EAT YOUR PHONE.<br>\
${WEBOS_VERSION}-139: Added 787 & 800MHz Pixi overclocking. TrueCrypt support.<br>\
${WEBOS_VERSION}-124: Make Pixi overclocking compliant with the 7 principles of kernel design and packaging.<br>\
${WEBOS_VERSION}-120: Added 768MHz Pixi overclocking.<br>\
${WEBOS_VERSION}-118: Added 750MHz Pixi overclocking.<br>\
${WEBOS_VERSION}-113: Turn off additional TCP congest algos. Stick with cubic. Added USB mass storage patch for XBox360 compatibility.<br>\
${WEBOS_VERSION}-100: Defconfig cleanup, sched_fair tweak, default AS scheduler.<br>\
${WEBOS_VERSION}-85: Build using official 1.4.5 sources.<br>\
${WEBOS_VERSION}-73: Incorporate sbromwich changes.<br>\
${WEBOS_VERSION}-62: Disable MODVERSIONS.<br>\
${WEBOS_VERSION}-58: Turn off some debug options.<br>\
${WEBOS_VERSION}-50: Turn on all TCP congest algos and CPU governors.<br>\
${WEBOS_VERSION}-48: Updated compcache compile flags.<br>\
${WEBOS_VERSION}-43: Updated with latest postinst and prerm OTA safety measures.<br>\
${WEBOS_VERSION}-40: First Pixi custom kernel

HOMEPAGE = http://www.webos-internals.org/wiki/Application:WarthogKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = warthogbuild/pixi-acpuclock.patch \
		 overclocking/pixi-freq-table.patch overclocking/pixi-freq-set.patch \
		 compcache/compcache.patch compcache/lowmemnotify-total-memory.patch \
		 makefiletune/armMakefile.diff \
		 defconfig/defconfig.pixi.cpugov defconfig/defconfig-nodebug-pixi.patch \
		 warthogbuild/defconfig-as-pixi.patch warthogbuild/defconfig-slim-pixi.patch \
		 usb/f_mass_storage.patch crypto/truecrypt-support-pixi.patch
EXTERNAL_MODULES = compcache/compcache-0.5.4
TYPE = Kernel

include ../../support/kernel.mk

# Override the compiler
#CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs09q1armel/build/arm-2009q1/bin/arm-none-linux-gnueabi-

#		 warthogbuild/sched_fair.patch \
