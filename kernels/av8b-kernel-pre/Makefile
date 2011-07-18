NAME = $(shell basename $(shell pwd))
TITLE = AV8B Harrier II (Pre/Pre+)
CATEGORY = Stable
DEVICE = pre
VERSIONS = 1.4.5-186 2.1.0-71
APPINFO_DESCRIPTION = The latest bleeding-edge kernel from uNiXpSyChO.<br><br>\
Features:<br> * Dynamic voltage scaling at full speed<br> * 1GHz<br> * Overtemp scaling<br> * SIO IO scheduler<br> * Low latency SDIO<br> * Charger Scaleback<br> * Full speed DSP<br> * a slew of other tweaks<br><br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br><br>${KERNEL_DISCLAIMER}<br>
HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git

ifeq (${WEBOS_VERSION},1.4.5)

APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-186", "log" : [ "add cpu-based alignment handling. deadline scheduler tweak. add preemption. add low-latency sdio. add SIO IO scheduler." ] }, \
{ "version" : "${WEBOS_VERSION}-180", "log" : [ "minor fixes and tweaks. add vdemand poll sysfs back with msecs." ] }, \
{ "version" : "${WEBOS_VERSION}-176", "log" : [ "backport some vdemand fixes." ] }, \
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
CHANGELOG = ${WEBOS_VERSION}-186: add cpu-based alignment handling. deadline scheduler tweak. add preemption. add low-latency sdio. add SIO IO scheduler.<br>${WEBOS_VERSION}-180: minor fixes and tweaks. add vdemand poll sysfs back with msecs.<br>${WEBOS_VERSION}-176: backport some vdemand fixes<br>${WEBOS_VERSION}-173: bug fixes for vdemand driver.<br>${WEBOS_VERSION}-171: force some preemption. change IO sched. add PPP comp.<br>${WEBOS_VERSION}-170: split battery, charger, and temp monitoring for friendlier battery polling.<br>${WEBOS_VERSION}-164: remove scaling sysfs.<br>${WEBOS_VERSION}-163: remove debug hack.<br>${WEBOS_VERSION}-160: increase default voltages.<br>${WEBOS_VERSION}-159: add charger scaleback and override. vdemand cleanup. fix out of bound array.<br>${WEBOS_VERSION}-146: bring DSP back inline. added vsel reset. align voltages from feedback.<br>${WEBOS_VERSION}-137: added temp limiter. fixed cpu speed drop on DSP run. major overhaul.<br>${WEBOS_VERSION}-136: Initial release. Dynamic voltage scaling based on CPU load. vdemand gov.<br>

KERNEL_PATCHES = sensors/sensors_temp_omap34xx.patch \
		 psychobuild/AV8B.patch \
                 psychobuild/sdio.patch \
                 psychobuild/sio.patch \
                 psychobuild/cpu_alignment.patch \
		 compcache/compcache.patch memory/tmc_mem.patch \
		 makefiletune/armMakefile.diff
EXTERNAL_MODULES = compcache/compcache-0.5.4

KERNEL_UPSTART   = psychobuild/F102A.upstart

else

APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-71", "log" : [ "raise volt a bit to make stable on all phonesa" ] }, \
{ "version" : "${WEBOS_VERSION}-70", "log" : [ "add SIO IO scheduler. add CPU-based alignment handling." ] }, \
{ "version" : "${WEBOS_VERSION}-66", "log" : [ "lower vdemand poll default." ] }, \
{ "version" : "${WEBOS_VERSION}-65", "log" : [ "temp fix for charger scaleback. allow voltage change without lock." ] }, \
{ "version" : "${WEBOS_VERSION}-64", "log" : [ "revert charger fix." ] }, \
{ "version" : "${WEBOS_VERSION}-63", "log" : [ "nullify DSP func. dont override voltages on freq scaleback. fix charger detection. fix battery percent sysfs. fix vdemand poll rate. add more locking. dont munge voltages on unknown policy change. drop DSP freq." ] }, \
{ "version" : "${WEBOS_VERSION}-61", "log" : [ "make vdemand gov use other freqs, not locked anymore to 1GHz. use VSEL to voltage scale. change polling to msecs." ] }, \
{ "version" : "${WEBOS_VERSION}-42", "log" : [ "fix load calc. revert mem test patch." ] }, \
{ "version" : "${WEBOS_VERSION}-39", "log" : [ "Code cleanup." ] }, \
{ "version" : "${WEBOS_VERSION}-28", "log" : [ "revert extra freq lockage. set gov start policy correctly." ] }, \
{ "version" : "${WEBOS_VERSION}-27", "log" : [ "add low-latency sdio. add vdemand stats in sysfs. smooth out voltage scaling." ] }, \
{ "version" : "${WEBOS_VERSION}-16", "log" : [ "lock down freq. tmc memory hack." ] }, \
{ "version" : "${WEBOS_VERSION}-11", "log" : [ "try to start high speed for broken profiles." ] }, \
{ "version" : "${WEBOS_VERSION}-10", "log" : [ "webOS 2.1 build." ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-71: raise volt a bit to make stable on all phones<br>${WEBOS_VERSION}-70: add SIO IO scheduler. add CPU-based alignment handling.<br>${WEBOS_VERSION}-66: lower vdemand poll default.<br>${WEBOS_VERSION}-65: temp fix for charger scaleback. allow voltage change without lock.<br>${WEBOS_VERSION}-64: revert charger fix.<br>${WEBOS_VERSION}-63: nullify DSP func. dont override voltages on freq scaleback. fix charger detection. fix battery percent sysfs. fix vdemand poll rate. add more locking. dont munge voltages on unknown policy change. drop DSP freq.<br>${WEBOS_VERSION}-61: make vdemand gov use other freqs, not locked anymore to 1GHz. use VSEL to voltage scale. change polling to msecs.<br>${WEBOS_VERSION}-42: fix load calc. revert mem test patch.<br>${WEBOS_VERSION}-39: Code cleanup.<br>${WEBOS_VERSION}-28: revert extra freq lockage. set gov start policy correctly.<br>${WEBOS_VERSION}-27: add low-latency sdio. add vdemand stats in sysfs. smooth out voltage scaling.<br>${WEBOS_VERSION}-16: lock down freq. tmc memory hack.<br>${WEBOS_VERSION}-11: try to start high speed for broken profiles.<br>${WEBOS_VERSION}-10: webOS 2.1 build.<br>

KERNEL_PATCHES = sensors/omap34xx_temp.patch \
                 psychobuild/AV8B.patch \
                 memory/tmc_mem.patch \
                 psychobuild/sdio.patch \
                 psychobuild/sio.patch \
                 psychobuild/cpu_alignment.patch \
                 psychobuild/iosched-deadline.patch \
                 psychobuild/preempt.patch \
                 psychobuild/comptune.patch

endif

KERNEL_DEFCONFIG = psychobuild/AV8B.config
TYPE = Kernel

include ../../support/kernel.mk

