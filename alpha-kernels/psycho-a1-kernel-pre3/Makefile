NAME = $(shell basename $(shell pwd))
TITLE = A-1 Skyraider (Pre3)
DEVICE = pre3
CATEGORY = Alpha
VERSIONS = 2.2.0-12 2.2.3-12
APPINFO_DESCRIPTION = The latest alpha kernel from uNiXpSyChO.<br><br>\
Features:<br> * 1.9GHz<br> * CIFS, NFS, iSCSI, ATA over Ethernet<br> * More to come...<br><br>\
For more information, visit ${HOMEPAGE}<br>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-12", "log" : [ "Initial release" ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-12: Initial release<br>

HOMEPAGE = http://www.webos-internals.org/wiki/Application:PsychoKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git

KERNEL_PATCHES = psychobuild/comptune.patch \
		 psychobuild/A1.patch \
		 psychobuild/override.patch

EXTERNAL_MODULES = compcache/compcache-1.0.0
TYPE = Kernel

include ../../support/kernel.mk

KERNEL_DEFCONFIG = psychobuild/A1.config

