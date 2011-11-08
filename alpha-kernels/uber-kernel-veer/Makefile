NAME = $(shell basename $(shell pwd))
TITLE = UberKernel (Veer)
DEVICE = veer
CATEGORY = Experimental
VERSIONS = 2.1.1-24 2.1.2-24
APPINFO_DESCRIPTION = A collection of all the best kernel improvements for the HP Veer, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to <a href=http://developer.palm.com/blog/2010/03/a-statement-on-the-overclocking-patches/>void your warranty</a> if things go wrong.</b><br>\
Current additions include:<ul>\
<li>New 1.4 GHz overclocking support, including voltage selection, ported to the Veer by uNiXpSyChO.</li>\
<li>A new <b>screenstate</b> governor created by uNiXpSyChO specifically for the Veer which runs at a higher speed when the screen is on, and a lower speed when the screen is off.</li>\
<li>All standard Linux 2.6.29 <a href=http://www.ibm.com/developerworks/linux/library/l-cpufreq-1/index.html>cpufreq governors</a> made available for selection.</li>\
<li>A new SIO IO scheduler.</li>\
<li>Modification of the lowmemnotify threshold calculation to take into account free swap space. This reduces the occurrence of the Too Many Cards error.</li>\
<li>A new <a href=http://lwn.net/Articles/334649/><b>compcache</b> compressed RAM swap kernel module</a> ported to the Palm Pre 3. This effectively increases your available swap space, at the expense of access speed.</li>\
<li>Support for kernel crypto modules required by TrueCrypt</li>\
<li>Support for EXT4 filesystems.</li>\
<li>Support for NFS and CIFS (Samba) network filesystems.</li>\
<li>Support for iSCSI and ATA over Ethernet storage network protocols.</li>\
</ul><br>\
All additions are disabled by default, and must be enabled by using the Govnah application.<br>\
For more information, visit <a href=${HOMEPAGE}>${HOMEPAGE}</a>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-24", "log" : [ "Added screenstate, SIO, EXT4, NFS, CIFS, iSCSI, ATA over Ethernet" ] }, \
{ "version" : "${WEBOS_VERSION}-19", "log" : [ "Merged basic overclocking from Warthog" ] }, \
{ "version" : "${WEBOS_VERSION}-7", "log" : [ "Initial version" ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-24: Added screenstate, SIO, EXT4, NFS, CIFS, iSCSI, ATA over Ethernet.<br>\
${WEBOS_VERSION}-19: Merged basic overclocking from Warthog.<br>\
${WEBOS_VERSION}-7: Initial version.

HOMEPAGE = http://www.webos-internals.org/wiki/Application:UberKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git

KERNEL_PATCHES = makefiletune/armMakefile.diff identification/mkcompile_h.patch \
		 overclocking/acpuclock-veer.patch \
		 psychobuild/override.patch psychobuild/screenstate.patch\
		 psychobuild/iosched-sio.patch \
		 overclocking/defconfig-safe.patch \
		 defconfig/defconfig.veer.cpugov \
		 defconfig/defconfig.veer.iosched \
		 defconfig/defconfig.veer.tcpcong \
		 compcache/lowmemnotify-total-memory.patch \
		 filesystems/cifs.patch filesystems/nfs.patch filesystems/ext4.patch \
		 filesystems/iscsi.patch filesystems/ataoe.patch \
		 crypto/truecrypt-support-veer.patch

TYPE = Kernel

include ../../support/kernel.mk
