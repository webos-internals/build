NAME = $(shell basename $(shell pwd))
TITLE = WarthogKernel (Pre3)
DEVICE = pre3
CATEGORY = Alpha
VERSIONS = 2.2.4-47
APPINFO_DESCRIPTION = In the jungle, the mighty jungle, the lion sleeps tonight. Oh wait... <br><br>\
A collection of all the best kernel improvements for the HP Pre3, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to <a href=http://developer.palm.com/blog/2010/03/a-statement-on-the-overclocking-patches/>void your warranty</a> if things go wrong.</b><br>\
This package is compatible only with webOS 2.2.4.<br>\
Current additions include:<ul>\
<li>New overclocking support ported to the Pre 3 by uNiXpSyChO.</li>\
<li>Support for kernel crypto modules required by TrueCrypt</li>\
<li>Fix tick skew. BFQ IO scheduler. 300Hz</li>\
<li>Use Westwood for TCP congest. slowstart fix</li>\
<li>ext4, CIFS & NFS support</li>\
<li>iSCSI & ATA over Ethernet network protocol support</li>\
<li>Top speed of 2.016GHz. Frequencies under 1.401GHz have been undervolted</li>\
<li>Backported Proportional Rate Reduction for TCP (PRR)</li>\
<li>Backported TinyRCU</li>\
<li>Backported TCP slow start boost to 10</li>\
<li>Lagfree CPU gov (ported by uNiXpSyChO)</li>\
<li>CPU voltage override by uNiXpSyChO</li>\
</ul><br>\
All additions are disabled by default, and must be enabled by using the Govnah application.<br>\
For more information, visit <a href=${HOMEPAGE}>${HOMEPAGE}</a>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-47", "log" : [ "Switch to github. Add VR and SIO schedulers." ] }, \
{ "version" : "${WEBOS_VERSION}-42", "log" : [ "Backported TinyRCU. SHA1 update. Compcache update. Lagfree gov" ] }, \
{ "version" : "${WEBOS_VERSION}-35", "log" : [ "Backport PRR from Linux 3.2" ] }, \
{ "version" : "${WEBOS_VERSION}-26", "log" : [ "Overclock, undervolt. Ext4, CIFS, NFS, iSCSI & ATA over Ethernet" ] }, \
{ "version" : "${WEBOS_VERSION}-10", "log" : [ "Use Westwood TCP congest algo. slowstart fix" ] }, \
{ "version" : "${WEBOS_VERSION}-7", "log" : [ "TMC fix. nodebug. memcpy. CPU align" ] }, \
{ "version" : "${WEBOS_VERSION}-4", "log" : [ "Fix tick skew. BFQ as default IO scheduler. 300Hz. compcache" ] }, \
{ "version" : "${WEBOS_VERSION}-1", "log" : [ "Initial version" ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-47: Switch to github. Add VR and SIO schedulers.<br>\
${WEBOS_VERSION}-42: Backported TinyRCU. SHA1 update. Compcache update. Lagfree gov<br>\
${WEBOS_VERSION}-35: Backport PRR from Linux 3.2<br>\
${WEBOS_VERSION}-26: Overclock, undervolt. Ext4, CIFS, NFS, iSCSI & ATA over Ethernet<br>\
${WEBOS_VERSION}-10: Use Westwood TCP congest algo. slowstart fix<br>\
${WEBOS_VERSION}-7: TMC fix. nodebug. memcpy. CPU align.<br>\
${WEBOS_VERSION}-4: Fix tick skew. BFQ as default IO scheduler. 300Hz. compcache<br>\
${WEBOS_VERSION}-1: Initial version.

HOMEPAGE = http://www.webos-internals.org/wiki/Application:WarthogKernel

KERNEL_GIT = git://github.com/codecrumb/webos-warthog-kernel.git
KERNEL_TAG = warthog-${VERSION}

# 		 warthogbuild/defconfig-slim-pre3.patch \

TYPE = Kernel

include ../../support/kernel.mk

# Override the compiler
#CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs11.09armel/build/arm-2011.09/bin/arm-none-linux-gnueabi-
