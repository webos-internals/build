NAME = $(shell basename $(shell pwd))
TITLE = SBromwich Kernel (Pre/Pre+)
CATEGORY = Experimental
DEVICECOMPATIBILITY = [\"Pre\"]
VERSIONS = 1.4.1-75 1.4.5-75
APPINFO_DESCRIPTION = The latest bleeding-edge totally-experimental kernel from sbromwich.<br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-75", "log" : [ "Test kernel with prcm fixes removed" ] }, \
{ "version" : "${WEBOS_VERSION}-63", "log" : [ "More patch patching" ] }, \
{ "version" : "${WEBOS_VERSION}-62", "log" : [ "Patching patches to fix build failure" ] }, \
{ "version" : "${WEBOS_VERSION}-61", "log" : [ "More fiddling with prcm code to extend battery life, TMC patch added" ] }, \
{ "version" : "${WEBOS_VERSION}-50", "log" : [ "Removed more debug code" ] }, \
{ "version" : "${WEBOS_VERSION}-26", "log" : [ "Re-enabled wfi, tweaked timeouts for prcm code to test battery drain" ] }, \
{ "version" : "${WEBOS_VERSION}-25", "log" : [ "Remove wfi instruction on PRCM fail to test if battery drain is reduced" ] }, \
{ "version" : "${WEBOS_VERSION}-24", "log" : [ "Reduce number of scheduling calls to reduce battery drain" ] }, \
{ "version" : "${WEBOS_VERSION}-23", "log" : [ "Enable Functionally OverLoaded Kernel settings" ] }, \
{ "version" : "${WEBOS_VERSION}-19", "log" : [ "Optimise for cortex CPU, tweak power reduction code, enable pre-emptive kernel" ] }, \
{ "version" : "${WEBOS_VERSION}-16", "log" : [ "Improved screenstate transition detection" ] }, \
{ "version" : "${WEBOS_VERSION}-13", "log" : [ "Initial public release" ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-75: Test kernel with prcm fixes removed<br>${WEBOS_VERSION}-63: More patch patching<br>${WEBOS_VERSION}-62: Patching patches to fix build failure<br>${WEBOS_VERSION}-61: More fiddling with prcm code to extend battery life, TMC patch added<br>${WEBOS_VERSION}-50: Removed more debug code<br>${WEBOS_VERSION}-26: Re-enabled wfi, tweaked timeouts for prcm code to test battery drain<br>${WEBOS_VERSION}-25: Remove wfi instruction on PRCM fail to test if battery drain is reduced<br>${WEBOS_VERSION}-24: Reduce number of scheduling calls to reduce battery drain<br>${WEBOS_VERSION}-23: Enable Functionally OverLoaded Kernel settings.<br>${WEBOS_VERSION}-19: Optimise for cortex CPU, tweak power reduction code, enable pre-emptive kernel.<br>${WEBOS_VERSION}-16: Improved screenstate transition detection.<br>${WEBOS_VERSION}-13: Initial public release.

HOMEPAGE = http://www.webos-internals.org/wiki/Application:SBromwichKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
# KERNEL_PATCHES = overclocking/opp6-720-opp7-800-min-opp5.patch overclocking/defconfig-standard.patch \
KERNEL_PATCHES = overclocking/F105-overclocking.patch \
                 sensors/sensors_temp_omap34xx.patch \
                 screenstate/screenstate.patch \
                 memory/tmc_mem.patch \
                 makefiletune/armMakefile.diff \
		 defconfig/defconfig.pre.cpugov \
		 preempt/defconfig-enablepreempt.diff preempt/vermagic.diff \
		 folk/board-sirloin-headset-detect.c.diff \
		 folk/omap_fb.c.diff \
		 folk/omap_misc_hsuart.c.diff folk/pm_cpuidle.c.diff 

include ../../support/kernel.mk

# Override the compiler
CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs10q1armel/build/arm-2010q1/bin/arm-none-linux-gnueabi-
