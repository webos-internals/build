NAME = $(shell basename $(shell pwd))
TITLE = Palm Kernel (Pre/Pre+)
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
CATEGORY = Recovery
FORCE_INSTALL = 1
VERSIONS = 1.4.0-3 1.4.1-3 1.4.2-3
APPINFO_DESCRIPTION = Use this package to reinstall the official webOS ${WEBOS_VERSION} kernel from Palm.<br>\
This package will refuse to operate on a device with an incompatible webOS version.<br>\
Note that only files related to the Linux kernel are restored, and these will be forcibly overwritten regardless of their current state.  No other files are modified in any way.<br>\
In particular, any non-kernel files modified by overclocking patches or other modifications will not be restored. You should contact the maintainer of such patches for recovery procedures.<br>\
On removal, this package does not modify any files, not does it restore any previous state of the kernel.  The sole purpose of this package is to install the official webOS ${WEBOS_VERSION} kernel from Palm and to do nothing else.
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-3", "log" : [ "Fixed rare installation problem" ] }, \
{ "version" : "${WEBOS_VERSION}-2", "log" : [ "Initial public release" ] } \
]

HOMEPAGE = http://opensource.palm.com
SOURCE = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}-patch(pre).gz
KERNEL_PATCHES =

include ../../support/kernel.mk

build/arm.built-${VERSION}: ${WEBOS_DOCTOR}
	rm -rf build/arm
	mkdir -p build/arm/usr/palm/applications/${APP_ID}/additional_files
	unzip -p $< resources/webOS.tar | \
	tar -O -x -f - ./nova-cust-image-castle.rootfs.tar.gz | \
	tar -C build/arm/usr/palm/applications/${APP_ID}/additional_files/ -m -z -x -f - ./md5sums ./boot ./lib/modules
	rm -rf build/arm/usr/palm/applications/${APP_ID}/additional_files/boot/boot.bin
	rm -rf build/arm/usr/palm/applications/${APP_ID}/additional_files/boot/uImage
	rm -rf build/arm/usr/palm/applications/${APP_ID}/additional_files/lib/modules/${KERNEL_VERSION}-palm-joplin-3430/dspbridge
	rm -rf build/arm/usr/palm/applications/${APP_ID}/additional_files/lib/modules/${KERNEL_VERSION}-palm-joplin-3430/tisgxgfx
	rm -rf build/arm/usr/palm/applications/${APP_ID}/additional_files/lib/modules/${KERNEL_VERSION}-palm-joplin-3430/kernel/net/wifi
	touch $@

build/.unpacked-${VERSION}:
	touch $@

build/arm/CONTROL/prerm:
	rm -f $@

