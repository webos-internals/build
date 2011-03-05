NAME = $(shell basename $(shell pwd))
TITLE = AV8B Harrier II (Pre/Pre+)
CATEGORY = Experimental
DEVICE = pre
VERSIONS = 1.4.5-173
APPINFO_DESCRIPTION = The latest bleeding-edge totally-experimental kernel from uNiXpSyChO.<br><br>\
Features:<br> * Dynamic voltage scaling<br> * 1GHz<br><br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br><br>${KERNEL_DISCLAIMER}<br>
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-173", "log" : [ "bug fixes for vdemand driver." ] }, \
{ "version" : "${WEBOS_VERSION}-171", "log" : [ "force some preemption. change IO sched. add PPP comp." ] }, \
{ "version" : "${WEBOS_VERSION}-170", "log" : [ "split battery, charger, and temp monitoring for friendlier battery polling." ] }, \
{ "version" : "${WEBOS_VERSION}-164", "log" : [ "remove scaling sysfs." ] }, \
{ "version" : "${WEBOS_VERSION}-163", "log" : [ "remove debug hack." ] }, \
{ "version" : "${WEBOS_VERSION}-160", "log" : [ "increase default voltages." ] }, \
{ "version" : "${WEBOS_VERSION}-159", "log" : [ "add charger scaleback and override. vdemand cleanup. fix out of bound array." ] }, \
{ "version" : "${WEBOS_VERSION}-146", "log" : [ "bring DSP back inline. added vsel reset. align voltages from feedback." ] }, \
{ "version" : "${WEBOS_VERSION}-137", "log" : [ "added temp limiter. fixed cpu speed drop on DSP run. major overhaul." ] }, \
{ "version" : "${WEBOS_VERSION}-136", "log" : [ "Initial release. Dynamic voltage scaling based on CPU load. vdemand gov." ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-173: bug fixes for vdemand driver.<br>${WEBOS_VERSION}-171: force some preemption. change IO sched. add PPP comp.<br>${WEBOS_VERSION}-170: split battery, charger, and temp monitoring for friendlier battery polling.<br>${WEBOS_VERSION}-164: remove scaling sysfs.<br>${WEBOS_VERSION}-163: remove debug hack.<br>${WEBOS_VERSION}-160: increase default voltages.<br>${WEBOS_VERSION}-159: add charger scaleback and override. vdemand cleanup. fix out of bound array.<br>${WEBOS_VERSION}-146: bring DSP back inline. added vsel reset. align voltages from feedback.<br>${WEBOS_VERSION}-137: added temp limiter. fixed cpu speed drop on DSP run. major overhaul.<br>${WEBOS_VERSION}-136: Initial release. Dynamic voltage scaling based on CPU load. vdemand gov.<br>

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = sensors/sensors_temp_omap34xx.patch \
		 psychobuild/AV8B.patch \
		 compcache/compcache.patch memory/tmc_mem.patch \
		 makefiletune/armMakefile.diff
EXTERNAL_MODULES = compcache/compcache-0.5.4

KERNEL_DEFCONFIG = psychobuild/AV8B.config
KERNEL_UPSTART   = psychobuild/F102A.upstart
TYPE = Kernel

include ../../support/kernel.mk

