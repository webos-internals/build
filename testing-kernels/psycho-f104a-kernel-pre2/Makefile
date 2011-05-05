NAME = $(shell basename $(shell pwd))
TITLE = F104A Starfighter (Pre/Pre+)
CATEGORY = Experimental
DEVICE = pre2
VERSIONS = 2.1.0-43
APPINFO_DESCRIPTION = The latest experimental kernel from uNiXpSyChO.<br><br>\
Features:<br> * Screenstate v3<br> * 1.1GHz<br> * More govenors<br><br>\
For more information, visit ${HOMEPAGE}<br>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}<br>
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-43", "log" : [ "rebuild for webOS 2.1.0. introduce SSv3." ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-43: rebuild for webOS 2.1.0. introduce SSv3.<br>

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = psychobuild/F104A-pre2.patch \
		 sensors/omap34xx_temp.patch \
		 psychobuild/ssv3-ovrd.patch \
		 compcache/lowmemnotify-total-memory.patch \
		 compcache/compcache.patch \
		 psychobuild/preempt.patch \
		 makefiletune/armMakefile.diff

EXTERNAL_MODULES = compcache/compcache-0.5.4
KERNEL_DEFCONFIG = psychobuild/F104A-pre2.config
#KERNEL_UPSTART   = psychobuild/F104A.upstart
TYPE = Kernel

include ../../support/kernel.mk
