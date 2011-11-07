NAME = $(shell basename $(shell pwd))
TITLE = A-4 Skyhawk (Veer)
DEVICE = veer
CATEGORY = Alpha
VERSIONS = 2.1.2-21
APPINFO_DESCRIPTION = The latest alpha kernel from uNiXpSyChO.<br><br>\
Features:<br> * 1.4GHz<br> * SIO<br> * CIFS<br> * Voltage manipulation<br> * More to come...<br><br>\
For more information, visit ${HOMEPAGE}<br>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-21", "log" : [ "Initial release" ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-21: Initial release<br>

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git

KERNEL_PATCHES = identification/mkcompile_h.patch \
		 psychobuild/comptune.patch \
		 psychobuild/A4.patch \
		 psychobuild/cpu_alignment.patch \
		 psychobuild/cpu_alignment-p2.patch \
		 psychobuild/iosched-deadline.patch \
		 psychobuild/iosched-sio.patch \
		 psychobuild/memcpy.patch \
		 psychobuild/tmc_mem.patch \
		 psychobuild/override.patch

TYPE = Kernel

include ../../support/kernel.mk

KERNEL_DEFCONFIG = psychobuild/A4.config

