NAME = $(shell basename $(shell pwd))
TITLE = UberKernel (Pixi/Pixi+)
DEVICE   = pixi
CATEGORY = Experimental
VERSIONS = 1.5.0-74
APPINFO_DESCRIPTION = A collection of all the best kernel improvements for the Palm Pixi/Pixi+, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to <a href=http://developer.palm.com/blog/2010/03/a-statement-on-the-overclocking-patches/>void your warranty</a> if things go wrong.<b><br>\
Current additions include:<ul>\
<li>A new <a href=http://lwn.net/Articles/334649/><b>compcache</b> compressed RAM swap kernel module</a> ported to the Palm Pixi/Pixi+ by uNiXpSyChO & rwhitby</li>\
<li>Modification of the lowmemnotify threshold calculation to take into account free swap space, written by rwhitby</li>\
</ul><br>\
All additions are disabled by default, and must be enabled by using the Govnah application.<br>\
Note that overclocking over 600MHz is not available for the Pixi hardware.<br>\
For more information, visit <a href=${HOMEPAGE}>${HOMEPAGE}</a>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-74", "log" : [ "Improved verification of target files for no existing modifications" ] }, \
{ "version" : "${WEBOS_VERSION}-58", "log" : [ "Incorporated compile flag performance improvements" ] }, \
{ "version" : "${WEBOS_VERSION}-43", "log" : [ "Updated with latest postinst and prerm OTA safety measures" ] }, \
{ "version" : "${WEBOS_VERSION}-40", "log" : [ "First Pixi custom kernel" ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-74: Improved verification of target files for no existing modifications.<br>\
${WEBOS_VERSION}-50: Incorporated compile flag performance improvements.<br>\
${WEBOS_VERSION}-43: Updated with latest postinst and prerm OTA safety measures.<br>\
${WEBOS_VERSION}-40: First Pixi custom kernel

HOMEPAGE = http://www.webos-internals.org/wiki/Application:UberKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = compcache/compcache.patch compcache/lowmemnotify-total-memory.patch \
		 makefiletune/armMakefile.diff
EXTERNAL_MODULES = compcache/compcache-0.5.4
TYPE = Kernel

include ../../support/kernel.mk
