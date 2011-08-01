NAME = $(shell basename $(shell pwd))
TITLE = UberKernel (TouchPad)
DEVICE = touchpad
CATEGORY = Experimental
VERSIONS = 3.0.0-20
APPINFO_DESCRIPTION = A collection of all the best kernel improvements for the HP TouchPad, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to <a href=http://developer.palm.com/blog/2010/03/a-statement-on-the-overclocking-patches/>void your warranty</a> if things go wrong.</b><br>\
Current additions include:<ul>\
<li>A new 1.5 GHz kernel operating point (enabled by simply removing speed bin limiters). Note that this is not enabled by default (use Govnah to select a 1.5GHz profile).</li>\
<li>All standard Linux 2.6.35 <a href=http://www.ibm.com/developerworks/linux/library/l-cpufreq-1/index.html>cpufreq governors</a> made available for selection via the Govnah application.</li>\
<li>Support for kernel crypto modules required by TrueCrypt</li>\
</ul><br>\
All additions are controlled by using the Govnah application.<br>\
For more information, visit <a href=${HOMEPAGE}>${HOMEPAGE}</a>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-20", "log" : [ "Added 1.5 GHz overclocking support" ] }, \
{ "version" : "${WEBOS_VERSION}-8", "log" : [ "Initial version" ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-20: Added 1.5 GHz overclocking support.<br>\
${WEBOS_VERSION}-8: Initial version.

HOMEPAGE = http://www.webos-internals.org/wiki/Application:UberKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = makefiletune/armMakefile.diff \
		 identification/mkcompile_h.patch \
		 overclocking/touchpad-acpuclock.patch overclocking/defconfig-safe-touchpad.patch \
		 crypto/hw-support-touchpad.patch \
		 crypto/truecrypt-support-touchpad.patch

TYPE = Kernel

include ../../support/kernel.mk
