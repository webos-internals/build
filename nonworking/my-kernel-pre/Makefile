NAME = $(shell basename $(shell pwd))
TITLE = MyKernel (Pre/Pre+)
CATEGORY = Experimental
VERSIONS = 1.4.1.1-1
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
{ "version" : "1.4.1-1", "log" : [ "Test" ] }, \
]
CHANGELOG = 1.4.1-1: Test

HOMEPAGE = http://www.webos-internals.org/wiki/Application:UberKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = overclocking/opp6-720-opp7-800-min-opp5.patch overclocking/defconfig-safe.patch \
		 sensors/sensors_temp_omap34xx.patch sensors/defconfig-safe.patch \
		 screenstate/screenstate.patch screenstate/defconfig-safe.patch \
		 koptimise/defconfig-optimise makefiletune/Makefile.diff \
		 prcm/prcm_clk.c.diff prcm/proc_pwr.c.diff \

include ../../support/kernel.mk
