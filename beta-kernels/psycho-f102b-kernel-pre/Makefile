NAME = $(shell basename $(shell pwd))
TITLE = F102B Delta Dagger (Pre/Pre+)
CATEGORY = Experimental
DEVICE = pre
VERSIONS = 2.1.0-54 1.4.5-181
APPINFO_DESCRIPTION = The latest beta kernel from uNiXpSyChO.<br><br>\
Features:<br> * screenstate V2<br> * Dynamic voltage scaling<br> * 800MHz\
<br> * Temp Scaling<br> * Low Battery scaleback<br> * No more TMC error!<br><br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br><br>${KERNEL_DISCLAIMER}<br>
HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git

ifeq (${WEBOS_VERSION},1.4.5)
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-181", "log" : [ "re-add vdemand poll in msecs." ] }, \
{ "version" : "${WEBOS_VERSION}-175", "log" : [ "fix screwup on vdemand poll." ] }, \
{ "version" : "${WEBOS_VERSION}-174", "log" : [ "screenstate fixes." ] }, \
{ "version" : "${WEBOS_VERSION}-172", "log" : [ "split temp and battery monitoring. RC4." ] }, \
{ "version" : "${WEBOS_VERSION}-165", "log" : [ "code cleanup. kernel rename. RC3." ] }, \
{ "version" : "${WEBOS_VERSION}-164", "log" : [ "remove debug hack. RC2." ] }, \
{ "version" : "${WEBOS_VERSION}-161", "log" : [ "cleanup override and screenstate. RC1." ] }, \
{ "version" : "${WEBOS_VERSION}-156", "log" : [ "add VDD2 vsel." ] }, \
{ "version" : "${WEBOS_VERSION}-152", "log" : [ "hopefully fix low end." ] }, \
{ "version" : "${WEBOS_VERSION}-151", "log" : [ "screenstate V2. Dynamic voltage scaling. 800MHz max." ] }, \
{ "version" : "${WEBOS_VERSION}-75", "log" : [ "Numerous screenstate updates. IO scheduler changes. No more screen brightness checking." ] }, \
{ "version" : "${WEBOS_VERSION}-59", "log" : [ "screenstate updates for charging.  CPU IDLE update. disable mem overcommit." ] }, \
{ "version" : "${WEBOS_VERSION}-43", "log" : [ "Initial public release, rebased off UberKernel ${WEBOS_VERSION}-40" ] }, \
]
CHANGELOG = >${WEBOS_VERSION}-181: re-add vdemand poll in msecs.<br>${WEBOS_VERSION}-175: fix screwup on vdemand poll<br>${WEBOS_VERSION}-174: screenstate fixes.<br>${WEBOS_VERSION}-172: split temp and battery monitoring. RC4.<br>${WEBOS_VERSION}-165: code cleanup. kernel rename. RC3.<br>${WEBOS_VERSION}-164: remove debug hack. RC2.<br>${WEBOS_VERSION}-161: cleanup override and screenstate. RC1.<br>${WEBOS_VERSION}-156: add VDD2 vsel.<br>${WEBOS_VERSION}-152: hopefully fix low end.<br>${WEBOS_VERSION}-151: screenstate V2. Dynamic voltage scaling. 800MHz max.<br>${WEBOS_VERSION}-75: Numerous screenstate updates. IO scheduler changes. No more screen brightness checking.<br>${WEBOS_VERSION}-59: screenstate updates for charging.  CPU IDLE update. disable mem overcommit.<br>${WEBOS_VERSION}-43: Initial public release, rebased off UberKernel ${WEBOS_VERSION}-40

KERNEL_PATCHES = sensors/sensors_temp_omap34xx.patch \
		 psychobuild/F102B-overclocking.patch \
		 psychobuild/fbconsole.patch \
		 psychobuild/F102-logo.patch \
		 compcache/compcache.patch memory/tmc_mem.patch \
		 makefiletune/armMakefile.diff
EXTERNAL_MODULES = compcache/compcache-0.5.4

KERNEL_UPSTART   = psychobuild/F102B.upstart

else

APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-54", "log" : [ "re-add vdemand poll in msecs." ] }, \
{ "version" : "${WEBOS_VERSION}-37", "log" : [ "screenstate fixes. improve voltage reset on freq change. move LCD on/off code to correct place. RC6." ] }, \
{ "version" : "${WEBOS_VERSION}-26", "log" : [ "add preemption. RC5." ] }, \
{ "version" : "${WEBOS_VERSION}-25", "log" : [ "rebuild for webOS 2.1.0" ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-54: re-add vdemand poll in msecs.<br>${WEBOS_VERSION}-37: screenstate fixes. improve voltage reset on freq change. move LCD on/off code to correct place. RC6.<br>${WEBOS_VERSION}-26: add preemption. RC5.<br>${WEBOS_VERSION}-25: rebuild for webOS 2.1.0<br>

KERNEL_PATCHES = sensors/omap34xx_temp.patch \
                 psychobuild/F102B-overclocking.patch \
                 psychobuild/preempt.patch \
		 psychobuild/fbconsole.patch \
		 psychobuild/F102-logo.patch \
                 memory/tmc_mem.patch \
                 makefiletune/armMakefile.diff

endif

KERNEL_DEFCONFIG = psychobuild/F102B.config
TYPE = Kernel

include ../../support/kernel.mk

