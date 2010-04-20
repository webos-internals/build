TYPE = Kernel
APP_ID = org.webosinternals.kernels.${NAME}
SIGNER = org.webosinternals
BLDFLAGS = -p
MAINTAINER = WebOS Internals <support@webos-internals.org>
ICON = http://www.webos-internals.org/images/9/9e/Icon_WebOSInternals_Kernel.png
DEPENDS = 
FEED = Hardware
LICENSE = GPL v2 Open Source
WEBOS_VERSIONS = 1.4.0 1.4.1
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

WEBOS_VERSION:=$(shell echo ${VERSION} | cut -d- -f1)

WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp100ueu-wr-${WEBOS_VERSION}.jar
COMPATIBLE_VERSIONS = ${WEBOS_VERSION}

ifeq ("${WEBOS_VERSION}", "1.4.1")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp100ueu-wr-${WEBOS_VERSION}.jar
COMPATIBLE_VERSIONS = 1.4.1 | 1.4.1.1
endif

.PHONY: package
ifneq ("${VERSIONS}", "")
package:
	for v in ${WEBOS_VERSIONS} ; do \
	  VERSION=$${v}-0 ${MAKE} VERSIONS= WEBOS_VERSION=$${v} DUMMY_VERSION=0 package ; \
	done; \
	for v in ${VERSIONS} ; do \
	  VERSION=$${v} ${MAKE} VERSIONS= WEBOS_VERSION=`echo $${v} | cut -d- -f1` package ; \
	done
else
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk
endif

ifneq ("${DUMMY_VERSION}", "")

DESCRIPTION=This package is not currently available for WebOS ${WEBOS_VERSION}.  This package may be installed as a placeholder to notify you when an update is available.  NOTE: This is simply an empty package placeholder, it will not affect your device in any way
CATEGORY=Unavailable
SRC_GIT=
DEPENDS=
POSTINSTALLFLAGS=
POSTUPDATEFLAGS=
POSTREMOVEFLAGS=

include ../../support/package.mk

build/.built-${VERSION}:
	rm -rf build/arm
	mkdir -p build/arm
	touch $@

else

include ../../support/package.mk

include ../../support/download.mk

include ../../support/doctors.mk


.PHONY: unpack
unpack: build/.unpacked-${VERSION}

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/arm.built-${VERSION}
	cp ../../support/kernel.png build/arm/usr/palm/applications/${APP_ID}/icon.png
	echo "{" > build/arm/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"title\": \"${TITLE}\"," >> build/arm/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"id\": \"${APP_ID}\"," >> build/arm/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"version\": \"${WEBOS_VERSION}\"," >> build/arm/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"vendor\": \"WebOS Internals\"," >> build/arm/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"icon\": \"icon.png\"," >> build/arm/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"type\": \"web\"" >> build/arm/usr/palm/applications/${APP_ID}/appinfo.json
	echo "}" >> build/arm/usr/palm/applications/${APP_ID}/appinfo.json
	touch $@

build/%/CONTROL/postinst:
	mkdir -p build/arm/CONTROL
	sed -e 's/PID=/PID="${APP_ID}"/' -e 's/FORCE_INSTALL=/FORCE_INSTALL="${FORCE_INSTALL}"/' \
	    -e 's/%COMPATIBLE_VERSIONS%/${COMPATIBLE_VERSIONS}/' \
		../../support/kernel.postinst > $@
	chmod ugo+x $@

build/%/CONTROL/prerm:
	mkdir -p build/arm/CONTROL
	sed -e 's/PID=/PID="${APP_ID}"/' -e 's/FORCE_REMOVE=/FORCE_REMOVE="${FORCE_REMOVE}"/' \
	    -e 's/%COMPATIBLE_VERSIONS%/${COMPATIBLE_VERSIONS}/' \
		../../support/kernel.prerm > $@
	chmod ugo+x $@

build/arm.built-%: build/.unpacked-% ${WEBOS_DOCTOR}
	mkdir -p build/arm/usr/palm/applications/${APP_ID}/additional_files/boot
	( cd build/src-$*/linux-${KERNEL_VERSION} ; \
	  yes '' | ${MAKE} ARCH=arm omap_sirloin_3430_defconfig ; \
	  ${MAKE} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_arm} \
		KBUILD_BUILD_COMPILE_BY=v$* KBUILD_BUILD_COMPILE_HOST=${APP_ID} \
		INSTALL_MOD_PATH=$(shell pwd)/build/arm/usr/palm/applications/${APP_ID}/additional_files \
		uImage modules modules_install ; \
	)
	rm -f build/arm/usr/palm/applications/${APP_ID}/additional_files/lib/modules/${KERNEL_VERSION}-palm-joplin-3430/build
	rm -f build/arm/usr/palm/applications/${APP_ID}/additional_files/lib/modules/${KERNEL_VERSION}-palm-joplin-3430/source
	rm -f build/arm/usr/palm/applications/${APP_ID}/additional_files/lib/modules/${KERNEL_VERSION}-palm-joplin-3430/*.bin
	rm -f build/arm/usr/palm/applications/${APP_ID}/additional_files/lib/modules/${KERNEL_VERSION}-palm-joplin-3430/modules.*
	cp build/src-$*/linux-${KERNEL_VERSION}/arch/arm/boot/uImage \
		build/arm/usr/palm/applications/${APP_ID}/additional_files/boot/uImage-2.6.24-palm-joplin-3430
	cp build/src-$*/linux-${KERNEL_VERSION}/System.map \
		build/arm/usr/palm/applications/${APP_ID}/additional_files/boot/System.map-2.6.24-palm-joplin-3430
	cp build/src-$*/linux-${KERNEL_VERSION}/.config \
		build/arm/usr/palm/applications/${APP_ID}/additional_files/boot/config-2.6.24-palm-joplin-3430
	unzip -p ${WEBOS_DOCTOR} resources/webOS.tar | \
	tar -O -x -f - ./nova-cust-image-castle.rootfs.tar.gz | \
	tar -C build/arm/usr/palm/applications/${APP_ID}/additional_files/ -m -z -x -f - ./md5sums
	touch $@

build/.unpacked-%: ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}.tgz \
			    ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-patch-pre.gz \
			    ${DL_DIR}/${NAME}-%.tar.gz
	rm -rf build/src-$*
	mkdir -p build/src-$*/patches
	tar -C build/src-$* -xf ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}.tgz
	zcat ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-patch-pre.gz | \
		patch -d build/src-$*/linux-${KERNEL_VERSION} -p1 
	tar -C build/src-$*/patches -xf ${DL_DIR}/${NAME}-$*.tar.gz
	if [ -n "${KERNEL_PATCHES}" ] ; then \
	  ( cd build/src-$*/patches ; cat ${KERNEL_PATCHES} ) | \
		patch -d build/src-$*/linux-${KERNEL_VERSION} -p1 ; \
	fi
	touch $@

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

.PHONY: clobber
clobber::
	rm -rf build
