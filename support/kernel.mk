SIGNER = org.webosinternals
MAINTAINER = WebOS Internals <support@webos-internals.org>
ICON = http://www.webos-internals.org/images/9/9e/Icon_WebOSInternals_Kernel.png
DEPENDS = 
FEED = WebOS Kernels
LICENSE = GPL v2 Open Source
WEBOS_VERSIONS = 1.4.0 1.4.1 1.4.2 1.4.3 1.4.5
KERNEL_VERSION = 2.6.24
KERNEL_SOURCE = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}.tgz
KERNEL_PATCH  = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}-patch\(${DEVICE}\).gz
DL_DIR = ../../downloads
POSTINSTALLFLAGS = RestartDevice
POSTUPDATEFLAGS  = RestartDevice
POSTREMOVEFLAGS  = RestartDevice

HEADLESSAPP_VERSION = 0.1.0

KERNEL_DISCLAIMER = WebOS Internals provides this program as is without warranty of any kind, either expressed or implied, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose.  The entire risk as to the quality and performance of this program is with you.  Should this program prove defective, you assume the cost of all necessary servicing, repair or correction.<br>\
In no event will WebOS Internals or any other party be liable to you for damages, including any general, special, incidental or consequential damages arising out of the use or inability to use this program (including but not limited to loss of data or data being rendered inaccurate or losses sustained by you or third parties or a failure of this program to operate with any other programs).

PREWARE_SANITY =
ifneq ("$(TYPE)","Kernel")
ifneq ("$(TYPE)","Kernel Module")
PREWARE_SANITY += $(error "Please define TYPE as Kernel or Kernel Module in your Makefile")
endif
endif

include ../../support/cross-compile.mk

WEBOS_VERSION:=$(shell echo ${VERSION} | cut -d- -f1)

ifeq ("${TYPE}", "Kernel")
KERNEL_MODULES = modules
KERNEL_IMAGE = uImage
APP_ID = org.webosinternals.kernels.${NAME}
else
APP_ID = org.webosinternals.modules.${NAME}
endif

