NAME = $(shell basename $(shell pwd))
TITLE = WarthogKernel (Pre3)
DEVICE = pre3
CATEGORY = Alpha
VERSIONS = 2.2.0-33 2.2.3-33
APPINFO_DESCRIPTION = In the jungle, the mighty jungle, the lion sleeps tonight. Oh wait... <br><br>\
A collection of all the best kernel improvements for the HP Pre3, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to <a href=http://developer.palm.com/blog/2010/03/a-statement-on-the-overclocking-patches/>void your warranty</a> if things go wrong.</b><br>\
This package is compatible only with webOS 2.2.0 build 3171 or webOS 2.2.3 - if you have a webOS 2.2.0 device with a different build number, you will need to doctor it before installing this package.<br>\
Current additions include:<ul>\
<li>New overclocking support ported to the Pre 3 by uNiXpSyChO.</li>\
<li>Support for kernel crypto modules required by TrueCrypt</li>\
<li>Fix tick skew. BFQ IO scheduler. 300Hz</li>\
<li>Use Westwood for TCP congest. slowstart fix</li>\
<li>ext4, CIFS & NFS support</li>\
<li>iSCSI & ATA over Ethernet network protocol support</li>\
<li>Top speed of 2.016GHz. Frequencies under 1.401GHz have been undervolted</li>\
</ul><br>\
All additions are disabled by default, and must be enabled by using the Govnah application.<br>\
For more information, visit <a href=${HOMEPAGE}>${HOMEPAGE}</a>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-33", "log" : [ "Backport PRR from Linux 3.2" ] }, \
{ "version" : "${WEBOS_VERSION}-26", "log" : [ "Overclock, undervolt. Ext4, CIFS, NFS, iSCSI & ATA over Ethernet" ] }, \
{ "version" : "${WEBOS_VERSION}-10", "log" : [ "Use Westwood TCP congest algo. slowstart fix" ] }, \
{ "version" : "${WEBOS_VERSION}-7", "log" : [ "TMC fix. nodebug. memcpy. CPU align" ] }, \
{ "version" : "${WEBOS_VERSION}-4", "log" : [ "Fix tick skew. BFQ as default IO scheduler. 300Hz. compcache" ] }, \
{ "version" : "${WEBOS_VERSION}-1", "log" : [ "Initial version" ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-33: Backport PRR from Linux 3.2<br>\
${WEBOS_VERSION}-26: Overclock, undervolt. Ext4, CIFS, NFS, iSCSI & ATA over Ethernet<br>\
${WEBOS_VERSION}-10: Use Westwood TCP congest algo. slowstart fix<br>\
${WEBOS_VERSION}-7: TMC fix. nodebug. memcpy. CPU align.<br>\
${WEBOS_VERSION}-4: Fix tick skew. BFQ as default IO scheduler. 300Hz. compcache<br>\
${WEBOS_VERSION}-1: Initial version.

HOMEPAGE = http://www.webos-internals.org/wiki/Application:WarthogKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = makefiletune/armMakefile.diff \
 		 defconfig/defconfig-nodebug-pre3.patch \
 		 compcache/lowmemnotify-total-memory.patch \
		 warthogbuild/pre3-overclock.patch \
		 psychobuild/override.patch \
		 psychobuild/ondemand-ng.patch \
 		 bfq/bfq-iosched.patch \
 		 warthogbuild/pre3-tickskew.patch \
 		 warthogbuild/pre3-300hz.patch \
 		 warthogbuild/pre3-slowstart.patch \
 		 warthogbuild/net-prr.patch \
 		 psychobuild/cpu_alignment.patch \
 		 psychobuild/cpu_alignment-p2.patch \
 		 psychobuild/memcpy.patch \
 		 psychobuild/fbconsole.patch \
 		 warthogbuild/defconfig-feat-pre3.patch \
 		 identification/mkcompile_h.patch \
 		 filesystems/ext4.patch filesystems/nfs.patch filesystems/cifs.patch \
		 filesystems/iscsi.patch filesystems/ataoe.patch \
 		 warthogbuild/ident-pre3.patch \
 		 crypto/hw-support-pre3.patch \
 		 crypto/truecrypt-support-pre3.patch

# 		 warthogbuild/defconfig-slim-pre3.patch \
# 		 defconfig/defconfig-nodebug-pre3.patch \


EXTERNAL_MODULES = compcache/compcache-1.0.0
TYPE = Kernel

include ../../support/kernel.mk

# Override the compiler
#CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs11.03armel/build/arm-2011.03/bin/arm-none-linux-gnueabi-
