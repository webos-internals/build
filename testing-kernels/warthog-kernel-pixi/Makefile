NAME = $(shell basename $(shell pwd))
TITLE = WarthogKernel (Pixi/Pixi+)
CATEGORY = Experimental
VERSIONS = 1.4.1-44 1.4.3-44
APPINFO_DESCRIPTION = A collection of all the best kernel improvements for the Palm Pixi/Pixi+, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to <a href=http://developer.palm.com/blog/2010/03/a-statement-on-the-overclocking-patches/>void your warranty</a> if things go wrong.<b><br>\
Current additions include:<ul>\
<li>Optimized compile flags</li>\
<li>The OMAP3430 internal CPU temperature sensor is made available for measuring the true CPU temperature, ported to the Palm Pre/Pre+ by ka6sox & rwhitby</li>\
<li>A new <b>screenstate</b> governor created by uNiXpSyChO specifically for the Palm Pre/Pre+ which runs at a higher speed when the screen is on, and a lower speed when the screen is off</li>\
<li>A new <a href=http://lwn.net/Articles/334649/><b>compcache</b> compressed RAM swap kernel module</a> ported to the Palm Pre/Pre+ by uNiXpSyChO & rwhitby</li>\
</ul><br>\
All additions are disabled by default, and must be enabled by separate packages or scripts (not included in this package).<br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-44", "log" : [ "Updated compcache compile flags" ] }, \
{ "version" : "${WEBOS_VERSION}-43", "log" : [ "Updated with latest postinst and prerm OTA safety measures" ] }, \
{ "version" : "${WEBOS_VERSION}-40", "log" : [ "First Pixi custom kernel" ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-44: Updated compcache compile flags.<br>${WEBOS_VERSION}-43: Updated with latest postinst and prerm OTA safety measures.<br>${WEBOS_VERSION}-40: First Pixi custom kernel

HOMEPAGE = http://www.webos-internals.org/wiki/Application:WarthogKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = compcache/compcache.patch compcache/lowmemnotify-total-memory.patch \
		 makefiletune/Makefile.pixi.diff
KERNEL_MODULES = compcache/compcache-0.5.4

include ../../support/kernel.mk
