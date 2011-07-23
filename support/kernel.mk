SIGNER = org.webosinternals
MAINTAINER = WebOS Internals <support@webos-internals.org>
ICON = http://www.webos-internals.org/images/9/9e/Icon_WebOSInternals_Kernel.png
DEPENDS = 
FEED = WebOS Kernels
LICENSE = GPL v2 Open Source
ifeq ("${DEVICE}","pre")
WEBOS_VERSIONS = 1.4.5 2.1.0
KERNEL_VERSION = 2.6.24
endif
ifeq ("${DEVICE}","pixi")
WEBOS_VERSIONS = 1.4.5
KERNEL_VERSION = 2.6.24
endif
ifeq ("${DEVICE}","pre2")
WEBOS_VERSIONS = 2.0.1 2.1.0
KERNEL_VERSION = 2.6.24
endif
ifeq ("${DEVICE}","veer")
WEBOS_VERSIONS = 2.1.2
KERNEL_VERSION = 2.6.29
endif
ifeq ("${DEVICE}","touchpad")
WEBOS_VERSIONS = 3.0.0
KERNEL_VERSION = 2.6.35
endif
KERNEL_SOURCE = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}.tgz
DL_DIR = ../../downloads
POSTINSTALLFLAGS = RestartDevice
POSTUPDATEFLAGS  = RestartDevice
POSTREMOVEFLAGS  = RestartDevice
UPSTART_SCRIPT=$(shell basename ${APP_ID} ${SUFFIX})

HEADLESSAPP_VERSION = 0.1.0

KERNEL_DISCLAIMER = WebOS Internals provides this program as is without warranty of any kind, either expressed or implied, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose.  The entire risk as to the quality and performance of this program is with you.  Should this program prove defective, you assume the cost of all necessary servicing, repair or correction.<br>\
In no event will WebOS Internals or any other party be liable to you for damages, including any general, special, incidental or consequential damages arising out of the use or inability to use this program (including but not limited to loss of data or data being rendered inaccurate or losses sustained by you or third parties or a failure of this program to operate with any other programs).

ifeq ($(shell uname -s),Darwin)
TAR	= gnutar
else
TAR	= tar
endif

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

