NAME = $(shell basename $(shell pwd))
TITLE = F105 Thunderchief (Pre/Pre+)
CATEGORY = Experimental
DEVICE = pre
VERSIONS = 2.1.0-16
APPINFO_DESCRIPTION = The latest bleeding-edge totally-experimental kernel from uNiXpSyChO.<br><br>\
Features:<br> * New screenstate v2 with vdemand<br> * 1GHz<br> * 200MHz VDD2<br> * More govenors<br><br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br><br>${KERNEL_DISCLAIMER}<br>
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-16", "log" : [ "make screenstate dumb again. remove constraints. tmc memory hack." ] }, \
{ "version" : "${WEBOS_VERSION}-8", "log" : [ "remove some 200Mhz pwnage. add disgusting hack for freq flopping. add delay for screen on and off." ] }, \
{ "version" : "${WEBOS_VERSION}-4", "log" : [ "rebuild for webOS 2.1.0." ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-16: make screenstate dumb again. remove constraints. tmc memory hack.<br>${WEBOS_VERSION}-8: remove some 200Mhz pwnage. add disgusting hack for freq flopping. add delay for screen on and off.<br>${WEBOS_VERSION}-4: rebuild for webOS 2.1.0.<br>

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = psychobuild/F105-overclocking.patch \
		 sensors/omap34xx_temp.patch \
		 psychobuild/ssv2-ovrd.patch \
		 makefiletune/armMakefile.diff

KERNEL_DEFCONFIG = psychobuild/F105.config
#KERNEL_UPSTART   = psychobuild/F102A.upstart
TYPE = Kernel

include ../../support/kernel.mk
