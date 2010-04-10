NAME = $(shell basename $(shell pwd))
TITLE = Stock Kernel (Palm Pre)
DESCRIPTION = An unmodified stock kernel package.  Useful for putting your device back the way it was.
CATEGORY = Hardware-Related
# VERSIONS = 1.4.0-0
VERSION = 1.4.1-1
ICON = http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png
SCREENSHOTS = 
META_SUB_VERSION = 1

KERNEL_PATCHES =

PACKAGES = ipkgs/${APP_ID}_${VERSION}_armv7.ipk

include ../common.mk
include ../kernel.mk

APP_ID = org.webosinternals.kernels.${NAME}
MAINTAINER = WebOS Internals
HOMEPAGE = http://opensource.palm.com
POSTINSTALLFLAGS = RestartDevice
POSTUPDATEFLAGS  = RestartDevice
POSTREMOVEFLAGS  = RestartDevice

include ../../support/cross-compile.mk

APP_DIR = $(shell pwd)/build/armv7/usr/palm/applications/${APP_ID}

build/.built-${VERSION}: build/.unpacked-${VERSION}
	mkdir -p build/armv7/usr/palm/applications/${APP_ID}/additional_files/boot
	( cd build/src-${VERSION}/linux-${KERNEL_VERSION} ; \
	  yes '' | ${MAKE} ARCH=arm omap_sirloin_3430_defconfig ; \
	  ${MAKE} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_armv7} \
		INSTALL_MOD_PATH=${APP_DIR}/additional_files \
		uImage modules modules_install ; \
	)
	rm -f ${APP_DIR}/additional_files/lib/modules/${KERNEL_VERSION}-palm-joplin-3430/build
	rm -f ${APP_DIR}/additional_files/lib/modules/${KERNEL_VERSION}-palm-joplin-3430/source
	rm -f ${APP_DIR}/additional_files/lib/modules/${KERNEL_VERSION}-palm-joplin-3430/*.bin
	cp build/src-${VERSION}/linux-${KERNEL_VERSION}/arch/arm/boot/uImage \
		${APP_DIR}/additional_files/boot/uImage-2.6.24-palm-joplin-3430
	cp build/src-${VERSION}/linux-${KERNEL_VERSION}/System.map \
		${APP_DIR}/additional_files/boot/System.map-2.6.24-palm-joplin-3430
	cp build/src-${VERSION}/linux-${KERNEL_VERSION}/.config \
		${APP_DIR}/additional_files/boot/config-2.6.24-palm-joplin-3430
	touch $@

build/armv7/CONTROL/postinst:
	mkdir -p build/armv7/CONTROL
	install -m 755 control/postinst $@

build/armv7/CONTROL/prerm:
	rm -f $@