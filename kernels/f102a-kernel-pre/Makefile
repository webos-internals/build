NAME = $(shell basename $(shell pwd))
TITLE = F102A Delta Dagger (Palm Pre/Pre+)
CATEGORY = Stable
DEVICE = pre
VERSIONS = 1.4.1-100 1.4.2-100 1.4.5-100
APPINFO_DESCRIPTION = The well known warbird series kernel from uNiXpSyChO.<br>\
<br>Features:<br>* Stable 800MHz operation<br>* Compcache set at 20MiB<br>* Screenstate Governor Only<br>* Low memory hack to remove TMC error forever<br>* Lean and Mean - totally stripped of other unused kernel functions<br><br>\
Note: Screenstate gov will not allow under 500MHz operation in this release.<br><br>For more information, visit ${HOMEPAGE}<br>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}<br>
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-100", "log" : [ "Release to Stable feed." ] }, \
{ "version" : "${WEBOS_VERSION}-83", "log" : [ "Merge to match other stable warbird code." ] }, \
{ "version" : "${WEBOS_VERSION}-75", "log" : [ "Numerous screenstate updates. IO scheduler changes. No more screen brightness checking." ] }, \
{ "version" : "${WEBOS_VERSION}-59", "log" : [ "screenstate updates for charging.  CPU IDLE update. disable mem overcommit." ] }, \
{ "version" : "${WEBOS_VERSION}-43", "log" : [ "Initial public release, rebased off UberKernel ${WEBOS_VERSION}-40" ] }, \
]
CHANGELOG =  ${WEBOS_VERSION}-100: Release to Stable feed.<br>${WEBOS_VERSION}-83: Merge to match other stable warbird code.<br>${WEBOS_VERSION}-75: Numerous screenstate updates. IO scheduler changes. No more screen brightness checking.<br>${WEBOS_VERSION}-59: screenstate updates for charging.  CPU IDLE update. disable mem overcommit.<br>${WEBOS_VERSION}-43: Initial public release, rebased off UberKernel ${WEBOS_VERSION}-40

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = overclocking/opp6-720-opp7-800-min-opp5.patch \
		 sensors/sensors_temp_omap34xx.patch \
		 screenstate/screenstate.patch screenstate/cap-min-freq.patch \
		 compcache/compcache.patch memory/tmc_mem.patch \
		 makefiletune/armMakefile.diff
EXTERNAL_MODULES = compcache/compcache-0.5.4

KERNEL_DEFCONFIG = psychobuild/F102A.config
KERNEL_UPSTART   = psychobuild/F102A.upstart
TYPE = Kernel

include ../../support/kernel.mk