ifeq ("${DEVICE}","pixi")
CODENAME = pixie
DEFCONFIG = chuck_defconfig
KERNEL_TYPE = palm-chuck
DEVICECOMPATIBILITY = [\"Pixi\"]
else
DEVICE = pre
CODENAME = castle
DEFCONFIG = omap_sirloin_3430_defconfig
KERNEL_TYPE = palm-joplin-3430
DEVICECOMPATIBILITY = [\"Pre\"]
endif

ifeq ("${DEVICE}","pixi")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp200ewwsprint-${WEBOS_VERSION}.jar
else
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp100ewwsprint-${WEBOS_VERSION}.jar
endif
COMPATIBLE_VERSIONS = ${WEBOS_VERSION}

ifeq ("${WEBOS_VERSION}", "1.4.1")
ifeq ("${DEVICE}","pixi")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp121ueu-wr-${WEBOS_VERSION}.jar
else
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp100ueu-wr-${WEBOS_VERSION}.jar
endif
COMPATIBLE_VERSIONS = 1.4.1 | 1.4.1.1 | 1.4.1.3
endif

ifeq ("${WEBOS_VERSION}", "1.4.2")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp101ewwatt-${WEBOS_VERSION}.jar
endif

ifeq ("${WEBOS_VERSION}", "1.4.3")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp121ewwatt-${WEBOS_VERSION}.jar
endif

ifeq ("${WEBOS_VERSION}", "1.4.5")
ifeq ("${DEVICE}","pixi")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp121ewweu-wr-${WEBOS_VERSION}.jar
else
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp100ueu-wr-${WEBOS_VERSION}.jar
endif
COMPATIBLE_VERSIONS = 1.4.5
endif

.PHONY: package
.PHONY: head

ifneq ("${VERSIONS}", "")
package: 
	for v in ${WEBOS_VERSIONS} ; do \
		VERSION=$${v}-0 ${MAKE} VERSIONS= WEBOS_VERSION=$${v} DUMMY_VERSION=0 package ; \
	done; \
	for v in ${VERSIONS} ; do \
		VERSION=$${v} ${MAKE} VERSIONS= WEBOS_VERSION=`echo $${v} | cut -d- -f1` package ; \
	done
head: 
	for v in ${VERSIONS} ; do \
	 	VERSION=$${v} ${MAKE} VERSIONS= WEBOS_VERSION=`echo $${v} | cut -d- -f1` head ; \
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

include ../../support/headlessapp.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/arm.built-${VERSION} ${DL_DIR}/headlessapp-${HEADLESSAPP_VERSION}.tar.gz
	tar -C build/arm/usr/palm/applications/${APP_ID} -xvf ${DL_DIR}/headlessapp-${HEADLESSAPP_VERSION}.tar.gz
	rm -rf build/arm/usr/palm/applications/${APP_ID}/.git
	cp ../../support/kernel.png build/arm/usr/palm/applications/${APP_ID}/icon.png
	echo "{" > build/arm/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"title\": \"${TITLE}\"," >> build/arm/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"id\": \"${APP_ID}\"," >> build/arm/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"version\": \"${WEBOS_VERSION}\"," >> build/arm/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"vendor\": \"WebOS Internals\"," >> build/arm/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"type\": \"web\"," >> build/arm/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"main\": \"index.html\"," >> build/arm/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"icon\": \"icon.png\"," >> build/arm/usr/palm/applications/${APP_ID}/appinfo.json
ifdef APPINFO_DESCRIPTION
	echo '"message": "${APPINFO_DESCRIPTION}",' >> build/arm/usr/palm/applications/${APP_ID}/appinfo.json
endif
ifdef APPINFO_CHANGELOG
	echo '"changeLog": ${APPINFO_CHANGELOG},' >> build/arm/usr/palm/applications/${APP_ID}/appinfo.json
endif
	echo "\"noWindow\": true" >> build/arm/usr/palm/applications/${APP_ID}/appinfo.json
	echo "}" >> build/arm/usr/palm/applications/${APP_ID}/appinfo.json
	touch $@

ifeq ("${TYPE}", "Kernel Module")
build/%/CONTROL/postinst:
	mkdir -p build/arm/CONTROL
	sed -e 's|PATCH_NAME=|PATCH_NAME=$(shell basename ${PATCH})|' \
			-e 's|APP_DIR=|APP_DIR=/media/cryptofs/apps/usr/palm/applications/${APP_ID}|' \
			../../autopatch/postinst${SUFFIX} > $@
	chmod ugo+x $@

build/%/CONTROL/prerm:
	mkdir -p build/arm/CONTROL
	sed -e 's|PATCH_NAME=|PATCH_NAME=$(shell basename ${PATCH})|' \
			-e 's|APP_DIR=|APP_DIR=/media/cryptofs/apps/usr/palm/applications/${APP_ID}|' \
			../../autopatch/prerm${SUFFIX} > $@
	chmod ugo+x $@
else
build/%/CONTROL/postinst:
	mkdir -p build/arm/CONTROL
	sed -e 's/PID=/PID="${APP_ID}"/' -e 's/FORCE_INSTALL=/FORCE_INSTALL="${FORCE_INSTALL}"/' \
	    -e 's/%COMPATIBLE_VERSIONS%/${COMPATIBLE_VERSIONS}/' \
	    -e 's|%UPSTART_SCRIPT%|${KERNEL_UPSTART}|' \
		../../support/kernel.postinst > $@
	chmod ugo+x $@

build/%/CONTROL/prerm:
	mkdir -p build/arm/CONTROL
	sed -e 's/PID=/PID="${APP_ID}"/' -e 's/FORCE_REMOVE=/FORCE_REMOVE="${FORCE_REMOVE}"/' \
	    -e 's/%COMPATIBLE_VERSIONS%/${COMPATIBLE_VERSIONS}/' \
	    -e 's|%UPSTART_SCRIPT%|${KERNEL_UPSTART}|' \
		../../support/kernel.prerm > $@
	chmod ugo+x $@
endif

build/arm.built-%: build/.unpacked-% ${WEBOS_DOCTOR}
	mkdir -p build/arm/usr/palm/applications/${APP_ID}/additional_files/boot
	if [ -n "${KERNEL_DEFCONFIG}" ] ; then \
	  cp build/src-$*/patches/${KERNEL_DEFCONFIG} build/src-$*/linux-${KERNEL_VERSION}/.config ; \
	  yes '' | \
	  ${MAKE} -C build/src-$*/linux-${KERNEL_VERSION} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_arm} \
		oldconfig ; \
	else \
		yes '' | \
		${MAKE} -C build/src-$*/linux-${KERNEL_VERSION} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_arm} \
		${DEFCONFIG} ; \
	fi
	${MAKE} -C build/src-$*/linux-${KERNEL_VERSION} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_arm} \
		KBUILD_BUILD_COMPILE_BY=v$* KBUILD_BUILD_COMPILE_HOST=${APP_ID} \
		INSTALL_MOD_PATH=$(shell pwd)/build/arm/usr/palm/applications/${APP_ID}/additional_files \
		${KERNEL_IMAGE} ${KERNEL_MODULES} modules_install
	if [ -n "${EXTERNAL_MODULES}" ] ; then \
	  for module in ${EXTERNAL_MODULES} ; do \
	    ( cd build/src-$*/patches/$$module ; \
	      ${MAKE} -C $(shell pwd)/build/src-$*/patches/$$module ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_arm} \
		KERNEL_BUILD_PATH=$(shell pwd)/build/src-$*/linux-${KERNEL_VERSION} DEVICE=${DEVICE} \
		INSTALL_MOD_PATH=$(shell pwd)/build/arm/usr/palm/applications/${APP_ID}/additional_files \
		modules modules_install ) ; \
	  done \
	fi
	rm -f build/arm/usr/palm/applications/${APP_ID}/additional_files/lib/modules/${KERNEL_VERSION}-${KERNEL_TYPE}/build
	rm -f build/arm/usr/palm/applications/${APP_ID}/additional_files/lib/modules/${KERNEL_VERSION}-${KERNEL_TYPE}/source
	rm -f build/arm/usr/palm/applications/${APP_ID}/additional_files/lib/modules/${KERNEL_VERSION}-${KERNEL_TYPE}/*.bin
	rm -f build/arm/usr/palm/applications/${APP_ID}/additional_files/lib/modules/${KERNEL_VERSION}-${KERNEL_TYPE}/modules.*
	if [ -n "${KERNEL_IMAGE}" ]; then \
		cp build/src-$*/linux-${KERNEL_VERSION}/arch/arm/boot/uImage \
			build/arm/usr/palm/applications/${APP_ID}/additional_files/boot/uImage-2.6.24-${KERNEL_TYPE}; \
		cp build/src-$*/linux-${KERNEL_VERSION}/System.map \
			build/arm/usr/palm/applications/${APP_ID}/additional_files/boot/System.map-2.6.24-${KERNEL_TYPE}; \
		cp build/src-$*/linux-${KERNEL_VERSION}/.config \
			build/arm/usr/palm/applications/${APP_ID}/additional_files/boot/config-2.6.24-${KERNEL_TYPE}; \
	fi
	unzip -p ${WEBOS_DOCTOR} resources/webOS.tar | \
	tar -O -x -f - ./nova-cust-image-${CODENAME}.rootfs.tar.gz | \
	tar -C build/arm/usr/palm/applications/${APP_ID}/additional_files/ -m -z -x -f - ./md5sums
	if [ -n "${KERNEL_UPSTART}" ] ; then \
		mkdir -p build/arm/usr/palm/applications/${APP_ID}/additional_files/var/palm/event.d ; \
		install -m 755 build/src-$*/patches/${KERNEL_UPSTART} \
			 build/arm/usr/palm/applications/${APP_ID}/additional_files/var/palm/event.d/${APP_ID} ; \
	fi
	touch $@

