NAME = $(shell basename $(shell pwd))
TITLE = F15C Eagle (TouchPad)
DEVICE = touchpad
CATEGORY = Experimental
VERSIONS = 3.0.0-19 3.0.2-32
APPINFO_DESCRIPTION = The latest experimental kernel from uNiXpSyChO.<br><br>\
Features:<br> * 1.7GHz<br> * Screenstate<br> * autogroup process scheduling<br> * CFS<br> * BFQ<br> * Various tweaks<br><br>\
For more information, visit ${HOMEPAGE}<br>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-32", "log" : [ "add SIO IO sched. add V(R) IO sched. enable shadow writes for gpu." ] }, \
{ "version" : "${WEBOS_VERSION}-30", "log" : [ "remove screenstate for now. speed up boot. tweak conservative and ondemand govs. change up freqs." ] }, \
{ "version" : "${WEBOS_VERSION}-28", "log" : [ "add screenstate. add boot messages." ] }, \
{ "version" : "${WEBOS_VERSION}-26", "log" : [ "rebuild for 3.0.2. add BFQ. increase freq to a stable 1.728GHz without voltage increase." ] }, \
{ "version" : "${WEBOS_VERSION}-19", "log" : [ "Initial release. autogroup process scheduling. CPU HW based alignment. deadline tweak." ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-32: add SIO IO sched. add V(R) IO sched. enable shadow writes for gpu.<br>${WEBOS_VERSION}-30: remove screenstate for now. speed up boot. tweak conservative and ondemand govs. change up freqs.<br>${WEBOS_VERSION}-28: add screenstate. add boot messages.<br>${WEBOS_VERSION}-26: rebuild for 3.0.2. add BFQ. increase freq to a stable 1.728GHz without voltage increase.<br>${WEBOS_VERSION}-19: Initial release. autogroup process scheduling. CPU HW based alignment. deadline tweak.<br>

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = identification/mkcompile_h.patch \
		 psychobuild/F15C.patch \
		 psychobuild/fbconsole.patch \
		 psychobuild/F15-logo.patch \
		 psychobuild/iosched_blk.patch \
		 psychobuild/comptune.patch \
		 psychobuild/cpu_alignment.patch \
		 psychobuild/cpu_gov.patch \
		 psychobuild/iosched-bundle.patch \
		 psychobuild/autogroup.patch

TYPE = Kernel

include ../../support/kernel.mk

KERNEL_DEFCONFIG = psychobuild/F15C.config

