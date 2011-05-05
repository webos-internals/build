NAME = $(shell basename $(shell pwd))
TITLE = F102A Delta Dagger (Pre/Pre+)
CATEGORY = Stable
DEVICE = pre
VERSIONS = 1.4.5-177
APPINFO_DESCRIPTION = The well known warbird series kernel from uNiXpSyChO.<br><br>\
Features:<br> * Screenstate V2<br> * Dynamic voltage scaling<br> * Stable 800MHz\
<br> * Temp Scaling<br> * Low Battery scaleback<br> * No more TMC error!<br><br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br><br>${KERNEL_DISCLAIMER}<br>
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-177", "log" : [ "Released to stable." ] }, \
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
CHANGELOG = ${WEBOS_VERSION}-177: Released to stable.<br>${WEBOS_VERSION}-174: screenstate fixes.<br>${WEBOS_VERSION}-172: split temp and battery monitoring. RC4.<br>${WEBOS_VERSION}-165: code cleanup. kernel rename. RC3.<br>${WEBOS_VERSION}-164: remove debug hack. RC2.<br>${WEBOS_VERSION}-161: cleanup override and screenstate. RC1.<br>${WEBOS_VERSION}-156: add VDD2 vsel.<br>${WEBOS_VERSION}-152: hopefully fix low end.<br>${WEBOS_VERSION}-151: screenstate V2. Dynamic voltage scaling. 800MHz max.<br>${WEBOS_VERSION}-75: Numerous screenstate updates. IO scheduler changes. No more screen brightness checking.<br>${WEBOS_VERSION}-59: screenstate updates for charging.  CPU IDLE update. disable mem overcommit.<br>${WEBOS_VERSION}-43: Initial public release, rebased off UberKernel ${WEBOS_VERSION}-40

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = sensors/sensors_temp_omap34xx.patch \
		 psychobuild/F102A-overclocking.patch \
		 compcache/compcache.patch memory/tmc_mem.patch \
		 makefiletune/armMakefile.diff
EXTERNAL_MODULES = compcache/compcache-0.5.4

KERNEL_DEFCONFIG = psychobuild/F102A.config
KERNEL_UPSTART   = psychobuild/F102A.upstart
TYPE = Kernel

include ../../support/kernel.mk

