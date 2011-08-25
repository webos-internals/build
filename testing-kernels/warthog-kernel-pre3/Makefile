NAME = $(shell basename $(shell pwd))
TITLE = WarthogKernel (Veer)
DEVICE = pre3
CATEGORY = Experimental
VERSIONS = 2.2.0-1
APPINFO_DESCRIPTION = In the jungle, the mighty jungle, the lion sleeps tonight. Oh wait... <br><br>\
A collection of all the best kernel improvements for the HP Veer, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to <a href=http://developer.palm.com/blog/2010/03/a-statement-on-the-overclocking-patches/>void your warranty</a> if things go wrong.</b><br>\
Current additions include:<ul>\
<li></li>\
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
 		 identification/mkcompile_h.patch
# 		 crypto/truecrypt-support-pre3.patch

# 		 defconfig/defconfig-nodebug-pre3.patch \
# 		 warthogbuild/defconfig-slim-pre3.patch \

# 		 psychobuild/cpu_alignment.patch \
# 		 warthogbuild/defconfig-feat-pre3.patch \

TYPE = Kernel

include ../../support/kernel.mk

# Override the compiler
#CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs11.03armel/build/arm-2011.03/bin/arm-none-linux-gnueabi-
