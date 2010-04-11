TYPE = Kernel
APP_ID = org.webosinternals.kernels.${NAME}
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
DEPENDS = 
FEED = Hardware Patches
LICENSE = GPL v2 Open Source
KERNEL_VERSION = 2.6.24
KERNEL_SOURCE = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}.tgz
KERNEL_PATCH  = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}-patch\(pre\).gz
DL_DIR = ../../downloads
POSTINSTALLFLAGS = RestartDevice
POSTUPDATEFLAGS  = RestartDevice
POSTREMOVEFLAGS  = RestartDevice

KERNEL_DISCLAIMER = WebOS Internals provides this program as is without warranty of any kind, either expressed or implied, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose.  The entire risk as to the quality and performance of this program is with you.  Should this program prove defective, you assume the cost of all necessary servicing, repair or correction.<br>\
In no event will WebOS Internals or any other party be liable to you for damages, including any general, special, incidental or consequential damages arising out of the use or inability to use this program (including but not limited to loss of data or data being rendered inaccurate or losses sustained by you or third parties or a failure of this program to operate with any other programs).

include ../../support/cross-compile.mk

ifneq ("${DUMMY_VERSION}", "")

DESCRIPTION=This package is not currently available for WebOS ${WEBOS_VERSION}.  This package may be installed as a placeholder to notify you when an update is available.  NOTE: This is simply an empty package placeholder, it will not affect your device in any way
CATEGORY=Unavailable
SRC_GIT=
DEPENDS=
POSTINSTALLFLAGS=
POSTUPDATEFLAGS=
POSTREMOVEFLAGS=

build/built-${VERSION}:
	rm -rf build/all
	mkdir -p build/all
	touch $@

else

build/.built-${VERSION}: build/arm.built-${VERSION}
	touch $@

build/arm/CONTROL/postinst:
	mkdir -p build/arm/CONTROL
	sed -e 's|PID=|PID="${APP_ID}"|' ../postinst.kernel > $@
	chmod ugo+x $@

build/arm/CONTROL/prerm:
	rm -f $@

build/arm.built-${VERSION}: build/.unpacked-${VERSION}
	mkdir -p build/arm/usr/palm/applications/${APP_ID}/additional_files/boot
	( cd build/src-${VERSION}/linux-${KERNEL_VERSION} ; \
	  yes '' | ${MAKE} ARCH=arm omap_sirloin_3430_defconfig ; \
	  ${MAKE} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_arm} \
		INSTALL_MOD_PATH=$(shell pwd)/build/arm/usr/palm/applications/${APP_ID}/additional_files \
		uImage modules modules_install ; \
	)
	rm -f build/arm/usr/palm/applications/${APP_ID}/additional_files/lib/modules/${KERNEL_VERSION}-palm-joplin-3430/build
	rm -f build/arm/usr/palm/applications/${APP_ID}/additional_files/lib/modules/${KERNEL_VERSION}-palm-joplin-3430/source
	rm -f build/arm/usr/palm/applications/${APP_ID}/additional_files/lib/modules/${KERNEL_VERSION}-palm-joplin-3430/*.bin
	cp build/src-${VERSION}/linux-${KERNEL_VERSION}/arch/arm/boot/uImage \
		build/arm/usr/palm/applications/${APP_ID}/additional_files/boot/uImage-2.6.24-palm-joplin-3430
	touch $@

build/.unpacked-${VERSION}: ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}.tgz \
			    ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-patch-pre.gz \
			    ${DL_DIR}/patches-${VERSION}.tar.gz
	rm -rf build/src-${VERSION}
	mkdir -p build/src-${VERSION}/patches
	tar -C build/src-${VERSION} -xf ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}.tgz
	zcat ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-patch-pre.gz | \
		patch -d build/src-${VERSION}/linux-${KERNEL_VERSION} -p1 
	tar -C build/src-${VERSION}/patches -xf ${DL_DIR}/patches-${VERSION}.tar.gz
	if [ -n "${KERNEL_PATCHES}" ] ; then \
	  ( cd build/src-${VERSION}/patches ; cat ${KERNEL_PATCHES} ) | \
		patch -d build/src-${VERSION}/linux-${KERNEL_VERSION} -p1 ; \
	fi
	touch $@

${DL_DIR}/patches-${VERSION}.tar.gz:
	$(call PREWARE_SANITY)
	mkdir -p build
	( cd build ; rm -rf `basename ${SRC_GIT} .git` )
	( cd build ; git clone -n ${SRC_GIT} ; cd `basename ${SRC_GIT} .git`; git checkout v${VERSION} )
	mkdir -p ${DL_DIR}
	tar -C build/`basename ${SRC_GIT} .git` -zcf $@ .
	( cd build/`basename ${SRC_GIT} .git` ; git log --pretty="format:%ct" -n 1 ) | \
	python -c 'import os,sys; time = int(sys.stdin.read()); os.utime("$@",(time,time));'

${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}.tgz:
	rm -f $@ $@.tmp
	mkdir -p ${DL_DIR}
	curl -f -R -L -o $@.tmp ${KERNEL_SOURCE}
	mv $@.tmp $@

${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-patch-pre.gz:
	rm -f $@ $@.tmp
	mkdir -p ${DL_DIR}
	curl -f -R -L -o $@.tmp ${KERNEL_PATCH}
	mv $@.tmp $@

endif