NAME = $(shell basename $(shell pwd))
TITLE = SBromwichKernel (Palm Pre/Pre+)
CATEGORY = Experimental
VERSIONS = 1.4.1-20
APPINFO_DESCRIPTION = The latest bleeding-edge totally-experimental kernel from sbromwich.<br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "1.4.1-20", "log" : [ "Enable Functionally OverLoaded Kernel settings" ] }, \
{ "version" : "1.4.1-19", "log" : [ "Optimise for cortex CPU, tweak power reduction code, enable pre-emptive kernel" ] }, \
{ "version" : "1.4.1-16", "log" : [ "Improved screenstate transition detection" ] }, \
{ "version" : "1.4.1-13", "log" : [ "Initial public release" ] }, \
]
CHANGELOG = 1.4.1-16: Improved screenstate transition detection.<br>1.4.1-13: Initial public release

HOMEPAGE = http://www.webos-internals.org/wiki/Application:SBromwichKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = overclocking/opp6-720-opp7-800-min-opp5.patch overclocking/defconfig-safe.patch \
		 sensors/sensors_temp_omap34xx.patch sensors/defconfig-safe.patch \
		 screenstate/screenstate.patch screenstate/defconfig-safe.patch \
		 koptimise/defconfig-optimise makefiletune/Makefile.diff \
		 prcm/prcm_clk.c.diff prcm/proc_pwr.c.diff \
		 preempt/defconfig-enablepreempt.diff preempt/vermagic.diff \
		 folk/defconfig-folk

include ../../support/kernel.mk
CROSS_COMPILE_armv7 = $(shell cd ../.. ; pwd)/toolchain/cs08q1armel/build/arm-2008q1/bin/arm-none-linux-gnueabi-
