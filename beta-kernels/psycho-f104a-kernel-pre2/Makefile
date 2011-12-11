NAME = $(shell basename $(shell pwd))
TITLE = F104A Starfighter (Pre2)
CATEGORY = Beta
DEVICE = pre2
VERSIONS = 2.1.0-87
APPINFO_DESCRIPTION = The latest experimental kernel from uNiXpSyChO.<br><br>\
Features:<br> * Screenstate v3<br> * Lagfree<br> * 1.1GHz<br> * More Tweaks<br><br>\
For more information, visit ${HOMEPAGE}<br>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}<br>
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-87", "log" : [ "add lagfree gov." ] }, \
{ "version" : "${WEBOS_VERSION}-81", "log" : [ "add ondemand-ng (screenstate for ondemand-tickle gov)." ] }, \
{ "version" : "${WEBOS_VERSION}-70", "log" : [ "add cpu high temp scaleback speed code cleanup tweak ondemand tweak screen on and off timer make more platform independant" ] }, \
{ "version" : "${WEBOS_VERSION}-67", "log" : [ "change default temp alarm. code cleanup. fix battery scaleback percent sysfs. re-order locking." ] }, \
{ "version" : "${WEBOS_VERSION}-60", "log" : [ "try to workaround deadlock when enabling ondemand. smooth out ondemand." ] }, \
{ "version" : "${WEBOS_VERSION}-55", "log" : [ "allow 1s charger poll." ] }, \
{ "version" : "${WEBOS_VERSION}-46", "log" : [ "use VSEL instead of SR to voltage scale. add VDD2 scaling. make ondemand off by default in SSv3. bug fixes." ] }, \
{ "version" : "${WEBOS_VERSION}-15", "log" : [ "rebuild for webOS 2.0.1 and 2.1.0. introduce SSv3." ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-87: add lagfree gov.<br>${WEBOS_VERSION}-81: add ondemand-ng (screenstate for ondemand-tickle gov).<br>${WEBOS_VERSION}-70: add cpu high temp scaleback speed code cleanup tweak ondemand tweak screen on and off timer make more platform independant.<br>${WEBOS_VERSION}-67: change default temp alarm. code cleanup. fix battery scaleback percent sysfs. re-order locking.<br>${WEBOS_VERSION}-60: try to workaround deadlock when enabling ondemand. smooth out ondemand.<br>${WEBOS_VERSION}-55: allow 1s charger poll.<br>${WEBOS_VERSION}-46: use VSEL instead of SR to voltage scale. add VDD2 scaling. make ondemand off by default in SSv3. bug fixes.<br>${WEBOS_VERSION}-15: rebuild for webOS 2.0.1 and 2.1.0. introduce SSv3.<br>

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = psychobuild/F104A-pre2.patch \
		 sensors/omap34xx_temp.patch \
		 psychobuild/ssv3-ovrd.patch \
		 psychobuild/ssv3-ovrd-pre2.patch \
		 psychobuild/ondemand-ng.patch \
		 psychobuild/lagfree.patch \
		 compcache/lowmemnotify-total-memory.patch \
		 compcache/compcache.patch \
		 psychobuild/fbconsole.patch \
		 psychobuild/F104-logo.patch \
		 psychobuild/preempt.patch \
		 makefiletune/armMakefile.diff

EXTERNAL_MODULES = compcache/compcache-0.5.4
KERNEL_DEFCONFIG = psychobuild/F104A-pre2.config
#KERNEL_UPSTART   = psychobuild/F104A.upstart
TYPE = Kernel

include ../../support/kernel.mk
