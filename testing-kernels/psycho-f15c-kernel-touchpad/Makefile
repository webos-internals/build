NAME = $(shell basename $(shell pwd))
TITLE = F15C Eagle (TouchPad)
DEVICE = touchpad
CATEGORY = Experimental
VERSIONS = 3.0.0-19
APPINFO_DESCRIPTION = The latest experimental kernel from uNiXpSyChO.<br><br>\
Features:<br> * 1.5GHz<br> * autogroup process scheduling<br> * CFS<br> * Various tweaks<br><br>\
For more information, visit ${HOMEPAGE}<br>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-19", "log" : [ "Initial release. autogroup process scheduling. CPU HW based alignment. deadline tweak." ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-19: Initial release. autogroup process scheduling. CPU HW based alignment. deadline tweak.<br>

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = identification/mkcompile_h.patch \
		 psychobuild/F15.patch \
		 psychobuild/fbconsole.patch \
		 psychobuild/F15-logo.patch \
		 psychobuild/iosched-deadline.patch \
		 psychobuild/comptune.patch \
		 psychobuild/cpu_alignment.patch \
		 psychobuild/autogroup.patch

TYPE = Kernel

include ../../support/kernel.mk

KERNEL_DEFCONFIG = psychobuild/F15.config

