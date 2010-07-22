NAME = $(shell basename $(shell pwd))
TITLE = WarthogKernel (Pixi/Pixi+)
DEVICE = pixi
CATEGORY = Experimental
DEVICECOMPATIBILITY = [\"Pixi\"]
VERSIONS = 1.4.1-74 1.4.3-74 1.4.5-74
APPINFO_DESCRIPTION = In the jungle, the mighty jungle, the lion sleeps tonight. Oh wait... <br><br>\
A testbed of kernel patches for the Palm Pixi/Pixi+, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to <a href=http://developer.palm.com/blog/2010/03/a-statement-on-the-overclocking-patches/>void your warranty</a> if things go wrong.<b><br>\
Current additions include:<ul>\
<li>Optimized compile flags</li>\
<li>A new <a href=http://lwn.net/Articles/334649/><b>compcache</b> compressed RAM swap kernel module</a> ported to the Palm Pre/Pre+ by uNiXpSyChO & rwhitby</li>\
<li>Modification of the lowmemnotify threshold calculation to take into account free swap space, written by rwhitby</li>\
</ul><br>\
All additions are disabled by default, and must be enabled by separate packages or scripts (not included in this package).<br>\
For more information, visit <a href=${HOMEPAGE}>${HOMEPAGE}</a>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-74", "log" : [ "Back off sbromwich changes" ] }, \
{ "version" : "${WEBOS_VERSION}-62", "log" : [ "Disable MODVERSIONS." ] }, \
{ "version" : "${WEBOS_VERSION}-58", "log" : [ "Turn off some debug options" ] }, \
{ "version" : "${WEBOS_VERSION}-50", "log" : [ "Turn on all TCP congest algos and CPU governors" ] }, \
{ "version" : "${WEBOS_VERSION}-48", "log" : [ "Updated compcache compile flags" ] }, \
{ "version" : "${WEBOS_VERSION}-43", "log" : [ "Updated with latest postinst and prerm OTA safety measures" ] }, \
{ "version" : "${WEBOS_VERSION}-40", "log" : [ "First Pixi custom kernel" ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-73: Incorporate sbromwich changes.<br>${WEBOS_VERSION}-62: Disable MODVERSIONS.<br>${WEBOS_VERSION}-58: Turn off some debug options.<br>${WEBOS_VERSION}-50: Turn on all TCP congest algos and CPU governors.<br>${WEBOS_VERSION}-48: Updated compcache compile flags.<br>${WEBOS_VERSION}-43: Updated with latest postinst and prerm OTA safety measures.<br>${WEBOS_VERSION}-40: First Pixi custom kernel

HOMEPAGE = http://www.webos-internals.org/wiki/Application:WarthogKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = compcache/compcache.patch compcache/lowmemnotify-total-memory.patch \
		 makefiletune/armMakefile.diff \
		 defconfig/defconfig.pixi.cpugov defconfig/defconfig.pixi.tcpcong warthogbuild/defconfig-nodebug-pixi.patch
KERNEL_MODULES = compcache/compcache-0.5.4

include ../../support/kernel.mk

# Override the compiler
CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs10q1armel/build/arm-2010q1/bin/arm-none-linux-gnueabi-
