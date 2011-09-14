NAME = $(shell basename $(shell pwd))
TITLE = Palm Kernel (Pixi/Pixi+)
DEVICE = pixi
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
CATEGORY = Recovery
FORCE_INSTALL = 1
VERSIONS = 1.4.5-10 1.4.5.1-10
APPINFO_DESCRIPTION = Use this package to reinstall the official webOS ${WEBOS_VERSION} kernel from Palm.<br>\
This package will refuse to operate on a device with an incompatible webOS version.<br>\
Note that only files related to the Linux kernel are restored, and these will be forcibly overwritten regardless of their current state.  No other files are modified in any way.<br>\
In particular, any non-kernel files modified by overclocking patches or other modifications will not be restored. You should contact the maintainer of such patches for recovery procedures.<br>\
On removal, this package does not modify any files, not does it restore any previous state of the kernel.  The sole purpose of this package is to install the official webOS ${WEBOS_VERSION} kernel from Palm and to do nothing else.
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-10", "log" : [ "Added webOS 1.4.5.1 compatibility" ] }, \
{ "version" : "${WEBOS_VERSION}-9", "log" : [ "Added DeviceCompatibility flags" ] }, \
{ "version" : "${WEBOS_VERSION}-8", "log" : [ "Remove all WebOS Internals kernel packages" ] }, \
{ "version" : "${WEBOS_VERSION}-7", "log" : [ "Added webOS 1.4.1.3 compatibility" ] }, \
{ "version" : "${WEBOS_VERSION}-6", "log" : [ "Remove additional kernel upstart scripts" ] }, \
{ "version" : "${WEBOS_VERSION}-5", "log" : [ "Updated for the Palm Pixi/Pixi+" ] }, \
{ "version" : "${WEBOS_VERSION}-4", "log" : [ "Remove additional kernel modules" ] }, \
{ "version" : "${WEBOS_VERSION}-3", "log" : [ "Fixed rare installation problem" ] }, \
{ "version" : "${WEBOS_VERSION}-2", "log" : [ "Initial public release" ] } \
]

HOMEPAGE = http://opensource.palm.com
SOURCE = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}-patch(${DEVICE}).gz
KERNEL_PATCHES =
TYPE = Kernel

include ../../support/kernel.mk
CATEGORY = Recovery

build/arm.built-${VERSION}: ${WEBOS_DOCTOR}
	rm -rf build/arm
	mkdir -p build/arm/usr/palm/applications/${APP_ID}/additional_files
	unzip -p $< resources/webOS.tar | \
	${TAR} -O -x -f - ./nova-cust-image-${CODENAME}.rootfs.tar.gz | \
	${TAR} -C build/arm/usr/palm/applications/${APP_ID}/additional_files/ --wildcards -m -z -x -f - ./md5sums* ./boot ./lib/modules
	if [ -f build/arm/usr/palm/applications/${APP_ID}/additional_files/md5sums.gz ] ; then \
	  gunzip -f build/arm/usr/palm/applications/${APP_ID}/additional_files/md5sums.gz ; \
	fi
	rm -rf build/arm/usr/palm/applications/${APP_ID}/additional_files/boot/boot.bin
	rm -rf build/arm/usr/palm/applications/${APP_ID}/additional_files/boot/uImage
	rm -rf build/arm/usr/palm/applications/${APP_ID}/additional_files/lib/modules/${KERNEL_VERSION}-${KERNEL_TYPE}/kernel/net/wifi
	touch $@

build/.unpacked-${VERSION}:
	touch $@

build/arm/CONTROL/prerm:
	rm -f $@

