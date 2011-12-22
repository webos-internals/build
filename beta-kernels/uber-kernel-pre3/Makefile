NAME = $(shell basename $(shell pwd))
TITLE = UberKernel (Pre3)
DEVICE = pre3
CATEGORY = Beta
VERSIONS = 2.2.0-38 2.2.3-38 2.2.4-38
APPINFO_DESCRIPTION = A collection of all the best kernel improvements for the Palm Pre3, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to <a href=http://developer.palm.com/blog/2010/03/a-statement-on-the-overclocking-patches/>void your warranty</a> if things go wrong.</b><br>\
This package is compatible only with webOS 2.2.0 build 3171 or webOS 2.2.3 - if you have a webOS 2.2.0 device with a different build number, you will need to doctor it before installing this package.<br>\
Current additions include:<ul>\
<li>New 1.9 GHz overclocking support, including voltage selection, ported to the Pre 3 by uNiXpSyChO.</li>\
<li>All standard Linux 2.6.32 <a href=http://www.ibm.com/developerworks/linux/library/l-cpufreq-1/index.html>cpufreq governors</a> made available for selection.</li>\
<li>An addition to the standard <b>ondemandtcl</b> governor (known as <b>ondemand-ng</b>) to support <b>screenstate</b> frequency limiting functionality when the screen is off.</li>\
<li>A new <a href=http://lwn.net/Articles/275978/><b>Budget Fair Queueing (BFQ)</b> IO scheduler</a> made available for selection via the Govnah application.</li>\
<li>New SIO and V(R) IO schedulers.</li>\
<li>Modification of the lowmemnotify threshold calculation to take into account free swap space. This reduces the occurrence of the Too Many Cards error.</li>\
<li>A new <a href=http://lwn.net/Articles/334649/><b>compcache</b> compressed RAM swap kernel module</a> ported to the Palm Pre 3. This effectively increases your available swap space, at the expense of access speed.</li>\
<li>Support for kernel crypto modules required by TrueCrypt</li>\
<li>Support for EXT4 filesystems.</li>\
<li>Support for NFS and CIFS (Samba) network filesystems.</li>\
<li>Support for iSCSI and ATA over Ethernet storage network protocols.</li>\
</ul><br>\
All additions are controlled by using the Govnah application.<br>\
For more information, visit <a href=${HOMEPAGE}>${HOMEPAGE}</a>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-38", "log" : [ "Enabled improved compcache swap behaviour" ] }, \
{ "version" : "${WEBOS_VERSION}-23", "log" : [ "Fixed voltage modification granularity issues" ] }, \
{ "version" : "${WEBOS_VERSION}-22", "log" : [ "Removed the stand-alone screenstate governor until we have temperateure and charger sensing" ] }, \
{ "version" : "${WEBOS_VERSION}-21", "log" : [ "Added screenstate support to ondemandtcl (known as ondemand-ng)" ] }, \
{ "version" : "${WEBOS_VERSION}-19", "log" : [ "Added screenstate governor support" ] }, \
{ "version" : "${WEBOS_VERSION}-16", "log" : [ "Added 1.9GHz overclocking, SIO and V(R) I/O schedulers, iSCSI and ATA over Ethernet support" ] }, \
{ "version" : "${WEBOS_VERSION}-11", "log" : [ "Added CIFS and UTF8 support" ] }, \
{ "version" : "${WEBOS_VERSION}-5", "log" : [ "Added the lowmemnotify threshold calculation modification" ] }, \
{ "version" : "${WEBOS_VERSION}-4", "log" : [ "Initial version" ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-38: Enabled improved compcache swap behaviour.<br>\
${WEBOS_VERSION}-23: Fixed voltage modification granularity issues.<br>\
${WEBOS_VERSION}-22: Removed the stand-alone screenstate governor until we have temperature and charger sensing.<br>\
${WEBOS_VERSION}-21: Added screenstate support to ondemandtcl (known as ondemand-ng).<br>\
${WEBOS_VERSION}-19: Added screenstate governor support.<br>\
${WEBOS_VERSION}-16: Added 1.9GHz overclocking, SIO and V(R) I/O schedulers, iSCSI and ATA over Ethernet support.<br>\
${WEBOS_VERSION}-11: Added CIFS and UTF8 support.<br>\
${WEBOS_VERSION}-5: Added the lowmemnotify threshold calculation modification.<br>\
${WEBOS_VERSION}-4: Initial version.

HOMEPAGE = http://www.webos-internals.org/wiki/Application:UberKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git

KERNEL_PATCHES = makefiletune/armMakefile.diff identification/mkcompile_h.patch \
		 overclocking/acpuclock-pre3.patch psychobuild/override.patch \
		 psychobuild/ondemand-ng.patch \
		 bfq/bfq-iosched.patch psychobuild/iosched-bundle.patch \
		 overclocking/defconfig-safe.patch defconfig/defconfig.pre3.cpugov \
		 defconfig/defconfig.pre3.iosched defconfig/defconfig.pre3.tcpcong \
		 compcache/lowmemnotify-total-memory.patch compcache/compcache.patch \
		 filesystems/cifs.patch filesystems/nfs.patch filesystems/ext4.patch \
		 filesystems/iscsi.patch filesystems/ataoe.patch \
		 crypto/hw-support-pre3.patch crypto/truecrypt-support-pre3.patch

EXTERNAL_MODULES = compcache/compcache-1.0.0
TYPE = Kernel

include ../../support/kernel.mk
