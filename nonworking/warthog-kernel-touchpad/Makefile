NAME = $(shell basename $(shell pwd))
TITLE = WarthogKernel (TouchPad)
DEVICE = touchpad
CATEGORY = Experimental
VERSIONS = 3.0.0-1
APPINFO_DESCRIPTION = In the jungle, the mighty jungle, the lion sleeps tonight. Oh wait... <br><br>\
A collection of all the best kernel improvements for the HP TouchPad, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to <a href=http://developer.palm.com/blog/2010/03/a-statement-on-the-overclocking-patches/>void your warranty</a> if things go wrong.</b><br>\
Current additions include:<ul>\
<li>Support for kernel crypto modules required by TrueCrypt</li>\
</ul><br>\
All additions are disabled by default, and must be enabled by using the Govnah application.<br>\
For more information, visit <a href=${HOMEPAGE}>${HOMEPAGE}</a>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-1", "log" : [ "Initial version" ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-1: Initial version.

HOMEPAGE = http://www.webos-internals.org/wiki/Application:WarthogKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = makefiletune/armMakefile.diff \
		 crypto/truecrypt-support-touchpad.patch

TYPE = Kernel

include ../../support/kernel.mk

CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs09q1armel/build/arm-2009q1/bin/arm-none-linux-gnueabi-
