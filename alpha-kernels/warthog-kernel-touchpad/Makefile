NAME = $(shell basename $(shell pwd))
TITLE = WarthogKernel (TouchPad)
DEVICE = touchpad
CATEGORY = Alpha
VERSIONS = 3.0.4-96 3.0.5-96
APPINFO_DESCRIPTION = In the jungle, the mighty jungle, the lion sleeps tonight. Oh wait... <br><br>\
A collection of highly experimental kernel improvements for the HP TouchPad, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to <a href=http://developer.palm.com/blog/2010/03/a-statement-on-the-overclocking-patches/>void your warranty</a> if things go wrong.</b><br>\
Current additions include:<ul>\
<li>Fix tick skew. BFQ IO scheduler. 300Hz</li>\
<li>Overclock to 1.512GHz & 1.728GHz</li>\
<li>Use Westwood for TCP congest. slowstart fix</li>\
<li>Support for EXT4 filesystems.</li>\
<li>Support for NFS and CIFS (Samba) network filesystems.</li>\
<li>Support for iSCSI and ATA over Ethernet storage network protocols.</li>\
</ul><br>\
For more information, visit <a href=${HOMEPAGE}>${HOMEPAGE}</a>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br><br>${KERNEL_DISCLAIMER}<br><br>
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-96", "log" : [ "Backport PRR from Linux 3.2. SHA1 update" ] }, \
{ "version" : "${WEBOS_VERSION}-88", "log" : [ "Added EXT4, iSCSI and ATA over Ethernet support" ] }, \
{ "version" : "${WEBOS_VERSION}-86", "log" : [ "Use Westwood TCP congest algo. slowstart fix" ] }, \
{ "version" : "${WEBOS_VERSION}-68", "log" : [ "300Hz clock. memcpy. TMC fix. NFS & CIFS" ] }, \
{ "version" : "${WEBOS_VERSION}-29", "log" : [ "Back off to 1.728GHz" ] }, \
{ "version" : "${WEBOS_VERSION}-27", "log" : [ "CPU align. BFQ CGROUP. OC 1.512 & 1.782GHz" ] }, \
{ "version" : "${WEBOS_VERSION}-21", "log" : [ "Overclock by unixpsycho. BFQ as default" ] }, \
{ "version" : "${WEBOS_VERSION}-13", "log" : [ "Fix tick skew. BFQ IO scheduler. 1000Hz" ] }, \
{ "version" : "${WEBOS_VERSION}-5", "log" : [ "Forward port old defconfigs" ] }, \
{ "version" : "${WEBOS_VERSION}-3", "log" : [ "Initial version" ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-96: Backport PRR from Linux 3.2. SHA1 update<br>\
${WEBOS_VERSION}-88: Added EXT4, iSCSI and ATA over Ethernet support<br>\
${WEBOS_VERSION}-86: Use Westwood TCP congest algo. slowstart fix<br>\
${WEBOS_VERSION}-68: 300Hz clock. memcpy. TMC fix. NFS & CIFS<br>\
${WEBOS_VERSION}-29: Back off to 1.728GHz<br>\
${WEBOS_VERSION}-27: CPU align. BFQ CGROUP. OC 1.512 & 1.782GHz<br>\
${WEBOS_VERSION}-21: Overclock by unixpsycho. BFQ as default<br>\
${WEBOS_VERSION}-13: Fix tick skew. BFQ IO scheduler. 1000Hz<br>\
${WEBOS_VERSION}-5: Forward port old defconfigs.<br>\
${WEBOS_VERSION}-3: Initial version.

HOMEPAGE = http://www.webos-internals.org/wiki/Application:WarthogKernel
SRC_GIT = git://github.com/webos-internals/kernel-patches.git
KERNEL_PATCHES = makefiletune/armMakefile.diff \
		 defconfig/defconfig-nodebug-touchpad.patch \
		 compcache/lowmemnotify-total-memory.patch \
		 warthogbuild/tp-overclock.patch \
		 psychobuild/override.patch \
		 warthogbuild/net-prr.patch \
		 warthogbuild/sha1.patch \
		 bfq/bfq-iosched.patch \
		 warthogbuild/tp-tickskew.patch \
		 warthogbuild/tp-300hz.patch \
		 warthogbuild/tp-slowstart.patch \
		 psychobuild/cpu_alignment.patch \
		 psychobuild/cpu_alignment-p2.patch \
		 psychobuild/memcpy.patch \
		 psychobuild/fbconsole.patch \
		 warthogbuild/defconfig-feat-touchpad.patch \
		 identification/mkcompile_h.patch \
		 filesystems/cifs.patch filesystems/nfs.patch filesystems/ext4.patch \
		 filesystems/iscsi.patch filesystems/ataoe.patch \
		 warthogbuild/ident-touchpad.patch

#		 warthogbuild/defconfig-slim-touchpad.patch \
#
#		 psychobuild/override.patch \
#		 psychobuild/ondemand-ng.patch \

TYPE = Kernel

include ../../support/kernel.mk

# Override the compiler
#CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs11.03armel/build/arm-2011.03/bin/arm-none-linux-gnueabi-