build/.unpacked-%: ${DL_DIR}/linux-${KERNEL_VERSION}-${WEBOS_VERSION}-${DEVICE}.tar.gz \
			    ${DL_DIR}/${NAME}-%.tar.gz
	rm -rf build/src-$*
	mkdir -p build/src-$*/patches
	tar -C build/src-$* -xf ${DL_DIR}/linux-${KERNEL_VERSION}-${WEBOS_VERSION}-${DEVICE}.tar.gz
	tar -C build/src-$*/patches -xf ${DL_DIR}/${NAME}-$*.tar.gz
	if [ -n "${KERNEL_PATCHES}" ] ; then \
	  ( cd build/src-$*/patches ; cat ${KERNEL_PATCHES} > /dev/null ) || exit ; \
	  ( cd build/src-$*/patches ; cat ${KERNEL_PATCHES} ) | \
		patch -d build/src-$*/linux-${KERNEL_VERSION} -p1 ; \
	fi
	touch $@


ifeq ("${WEBOS_VERSION}", "1.4.3")

TEMPVER  = 1.4.1

KERNEL_SOURCE = http://palm.cdnetworks.net/opensource/${TEMPVER}/linuxkernel-${KERNEL_VERSION}.tgz
KERNEL_PATCH  = http://palm.cdnetworks.net/opensource/${TEMPVER}/linuxkernel-${KERNEL_VERSION}-patch\(${DEVICE}\).gz

