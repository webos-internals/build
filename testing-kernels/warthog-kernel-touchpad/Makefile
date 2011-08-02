NAME = $(shell basename $(shell pwd))
TITLE = WarthogKernel (TouchPad)
DEVICE = touchpad
CATEGORY = Experimental
VERSIONS = 3.0.2-24
APPINFO_DESCRIPTION = In the jungle, the mighty jungle, the lion sleeps tonight. Oh wait... <br><br>\
A collection of highly experimental kernel improvements for the HP TouchPad, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to <a href=http://developer.palm.com/blog/2010/03/a-statement-on-the-overclocking-patches/>void your warranty</a> if things go wrong.</b><br>\
Current additions include:<ul>\
<li>Support for kernel crypto modules required by TrueCrypt</li>\
<li>Fix tick skew. BFQ IO scheduler. 1000Hz</li>\
<li>Overclock to 1.5GHz</li>\
</ul><br>\
For more information, visit <a href=${HOMEPAGE}>${HOMEPAGE}</a>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-24", "log" : [ "CPU align. BFQ CGROUP" ] }, \
{ "version" : "${WEBOS_VERSION}-21", "log" : [ "Overclock by unixpsycho. BFQ as default" ] }, \
{ "version" : "${WEBOS_VERSION}-13", "log" : [ "Fix tick skew. BFQ IO scheduler. 1000Hz" ] }, \
{ "version" : "${WEBOS_VERSION}-5", "log" : [ "Forward port old defconfigs" ] }, \
{ "version" : "${WEBOS_VERSION}-3", "log" : [ "Initial version" ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-24: CPU align. BFQ CGROUP<br>\
${WEBOS_VERSION}-21: Overclock by unixpsycho. BFQ as default<br>\
${WEBOS_VERSION}-13: Fix tick skew. BFQ IO scheduler. 1000Hz<br>\
${WEBOS_VERSION}-5: Forward port old defconfigs.<br>\
${WEBOS_VERSION}-3: Initial version.

HOMEPAGE = http://www.webos-internals.org/wiki/Application:WarthogKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = makefiletune/armMakefile.diff \
		 defconfig/defconfig-nodebug-touchpad.patch \
		 warthogbuild/defconfig-slim-touchpad.patch \
		 overclocking/touchpad-acpuclock.patch overclocking/defconfig-safe-touchpad.patch \
		 bfq/bfq-iosched.patch \
		 warthogbuild/tp-tickskew.patch \
		 warthogbuild/tp-1000hz.patch \
		 psychobuild/cpu_alignment.patch \
		 warthogbuild/defconfig-feat-touchpad.patch \
		 identification/mkcompile_h.patch \
		 warthogbuild/ident-touchpad.patch \
		 crypto/hw-support-touchpad.patch \
		 crypto/truecrypt-support-touchpad.patch

TYPE = Kernel

include ../../support/kernel.mk

# Override the compiler
#CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs11.03armel/build/arm-2111.03/bin/arm-none-linux-gnueabi-

