NAME           = uinput
APP_ID         = org.webosinternals.modules.${NAME}
TITLE          = Userspace Input Module
TYPE           = Modules
CATEGORY       = Input
VERSION        = 2.6.24
DESCRIPTION    = This is the uinput kernel module, which allows userpace creation of input devices.  Used by many linux projects for emulating keyboard/mouse input.
CHANGELOG      = 
DEVICE         = pre
KERNEL_VERSION = 2.6.24
WEBOS_VERSION  = 1.4.1
KERNEL_SOURCE  = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}.tgz
KERNEL_PATCH   = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}-patch\(${DEVICE}\).gz
SRC_GIT        = http://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = uinput/defconfig-standard.patch

ifeq ("${DEVICE}","pixi")
DEFCONFIG=chuck_defconfig
else
DEFCONFIG=omap_sirloin_3430_defconfig
endif

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk

include ../../support/package.mk
include ../../support/download.mk
include ../../support/cross-compile.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

.PHONY: build
build: build/.built-${VERSION}

build/unpacked-${VERSION}: ${DL_DIR}/linuxkernel-${KERNEL_VERSION}.tgz \
				${DL_DIR}/linuxkernel-${KERNEL_VERSION}-patch-${DEVICE}.tgz
	rm -rf build/src-${VERSION}
	mkdir -p build/src-${VERSION}/patches
	tar -C build/src-${VERSION} -xf ${DL_DIR}/linuxkernel-${KERNEL_VERSION}.tgz
	zcat ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-patch-${DEVICE}.tgz | \
		patch -d build/src-${VERSION}/linux-${KERNEL_VERSION} -p1
	tar -C build/src-${VERSION}/patches -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	( cd build/src-${VERSION}/patches ; cat ${KERNEL_PATCHES} > /dev/null ) || exit
	( cd build/src-${VERSION}/patches ; cat ${KERNEL_PATCHES} ) | \
		patch -d build/src-${VERSION}/linux-${KERNEL_VERSION} -p1
	touch $@

build/arm.built-${VERSION}: build/unpacked-${VERSION}
	mkdir -p build/arm/usr/palm/applications/${APP_ID}
	cp build/src-${VERSION}/patches/uinput/defconfig build/src-${VERSION}/linux-${KERNEL_VERSION}/.config
	yes '' | ${MAKE} -C build/src-${VERSION}/linux-${KERNEL_VERSION} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_arm} ${DEFCONFIG}
	${MAKE} -C build/src-${VERSION}/linux-${KERNEL_VERSION} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_arm} modules

build/.built-${VERSION}: build/arm.built-${VERSION}
	rm -rf build/arm
	mkdir -p build/arm/usr/palm/applications/${APP_ID}
	install -m 644 build/src-${VERSION}/linux-${KERNEL_VERSION}/drivers/input/misc/uinput.ko build/arm/usr/palm/applications/${APP_ID}

${DL_DIR}/linuxkernel-${KERNEL_VERSION}.tgz:
	rm -rf $@ $@.tmp
	mkdir -p ${DL_DIR}
	curl -f -R -L -o $@.tmp ${KERNEL_SOURCE}
	mv $@.tmp $@

${DL_DIR}/linuxkernel-${KERNEL_VERSION}-patch-${DEVICE}.tgz:
	rm -f $@ $@.tmp
	mkdir -p ${DL_DIR}
	curl -f -R -L -o $@.tmp ${KERNEL_PATCH}
	mv $@.tmp $@

.PHONY: clobber
clobber::
	rm -rf build
