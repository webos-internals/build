NAME = $(shell basename $(shell pwd))
TITLE = A-1 Skyraider (Pre3)
DEVICE = pre3
CATEGORY = Alpha
VERSIONS = 2.2.0-23 2.2.3-23
APPINFO_DESCRIPTION = The latest alpha kernel from uNiXpSyChO.<br><br>\
Features:<br> * 1.9GHz<br> * Screenstate<br> * ondemand-ng<br> * SIO and V(R)<br> * CIFS, NFS, iSCSI, ATA over Ethernet<br> * More to come...<br><br>\
For more information, visit ${HOMEPAGE}<br>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-23", "log" : [ "fix sysfs hang on vdd set. round off vdd and make sure it is multiple of 25mV." ] }, \
{ "version" : "${WEBOS_VERSION}-21", "log" : [ "keep ondemandtcl name" ] }, \
{ "version" : "${WEBOS_VERSION}-20", "log" : [ "add ondemand-ng gov (ondemand-tickle with screenstate mod)." ] }, \
{ "version" : "${WEBOS_VERSION}-18", "log" : [ "add screenstate gov." ] }, \
{ "version" : "${WEBOS_VERSION}-15", "log" : [ "fix voltage setting." ] }, \
{ "version" : "${WEBOS_VERSION}-14", "log" : [ "add identification for Govnah support." ] }, \
{ "version" : "${WEBOS_VERSION}-13", "log" : [ "add SIO and VR schedulers. add CPU-based alignment handling. add jhash3. add memcpy opt." ] }, \
{ "version" : "${WEBOS_VERSION}-12", "log" : [ "Initial release" ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-23: fix sysfs hang on vdd set. round off vdd and make sure it is multiple of 25mV.<br> \
${WEBOS_VERSION}-21: keep ondemandtcl name<br> \
${WEBOS_VERSION}-20: add ondemand-ng gov (ondemand-tickle with screenstate mod).<br> \
${WEBOS_VERSION}-18: add screenstate gov.<br> \
${WEBOS_VERSION}-15: fix voltage setting.<br> \
${WEBOS_VERSION}-14: add identification for Govnah support.<br> \
${WEBOS_VERSION}-13: add SIO and VR schedulers. add CPU-based alignment handling. add jhash3. add memcpy opt.<br> \
${WEBOS_VERSION}-12: Initial release<br>

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git

KERNEL_PATCHES = identification/mkcompile_h.patch \
		 psychobuild/comptune.patch \
		 psychobuild/A1.patch \
		 psychobuild/jhash3.patch \
		 psychobuild/cpu_alignment.patch \
		 psychobuild/cpu_alignment-p2.patch \
		 psychobuild/iosched-deadline.patch \
		 psychobuild/iosched-bundle.patch \
		 psychobuild/memcpy.patch \
		 psychobuild/tmc_mem.patch \
		 psychobuild/override.patch \
		 psychobuild/screenstate.patch \
		 psychobuild/ondemand-ng.patch

EXTERNAL_MODULES = compcache/compcache-1.0.0
TYPE = Kernel

include ../../support/kernel.mk

KERNEL_DEFCONFIG = psychobuild/A1.config

