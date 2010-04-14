NAME = $(shell basename $(shell pwd))-${WEBOS_VERSION}
TITLE = Palm webOS ${WEBOS_VERSION} Kernel (Palm Pre/Pre+)
DESCRIPTION = Use this package to reinstall the official webOS ${WEBOS_VERSION} kernel from Palm.<br>${KERNEL_DISCLAIMER}
CATEGORY = Recovery
VERSIONS = 1.4.0-1 1.4.1-1
FORCE_INSTALL = 1
HOMEPAGE = http://opensource.palm.com
SOURCE = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}-patch(pre).gz
KERNEL_PATCHES =

include ../../support/kernel.mk

build/arm.built-${VERSION}: ${DOCTOR_DIR}/webosdoctorp100ueu-wr-${WEBOS_VERSION}.jar
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

