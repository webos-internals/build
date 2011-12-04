NAME = $(shell basename $(shell pwd))
TITLE = A-4 Skyhawk (Veer)
DEVICE = veer
CATEGORY = Beta
VERSIONS = 2.1.1-29 2.1.2-29
APPINFO_DESCRIPTION = The latest beta kernel from uNiXpSyChO.<br><br>\
Features:<br> * 1.4GHz<br> * Screenstate<br> * Lagfree<br> * SIO<br> * CIFS<br> * Voltage manipulation<br> * More to come...<br><br>\
For more information, visit ${HOMEPAGE}<br>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-29", "log" : [ "add lagfree gov." ] }, \
{ "version" : "${WEBOS_VERSION}-27", "log" : [ "fix sysfs hang on vdd set. round off voltage and make sure it is multiple of 25mV." ] }, \
{ "version" : "${WEBOS_VERSION}-25", "log" : [ "add ondemand-ng gov" ] }, \
{ "version" : "${WEBOS_VERSION}-23", "log" : [ "add screenstate gov" ] }, \
{ "version" : "${WEBOS_VERSION}-22", "log" : [ "fix voltage setting" ] }, \
{ "version" : "${WEBOS_VERSION}-21", "log" : [ "Initial release" ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-29: add lagfree gov.<br> \
${WEBOS_VERSION}-27: fix sysfs hang on vdd set. round off voltage and make sure it is multiple of 25mV.<br> \
${WEBOS_VERSION}-25: add ondemand-ng gov<br> \
${WEBOS_VERSION}-23: add screenstate gov<br> \
${WEBOS_VERSION}-22: fix voltage setting<br> \
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
		 psychobuild/override.patch \
		 psychobuild/gov_bundle.patch \
		 psychobuild/ondemand-ng.patch

TYPE = Kernel

include ../../support/kernel.mk

KERNEL_DEFCONFIG = psychobuild/A4.config

