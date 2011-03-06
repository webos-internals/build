NAME = $(shell basename $(shell pwd))
TITLE = AV8B Harrier II (Pre/Pre+)
CATEGORY = Experimental
DEVICE = pre
VERSIONS = 2.1.0-16
APPINFO_DESCRIPTION = The latest bleeding-edge totally-experimental kernel from uNiXpSyChO.<br><br>\
Features:<br> * Dynamic voltage scaling<br> * 1GHz<br><br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br><br>${KERNEL_DISCLAIMER}<br>
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-16", "log" : [ "lock down freq. tmc memory hack." ] }, \
{ "version" : "${WEBOS_VERSION}-11", "log" : [ "try to start high speed for broken profiles." ] }, \
{ "version" : "${WEBOS_VERSION}-10", "log" : [ "webOS 2.1 build." ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-16: lock down freq. tmc memory hack.<br>${WEBOS_VERSION}-11: try to start high speed for broken profiles.<br>${WEBOS_VERSION}-10: webOS 2.1 build.<br>

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = sensors/omap34xx_temp.patch \
		 psychobuild/AV8B.patch \
		 makefiletune/armMakefile.diff

KERNEL_DEFCONFIG = psychobuild/AV8B.config
#KERNEL_UPSTART   = psychobuild/F102A.upstart
TYPE = Kernel

include ../../support/kernel.mk
