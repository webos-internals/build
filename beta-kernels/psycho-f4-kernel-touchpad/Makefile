NAME = $(shell basename $(shell pwd))
TITLE = F4 Phantom (TouchPad)
DEVICE = touchpad
CATEGORY = Experimental
VERSIONS = 3.0.2-57
APPINFO_DESCRIPTION = The latest experimental kernel from uNiXpSyChO.<br><br>\
Features:<br> * 1.8GHz<br> * Full-time dual-core<br> * autogroup process scheduling<br> * CFS<br> * BFQ, V(R), SIO<br> * CIFS, NFS, iSCSI, ATA over Ethernet<br> * EXT4<br><br>\
For more information, visit ${HOMEPAGE}<br>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-57", "log" : [ "increase bus bandwidth." ] }, \
{ "version" : "${WEBOS_VERSION}-56", "log" : [ "reintroduce lcd_state again to force cpu online. hotplug patches. ARM cache updates." ] }, \
{ "version" : "${WEBOS_VERSION}-50", "log" : [ "add workaround for power_saver not setting governor until function is finished. add EXT4 support." ] }, \
{ "version" : "${WEBOS_VERSION}-48", "log" : [ "fix lcd state" ] }, \
{ "version" : "${WEBOS_VERSION}-47", "log" : [ "add iSCSI. fix wifi sleep. add power saver mode (off by default, changeable in sysfs). add lcd state." ] }, \
{ "version" : "${WEBOS_VERSION}-46", "log" : [ "add DSCP TOS. add jhash3." ] }, \
{ "version" : "${WEBOS_VERSION}-45", "log" : [ "fix silly mistake for override module loading." ] }, \
{ "version" : "${WEBOS_VERSION}-44", "log" : [ "Initial release. UTF8, ATA over Ethernet added. sysfs to enable or disable turbo_mode (fulltime dualcore)." ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-57: increase bus bandwidth.<br>${WEBOS_VERSION}-56: reintroduce lcd_state again to force cpu online. hotplug patches. ARM cache updates.<br>${WEBOS_VERSION}-50: add workaround for power_saver not setting governor until function is finished. add EXT4 support.<br>${WEBOS_VERSION}-48: fix lcd state<br>${WEBOS_VERSION}-47: add iSCSI. fix wifi sleep. add power saver mode (off by default, changeable in sysfs). add lcd state.<br>${WEBOS_VERSION}-46: add DSCP TOS. add jhash3.<br>${WEBOS_VERSION}-45: fix silly mistake for override module loading.<br>${WEBOS_VERSION}-44: Initial release. UTF8, ATA over Ethernet added. sysfs to enable or disable turbo_mode (fulltime dualcore).<br>

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = identification/mkcompile_h.patch \
		 psychobuild/F4.patch \
		 psychobuild/u1.patch \
		 psychobuild/fbconsole.patch \
		 psychobuild/F4-logo.patch \
		 psychobuild/comptune.patch \
		 psychobuild/cpu_alignment.patch \
		 psychobuild/iosched_blk.patch \
		 psychobuild/iosched-bundle.patch \
		 psychobuild/iosched-deadline.patch \
		 psychobuild/jhash3.patch \
		 psychobuild/autogroup.patch

TYPE = Kernel

include ../../support/kernel.mk

KERNEL_DEFCONFIG = psychobuild/F4.config

