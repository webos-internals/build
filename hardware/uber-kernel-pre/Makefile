NAME = $(shell basename $(shell pwd))
TITLE = Uber-Kernel (Palm Pre)
DESCRIPTION = A collection of all the best kernel improvements for the Palm Pre, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to void your warranty if things go wrong.<b><br>\
Current additions include:<ul>\
<li>720MHz and 800MHz operating points (OPP6 and OPP7 for VDD1), based on the open source OMAP3440 kernel port, modified for the Palm Pre kernel by uNiXpSyChO</li>\
<li><a href=http://kernel.org/pub/linux/kernel/people/lenb/acpi/doc/OLS2006-ondemand-paper.pdf>Ondemand dynamic in-kernel cpufreq governor</a> that can change CPU frequency depending on CPU utilization (a standard part of the open source Linux kernel, compiled for Palm Pre kernel by uNiXpSyChO)</li>\
</ul><br>${KERNEL_DISCLAIMER}
CATEGORY = Hardware-Related
VERSIONS = 1.4.1-2
ICON = http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png
SCREENSHOTS = 
META_SUB_VERSION = 1

include ../common.mk

HOMEPAGE = http://www.webos-internals.org/wiki/Application:UberKernel
KERNEL_PATCHES = overclocking/opp6-720-opp7-800-min-opp5.patch overclocking/defconfig-safe.patch

PACKAGES = ipkgs/${APP_ID}_${VERSION}_arm.ipk

include ../kernel.mk