ifeq ("${DEVICE}","pre")
CODENAME = castle
DEFCONFIG = omap_sirloin_3430_defconfig
KERNEL_TYPE = palm-joplin-3430
DEVICECOMPATIBILITY = [\"Pre\"]
endif
ifeq ("${DEVICE}","pixi")
CODENAME = pixie
DEFCONFIG = chuck_defconfig
KERNEL_TYPE = palm-chuck
DEVICECOMPATIBILITY = [\"Pixi\"]
endif
ifeq ("${DEVICE}","pre2")
CODENAME = roadrunner
DEFCONFIG = omap_sirloin_3630_defconfig
KERNEL_TYPE = palm-joplin-3430
DEVICECOMPATIBILITY = [\"Pre2\"]
endif
ifeq ("${DEVICE}","veer")
CODENAME = broadway
DEFCONFIG = shank_defconfig
KERNEL_TYPE = palm-shank
DEVICECOMPATIBILITY = [\"Veer\"]
endif
ifeq ("${DEVICE}","touchpad")
CODENAME = topaz
DEFCONFIG = tenderloin_defconfig
KERNEL_TYPE = palm-tenderloin
DEVICECOMPATIBILITY = [\"TouchPad\"]
endif

ifeq ("${DEVICE}","pre")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp100ueu-wr-${WEBOS_VERSION}.jar
ifeq ("${WEBOS_VERSION}", "2.1.0")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp101ueude-wr-${WEBOS_VERSION}.jar
endif
endif
ifeq ("${DEVICE}","pixi")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp121ewweu-wr-${WEBOS_VERSION}.jar
endif
ifeq ("${DEVICE}","pre2")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp102ueuna-wr-${WEBOS_VERSION}.jar
ifeq ("${WEBOS_VERSION}", "2.0.0")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp103ueu-wr-${WEBOS_VERSION}.jar
endif
ifeq ("${WEBOS_VERSION}", "2.1.0")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp103ueuna-wr-${WEBOS_VERSION}.jar
endif
endif
ifeq ("${DEVICE}","veer")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp160unaatt-${WEBOS_VERSION}.jar
endif
ifeq ("${DEVICE}","touchpad")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp300hstnhwifi-${WEBOS_VERSION}.jar
endif
COMPATIBLE_VERSIONS = ${WEBOS_VERSION}

ifeq ("${WEBOS_VERSION}", "1.4.5")
COMPATIBLE_VERSIONS = 1.4.5 | 1.4.5.1
KERNEL_PATCH  = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}-patch\(${DEVICE}\).gz
endif

ifeq ("${WEBOS_VERSION}", "2.0.0")
ifeq ("${DEVICE}","pre2")
KERNEL_PATCH = http://palm.cdnetworks.net/opensource/2.0.0/kernel_patches.tar.gz
KERNEL_SUBMISSION = patch-submission-48
endif
# Override the compiler
CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs09q1armel/build/arm-2009q1/bin/arm-none-linux-gnueabi-
endif

ifeq ("${WEBOS_VERSION}", "2.0.1")
ifeq ("${DEVICE}","pre2")
KERNEL_SOURCE = http://palm.cdnetworks.net/opensource/2.0.0/linuxkernel-${KERNEL_VERSION}.tgz
KERNEL_PATCH = http://palm.cdnetworks.net/opensource/2.0.0/kernel_patches.tar.gz
KERNEL_SUBMISSION = patch-submission-54
endif
# Override the compiler
CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs09q1armel/build/arm-2009q1/bin/arm-none-linux-gnueabi-
endif

ifeq ("${WEBOS_VERSION}", "2.1.0")
ifeq ("${DEVICE}","pre")
KERNEL_PATCH = http://palm.cdnetworks.net/opensource/2.1.0/linuxkernel-2.6.24.preplus.2-1-0.patch.tgz
KERNEL_SUBMISSION = linuxkernel-2.6.24.patch
endif
ifeq ("${DEVICE}","pre2")
KERNEL_PATCH = http://palm.cdnetworks.net/opensource/2.1.0/linuxkernel-2.6.24.pre2.2-1-0.patch.tgz
KERNEL_SUBMISSION = linuxkernel-2.6.24.patch
endif
# Override the compiler
CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs09q1armel/build/arm-2009q1/bin/arm-none-linux-gnueabi-
endif

ifeq ("${WEBOS_VERSION}", "2.1.2")
ifeq ("${DEVICE}","veer")
KERNEL_SOURCE = http://palm.cdnetworks.net/opensource/2.1.1/linuxkernel-${KERNEL_VERSION}.tgz
KERNEL_PATCH  = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}.patch.tgz
KERNEL_SUBMISSION = linuxkernel-${KERNEL_VERSION}.patch/kerneldiffs-2.1.2.txt
# Override the compiler
CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs09q1armel/build/arm-2009q1/bin/arm-none-linux-gnueabi-
endif
endif

ifeq ("${WEBOS_VERSION}", "3.0.0")
ifeq ("${DEVICE}","touchpad")
KERNEL_PATCH  = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}.patch.tgz
KERNEL_SUBMISSION = kernelpatch-3.0.0.txt
# Override the compiler
CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs09q1armel/build/arm-2009q1/bin/arm-none-linux-gnueabi-
endif
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

DESCRIPTION=This package is not currently available for WebOS ${WEBOS_VERSION}.  This package may be installed as a placeholder to notify you when an update is available.  NOTE: This is simply an empty package placeholder, it will not affect your device in any way.
CHANGELOG=
CATEGORY=Unavailable
VISIBILITY=Installed
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
	${TAR} -C build/arm/usr/palm/applications/${APP_ID} -xvf ${DL_DIR}/headlessapp-${HEADLESSAPP_VERSION}.tar.gz
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
	sed -e 's|PID=|PID="${APP_ID}"|' \
			-e 's|UPSTART_SCRIPT=|UPSTART_SCRIPT="${UPSTART_SCRIPT}"|' \
			../../support/module.postinst > $@
	chmod ugo+x $@

build/%/CONTROL/prerm:
	mkdir -p build/arm/CONTROL
	sed -e 's|PID=|PID="${APP_ID}"|' \
			-e 's|UPSTART_SCRIPT=|UPSTART_SCRIPT="${UPSTART_SCRIPT}"|' \
			../../support/module.prerm > $@
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
	rm -rf build/arm
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
	${TAR} -O -x -f - ./nova-cust-image-${CODENAME}.rootfs.tar.gz | \
	${TAR} -C build/arm/usr/palm/applications/${APP_ID}/additional_files/ --wildcards -m -z -x -f - ./md5sums*
	if [ -f build/arm/usr/palm/applications/${APP_ID}/additional_files/md5sums.gz ] ; then \
	  gunzip -f build/arm/usr/palm/applications/${APP_ID}/additional_files/md5sums.gz ; \
	fi
	if [ -n "${KERNEL_UPSTART}" ] ; then \
		mkdir -p build/arm/usr/palm/applications/${APP_ID}/additional_files/var/palm/event.d ; \
		install -m 755 build/src-$*/patches/${KERNEL_UPSTART} \
			 build/arm/usr/palm/applications/${APP_ID}/additional_files/var/palm/event.d/${UPSTART_SCRIPT} ; \
	fi
	touch $@

build/.unpacked-%: ${DL_DIR}/linux-${KERNEL_VERSION}-${WEBOS_VERSION}-${DEVICE}.tar.gz \
			    ${DL_DIR}/${NAME}-%.tar.gz
	rm -rf build/src-$*
	mkdir -p build/src-$*/patches
	${TAR} -C build/src-$* -xf ${DL_DIR}/linux-${KERNEL_VERSION}-${WEBOS_VERSION}-${DEVICE}.tar.gz
	${TAR} -C build/src-$*/patches -xf ${DL_DIR}/${NAME}-$*.tar.gz
	if [ -n "${KERNEL_PATCHES}" ] ; then \
	  ( cd build/src-$*/patches ; cat ${KERNEL_PATCHES} > /dev/null ) || exit ; \
	  ( cd build/src-$*/patches ; cat ${KERNEL_PATCHES} ) | \
		patch -d build/src-$*/linux-${KERNEL_VERSION} -p1 ; \
	fi
	touch $@


${DL_DIR}/linux-${KERNEL_VERSION}-${WEBOS_VERSION}-${DEVICE}.tar.gz: \
					${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-${DEVICE}.tar.gz \
					${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-patch-${DEVICE}.gz
	rm -rf build/src-${VERSION}
	mkdir -p build/src-${VERSION}
	${TAR} -C build/src-${VERSION} -xf ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-${DEVICE}.tar.gz
	zcat ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-patch-${DEVICE}.gz | \
		patch -d build/src-${VERSION}/linux-${KERNEL_VERSION} -p1 
	yes '' | \
	${MAKE} -C build/src-${VERSION}/linux-${KERNEL_VERSION} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_arm} \
	${DEFCONFIG}
	${MAKE} -C build/src-${VERSION}/linux-${KERNEL_VERSION} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_arm} \
		KBUILD_BUILD_COMPILE_BY=v${WEBOS_VERSION} KBUILD_BUILD_COMPILE_HOST=${APP_ID} \
		uImage 
	${TAR} -C build/src-${VERSION} -zcf $@ linux-${KERNEL_VERSION}

${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-${DEVICE}.tar.gz:
	rm -f $@ $@.tmp
	mkdir -p ${DL_DIR}
	curl -f -R -L -o $@.tmp ${KERNEL_SOURCE}
	mv $@.tmp $@

ifdef KERNEL_SUBMISSION
${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-patch-${DEVICE}.gz:
	rm -f $@ $@.tmp
	mkdir -p ${DL_DIR}
	curl -f -R -L -o $@.tmp ${KERNEL_PATCH}
	tar -Oxvf $@.tmp ${KERNEL_SUBMISSION} | gzip -c > $@
	rm -f $@.tmp
else
${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-patch-${DEVICE}.gz:
	rm -f $@ $@.tmp
	mkdir -p ${DL_DIR}
	curl -f -R -L -o $@.tmp ${KERNEL_PATCH}
	mv $@.tmp $@
endif

endif

.PHONY: clobber
clobber::
	rm -rf build
