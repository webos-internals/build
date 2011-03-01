NAME = $(shell basename $(shell pwd))
TITLE = WarthogKernel (Pre/Pre+)
DEVICE = pre
CATEGORY = Experimental
VERSIONS = 2.1.0-6
APPINFO_DESCRIPTION = In the jungle, the mighty jungle, the lion sleeps tonight. Oh wait... <br><br>\
A testbed of kernel patches for the Palm Pre/Pre+, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to <a href=http://developer.palm.com/blog/2010/03/a-statement-on-the-overclocking-patches/>void your warranty</a> if things go wrong.</b><br>\
Current additions include:<ul>\
<li>Optimized compile flags</li>\
<li>720MHz, 800Mhz and 1050MHz kernel operating points (OPP5, OPP6 & OPP7 for VDD1), based on the open source OMAP3440 kernel port, ported to the Palm Pre/Pre+ by uNiXpSyChO</li>\
<li>All standard Linux 2.6.24 <a href=http://www.ibm.com/developerworks/linux/library/l-cpufreq-1/index.html>cpufreq governors</a> made available for selection via the Govnah application</li>\
<li>The OMAP3430 internal CPU temperature sensor is made available for measuring the true CPU temperature, ported to the Palm Pre/Pre+ by ka6sox & rwhitby</li>\
<li>A new <b>screenstate</b> governor created by uNiXpSyChO specifically for the Palm Pre/Pre+ which runs at a higher speed when the screen is on, and a lower speed when the screen is off</li>\
<li>A new <a href=http://lwn.net/Articles/334649/><b>compcache</b> compressed RAM swap kernel module</a> ported to the Palm Pre/Pre+ by uNiXpSyChO & rwhitby</li>\
<li>Automatic temperature limiting support, written by uNiXpSyChO, ka6sox & rwhitby</li>\
</ul><br>\
All additions are disabled by default, and must be enabled by separate packages or scripts (not included in this package).<br>\
For more information, visit <a href=${HOMEPAGE}>${HOMEPAGE}</a>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-6", "log" : [ "Initial version for webOS 2.1.0 on Pre/Pre+" ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-13: Initial version for webOS 2.1.0 on Pre/Pre+

HOMEPAGE = http://www.webos-internals.org/wiki/Application:WarthogKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = warthogbuild/opp5-720-opp6-800-opp7-1050.patch overclocking/defconfig-standard.patch \
		 sensors/omap34xx_temp.patch sensors/defconfig-safe.patch \
		 screenstate/screenstate.patch \
		 compcache/lowmemnotify-total-memory.patch \
		 makefiletune/armMakefile.diff \
		 warthogbuild/smartreflex-opp.patch \
		 defconfig/defconfig.pre.cpugov	defconfig/defconfig-nodebug-pre.patch \
		 warthogbuild/defconfig-as-pre.patch warthogbuild/defconfig-slim-pre.patch \
		 usb/f_mass_storage.patch crypto/truecrypt-support-pre.patch keypad/maxim7359-keypad.patch \
		 overclocking/override.patch overclocking/defconfig-override.patch
TYPE = Kernel

include ../../support/kernel.mk

# Override the compiler
#CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs09q1armel/build/arm-2009q1/bin/arm-none-linux-gnueabi-

#folk/board-sirloin-headset-detect.c.diff \
#folk/omap_misc_hsuart.c.diff folk/omap_fb.c.diff \
#folk/pm_cpuidle.c.diff warthogbuild/defconfig-folk-pre.diff \
