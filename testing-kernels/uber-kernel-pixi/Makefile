NAME = $(shell basename $(shell pwd))
TITLE = UberKernel (Pixi/Pixi+)
DEVICE   = pixi
CATEGORY = Experimental
VERSIONS = 1.4.1-50 1.4.3-46 1.4.5-50
APPINFO_DESCRIPTION = A collection of all the best kernel improvements for the Palm Pixi/Pixi+, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to <a href=http://developer.palm.com/blog/2010/03/a-statement-on-the-overclocking-patches/>void your warranty</a> if things go wrong.<b><br>\
Current additions include:<ul>\
<li>A new <a href=http://lwn.net/Articles/334649/><b>compcache</b> compressed RAM swap kernel module</a> ported to the Palm Pixi/Pixi+ by uNiXpSyChO & rwhitby</li>\
<li>Modification of the lowmemnotify threshold calculation to take into account free swap space, written by rwhitby</li>\
</ul><br>\
All additions are disabled by default, and must be enabled by separate packages or scripts (not included in this package).<br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-50", "log" : [ "Incorporated compile flag performance improvements from WarthogKernel experimentation stream" ] }, \
{ "version" : "${WEBOS_VERSION}-43", "log" : [ "Updated with latest postinst and prerm OTA safety measures" ] }, \
{ "version" : "${WEBOS_VERSION}-40", "log" : [ "First Pixi custom kernel" ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-50: Incorporated compile flag performance improvements from WarthogKernel experimentation stream.<br>${WEBOS_VERSION}-43: Updated with latest postinst and prerm OTA safety measures.<br>${WEBOS_VERSION}-40: First Pixi custom kernel

HOMEPAGE = http://www.webos-internals.org/wiki/Application:UberKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = compcache/compcache.patch compcache/lowmemnotify-total-memory.patch \
		 makefiletune/armMakefile.diff
KERNEL_MODULES = compcache/compcache-0.5.4

include ../../support/kernel.mk