build/.unpacked-${VERSION}: ${DL_DIR}/linux-${KERNEL_VERSION}-${TEMPVER}-${DEVICE}.tar.gz \
			    ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build/src-${VERSION}
	mkdir -p build/src-${VERSION}/patches
	tar -C build/src-${VERSION} -xf ${DL_DIR}/linux-${KERNEL_VERSION}-${TEMPVER}-${DEVICE}.tar.gz
	tar -C build/src-${VERSION}/patches -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	if [ -n "${KERNEL_PATCHES}" ] ; then \
	  ( cd build/src-${VERSION}/patches ; cat ${KERNEL_PATCHES} > /dev/null ) || exit ; \
	  ( cd build/src-${VERSION}/patches ; cat ${KERNEL_PATCHES} ) | \
		patch -d build/src-${VERSION}/linux-${KERNEL_VERSION} -p1 ; \
	fi
	touch $@

endif


${DL_DIR}/linux-${KERNEL_VERSION}-${WEBOS_VERSION}-${DEVICE}.tar.gz: \
					${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-${DEVICE}.tar.gz \
					${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-patch-${DEVICE}.gz
	rm -rf build/src-${VERSION}
	mkdir -p build/src-${VERSION}
	tar -C build/src-${VERSION} -xf ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-${DEVICE}.tar.gz
	zcat ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-patch-${DEVICE}.gz | \
		patch -d build/src-${VERSION}/linux-${KERNEL_VERSION} -p1 
	yes '' | \
	${MAKE} -C build/src-${VERSION}/linux-${KERNEL_VERSION} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_arm} \
	${DEFCONFIG}
	${MAKE} -C build/src-${VERSION}/linux-${KERNEL_VERSION} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_arm} \
		KBUILD_BUILD_COMPILE_BY=v${WEBOS_VERSION} KBUILD_BUILD_COMPILE_HOST=${APP_ID} \
		uImage 
	tar -C build/src-${VERSION} -zcf $@ linux-${KERNEL_VERSION}

${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-${DEVICE}.tar.gz:
	rm -f $@ $@.tmp
	mkdir -p ${DL_DIR}
	curl -f -R -L -o $@.tmp ${KERNEL_SOURCE}
	mv $@.tmp $@

${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-patch-${DEVICE}.gz:
	rm -f $@ $@.tmp
	mkdir -p ${DL_DIR}
	curl -f -R -L -o $@.tmp ${KERNEL_PATCH}
	mv $@.tmp $@

endif

.PHONY: clobber
clobber::
	rm -rf build
