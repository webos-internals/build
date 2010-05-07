NAME = $(shell basename $(shell pwd))
TITLE = Uber-Kernel (Palm Pre/Pre+)
CATEGORY = Stable
VERSIONS = 1.4.1-21
APPINFO_DESCRIPTION = A collection of all the best kernel improvements for the Palm Pre/Pre+, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to void your warranty if things go wrong.<b><br>\
Current additions include:<ul>\
<li>720MHz and 800MHz kernel operating points (OPP6 and OPP7 for VDD1), based on the open source OMAP3440 kernel port, ported to the Palm Pre/Pre+ by uNiXpSyChO</li>\
<li>All standard Linux 2.6.24 cpufreq governors made available for selection via the Govnah application</li>\
<li>The OMAP3430 internal CPU temperature sensor is made available for measuring the true CPU temperature, ported to the Palm Pre/Pre+ by ka6sox & rwhitby</li>\
<li>A new <b>screenstate</b> governor created by uNiXpSyChO specifically for the Palm Pre/Pre+ which runs at a higher speed when the screen is on, and a lower speed when the screen is off</li>\
</ul><br>\
All additions are disabled by default, and must be enabled by separate packages or scripts (not included in this package).<br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "1.4.1-21", "log" : [ "Limit IVA2 block to 360MHz as per the mystery bug mentioned in the Palm kernel patch" ] }, \
{ "version" : "1.4.1-16", "log" : [ "Improved screenstate transition detection" ] }, \
{ "version" : "1.4.1-13", "log" : [ "Initial public release" ] }, \
]
CHANGELOG = 1.4.1-21: Limit IVA2 block to 360MHz as per the mystery bug mentioned in the Palm kernel patch.<br>1.4.1-16: Improved screenstate transition detection.<br>1.4.1-13: Initial public release

HOMEPAGE = http://www.webos-internals.org/wiki/Application:UberKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = overclocking/opp6-720-opp7-800-min-opp5.patch overclocking/defconfig-safe.patch \
		 sensors/sensors_temp_omap34xx.patch sensors/defconfig-safe.patch \
		 screenstate/screenstate.patch screenstate/defconfig-safe.patch

include ../../support/kernel.mk
