NAME = $(shell basename $(shell pwd))
TITLE = F4 Phantom (TouchPad)
DEVICE = touchpad
CATEGORY = Experimental
VERSIONS = 3.0.2-45
APPINFO_DESCRIPTION = The latest experimental kernel from uNiXpSyChO.<br><br>\
Features:<br> * 1.8GHz<br> * Full-time dual-core<br> * autogroup process scheduling<br> * CFS<br> * BFQ, V(R), SIO<br> * CIFS, NFS, ATA over Ethernet<br><br>\
For more information, visit ${HOMEPAGE}<br>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-45", "log" : [ "fix silly mistake for override module loading." ] }, \
{ "version" : "${WEBOS_VERSION}-44", "log" : [ "Initial release. UTF8, ATA over Ethernet added. sysfs to enable or disable turbo_mode (fulltime dualcore)." ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-45: fix silly mistake for override module loading.<br>${WEBOS_VERSION}-44: Initial release. UTF8, ATA over Ethernet added. sysfs to enable or disable turbo_mode (fulltime dualcore).<br>

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = identification/mkcompile_h.patch \
		 psychobuild/F4.patch \
		 psychobuild/fbconsole.patch \
		 psychobuild/F4-logo.patch \
		 psychobuild/iosched_blk.patch \
		 psychobuild/comptune.patch \
		 psychobuild/cpu_alignment.patch \
		 psychobuild/iosched-bundle.patch \
		 psychobuild/autogroup.patch

TYPE = Kernel

include ../../support/kernel.mk

KERNEL_DEFCONFIG = psychobuild/F4.config

