.NOTPARALLEL:

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
WEBOS_VERSIONS = 2.1.0 2.2.4
KERNEL_VERSION = 2.6.24
endif
ifeq ("${DEVICE}","veer")
WEBOS_VERSIONS = 2.1.1 2.1.2
KERNEL_VERSION = 2.6.29
endif
ifeq ("${DEVICE}","touchpad")
WEBOS_VERSIONS = 3.0.2 3.0.4
KERNEL_VERSION = 2.6.35
endif
ifeq ("${DEVICE}","pre3")
WEBOS_VERSIONS = 2.2.0 2.2.3
KERNEL_VERSION = 2.6.32
endif
ifeq ("${DEVICE}","opal")
WEBOS_VERSIONS = 3.0.3
KERNEL_VERSION = 2.6.35
endif
KERNEL_SOURCE = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}.tgz
DL_DIR = ../../downloads
POSTINSTALLFLAGS = RestartDevice
POSTUPDATEFLAGS  = RestartDevice
POSTREMOVEFLAGS  = RestartDevice
UPSTART_SCRIPT=$(shell basename ${APP_ID} ${SUFFIX})

HEADLESSAPP_VERSION = 0.2.0

KERNEL_DISCLAIMER = WebOS Internals provides this program as is without warranty of any kind, either expressed or implied, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose.  The entire risk as to the quality and performance of this program is with you.  Should this program prove defective, you assume the cost of all necessary servicing, repair or correction.<br>\
In no event will WebOS Internals or any other party be liable to you for damages, including any general, special, incidental or consequential damages arising out of the use or inability to use this program (including but not limited to loss of data or data being rendered inaccurate or losses sustained by you or third parties or a failure of this program to operate with any other programs).

ifeq ($(shell uname -s),Darwin)
TAR	= gnutar
ZCAT	= gzcat
else
TAR	= tar
ZCAT	= zcat
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
KERNEL_TYPE = 2.6.24-palm-joplin-3430
DEVICECOMPATIBILITY = [\"Pre\"]
endif
ifeq ("${DEVICE}","pixi")
CODENAME = pixie
DEFCONFIG = chuck_defconfig
KERNEL_TYPE = 2.6.24-palm-chuck
DEVICECOMPATIBILITY = [\"Pixi\"]
endif
ifeq ("${DEVICE}","pre2")
CODENAME = roadrunner
DEFCONFIG = omap_sirloin_3630_defconfig
KERNEL_TYPE = 2.6.24-palm-joplin-3430
DEVICECOMPATIBILITY = [\"Pre2\"]
endif
ifeq ("${DEVICE}","veer")
CODENAME = broadway
DEFCONFIG = shank_defconfig
KERNEL_TYPE = 2.6.29-palm-shank
DEVICECOMPATIBILITY = [\"Veer\"]
endif
ifeq ("${DEVICE}","touchpad")
CODENAME = topaz
DEFCONFIG = tenderloin_defconfig
KERNEL_TYPE = 2.6.35-palm-tenderloin
DEVICECOMPATIBILITY = [\"TouchPad\"]
endif
ifeq ("${DEVICE}","pre3")
CODENAME = mantaray
DEFCONFIG = rib_defconfig
KERNEL_TYPE = 2.6.32.9-palm-rib
DEVICECOMPATIBILITY = [\"Pre3\"]
endif
ifeq ("${DEVICE}","opal")
CODENAME = opal
DEFCONFIG = shortloin_defconfig
KERNEL_TYPE = 2.6.35-palm-shortloin
DEVICECOMPATIBILITY = [\"Opal\"]
endif

ifeq ("${DEVICE}","pre")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp100ueu-wr-${WEBOS_VERSION}.jar
ifeq ("${WEBOS_VERSION}", "1.4.5.1")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp101ewwverizonwireless-${WEBOS_VERSION}.jar
endif
ifeq ("${WEBOS_VERSION}", "2.1.0")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp101ueu-wr-${WEBOS_VERSION}.jar
endif
endif
ifeq ("${DEVICE}","pixi")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp121ewweu-wr-${WEBOS_VERSION}.jar
ifeq ("${WEBOS_VERSION}", "1.4.5.1")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp121ewwverizonwireless-${WEBOS_VERSION}.jar
endif
endif
ifeq ("${DEVICE}","pre2")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp102ueuna-wr-${WEBOS_VERSION}.jar
ifeq ("${WEBOS_VERSION}", "2.0.0")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp103ueu-wr-${WEBOS_VERSION}.jar
endif
ifeq ("${WEBOS_VERSION}", "2.1.0")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp103ueuna-wr-${WEBOS_VERSION}.jar
endif
ifeq ("${WEBOS_VERSION}", "2.2.4")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp224pre2-wr-${WEBOS_VERSION}.jar
endif
endif
ifeq ("${DEVICE}","pre3")
ifeq ("${WEBOS_VERSION}", "2.2.0")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp220manta-wr-${WEBOS_VERSION}.jar
endif
ifeq ("${WEBOS_VERSION}", "2.2.3")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp223mantaatt-${WEBOS_VERSION}.jar
endif
ifeq ("${WEBOS_VERSION}", "2.2.4")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp224manta-wr-${WEBOS_VERSION}.jar
endif
endif
ifeq ("${DEVICE}","veer")
ifeq ("${WEBOS_VERSION}", "2.1.1")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp160una-wr-${WEBOS_VERSION}.jar
endif
ifeq ("${WEBOS_VERSION}", "2.1.2")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp160unaatt-${WEBOS_VERSION}.jar
endif
endif
ifeq ("${DEVICE}","touchpad")
ifeq ("${WEBOS_VERSION}", "3.0.0")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp300hstnhwifi-${WEBOS_VERSION}.jar
endif
ifeq ("${WEBOS_VERSION}", "3.0.2")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp302hstnhwifi-${WEBOS_VERSION}.jar
endif
ifeq ("${WEBOS_VERSION}", "3.0.4")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp304hstnhwifi-${WEBOS_VERSION}.jar
endif
ifeq ("${WEBOS_VERSION}", "3.0.5")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp305hstnhwifi-${WEBOS_VERSION}.jar
endif
endif
ifeq ("${DEVICE}","opal")
ifeq ("${WEBOS_VERSION}", "3.0.3")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctoropal3g-wr-${WEBOS_VERSION}.jar
endif
endif
COMPATIBLE_VERSIONS = ${WEBOS_VERSION}

ifeq ("${WEBOS_VERSION}", "1.4.5")
KERNEL_PATCH  = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}-patch\(${DEVICE}\).gz
endif

ifeq ("${WEBOS_VERSION}", "1.4.5.1")
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
COMPATIBLE_VERSIONS = 2.1.0 | 2.2.4
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

ifeq ("${WEBOS_VERSION}", "2.1.1")
ifeq ("${DEVICE}","veer")
COMPATIBLE_VERSIONS = 2.1.1
KERNEL_PATCH  = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}.patch.tgz
KERNEL_SUBMISSION = linuxkernel-${KERNEL_VERSION}.patch/kerneldiffs.txt
# Override the compiler
CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs09q1armel/build/arm-2009q1/bin/arm-none-linux-gnueabi-
endif
endif

ifeq ("${WEBOS_VERSION}", "2.1.2")
ifeq ("${DEVICE}","veer")
COMPATIBLE_VERSIONS = 2.1.2 | 2.2.1
KERNEL_PATCH  = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}.patch.tgz
KERNEL_SUBMISSION = linuxkernel-${KERNEL_VERSION}.patch/kerneldiffs.txt
# Override the compiler
CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs09q1armel/build/arm-2009q1/bin/arm-none-linux-gnueabi-
endif
endif

ifeq ("${WEBOS_VERSION}", "2.2.0")
ifeq ("${DEVICE}","pre3")
COMPATIBLE_VERSIONS = 2.2.0
KERNEL_SOURCE = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}.tar.gz
KERNEL_PATCH  = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}.patch.tar.gz
KERNEL_SUBMISSION = kernelpatch-2.2.0.txt
# Override the compiler
CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs09q1armel/build/arm-2009q1/bin/arm-none-linux-gnueabi-
endif
endif

ifeq ("${WEBOS_VERSION}", "2.2.3")
ifeq ("${DEVICE}","pre3")
COMPATIBLE_VERSIONS = 2.2.3
KERNEL_SOURCE = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}.tar.gz
KERNEL_PATCH  = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}.patch.tar.gz
KERNEL_SUBMISSION = kernelpatches-2.2.3.txt
# Override the compiler
CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs09q1armel/build/arm-2009q1/bin/arm-none-linux-gnueabi-
endif
endif

ifeq ("${WEBOS_VERSION}", "2.2.4")
ifeq ("${DEVICE}","pre2")
COMPATIBLE_VERSIONS = 2.2.4
# KERNEL_SOURCE = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}.tar.gz
KERNEL_SOURCE = http://palm.cdnetworks.net/opensource/2.1.0/linuxkernel-${KERNEL_VERSION}.tar.gz
KERNEL_PATCH  = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/kernelpatch-${WEBOS_VERSION}-${DEVICE}.tgz
KERNEL_SUBMISSION = kernel-${WEBOS_VERSION}.txt
endif
ifeq ("${DEVICE}","pre3")
COMPATIBLE_VERSIONS = 2.2.4
# KERNEL_SOURCE = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}.tar.gz
KERNEL_SOURCE = http://palm.cdnetworks.net/opensource/2.2.3/linuxkernel-${KERNEL_VERSION}.tar.gz
KERNEL_PATCH  = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/kernelpatch-${WEBOS_VERSION}-${DEVICE}.tgz
KERNEL_SUBMISSION = kernel-${WEBOS_VERSION}.txt
endif
# Override the compiler
CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs09q1armel/build/arm-2009q1/bin/arm-none-linux-gnueabi-
endif

ifeq ("${WEBOS_VERSION}", "3.0.0")
ifeq ("${DEVICE}","touchpad")
COMPATIBLE_VERSIONS = 3.0.0
KERNEL_PATCH  = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}.patch.tgz
KERNEL_SUBMISSION = kernelpatch-3.0.0.txt
# Override the compiler
CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs09q1armel/build/arm-2009q1/bin/arm-none-linux-gnueabi-
endif
endif

ifeq ("${WEBOS_VERSION}", "3.0.2")
ifeq ("${DEVICE}","touchpad")
COMPATIBLE_VERSIONS = 3.0.2
KERNEL_PATCH  = http://palm.cdnetworks.net/opensource/3.0.2/linuxkernel-${KERNEL_VERSION}.patches.tgz
KERNEL_SUBMISSION = kernelpatch-3.0.2.txt
# Override the compiler
CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs09q1armel/build/arm-2009q1/bin/arm-none-linux-gnueabi-
endif
endif

ifeq ("${WEBOS_VERSION}", "3.0.3")
ifeq ("${DEVICE}","opal")
COMPATIBLE_VERSIONS = 3.0.3
KERNEL_GIT = git@github.com:webos-internals/webos-linux-kernel.git
KERNEL_TAG = opal
# Override the compiler
CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs09q1armel/build/arm-2009q1/bin/arm-none-linux-gnueabi-
endif
endif

ifeq ("${WEBOS_VERSION}", "3.0.4")
ifeq ("${DEVICE}","touchpad")
COMPATIBLE_VERSIONS = 3.0.4
KERNEL_PATCH  = http://palm.cdnetworks.net/opensource/3.0.4/linuxkernel-${KERNEL_VERSION}.patches.tgz
KERNEL_SUBMISSION = kernel-3.0.4.txt
# Override the compiler
CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs09q1armel/build/arm-2009q1/bin/arm-none-linux-gnueabi-
endif
endif

ifeq ("${WEBOS_VERSION}", "3.0.5")
ifeq ("${DEVICE}","touchpad")
COMPATIBLE_VERSIONS = 3.0.5
KERNEL_PATCH  = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}.patch.tar.gz
KERNEL_SUBMISSION = kernel-3.0.5.txt
# Override the compiler
CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs09q1armel/build/arm-2009q1/bin/arm-none-linux-gnueabi-
endif
endif

.PHONY: package build unpack

ifneq ("${VERSIONS}", "")
package: 
	for v in ${WEBOS_VERSIONS} ; do \
		VERSION=$${v}-0 ${MAKE} VERSIONS= WEBOS_VERSION=$${v} DUMMY_VERSION=0 package ; \
	done; \
	for v in ${VERSIONS} ; do \
		VERSION=$${v} ${MAKE} VERSIONS= WEBOS_VERSION=`echo $${v} | cut -d- -f1` package ; \
	done

build: 
	for v in ${VERSIONS} ; do \
		VERSION=$${v} ${MAKE} VERSIONS= WEBOS_VERSION=`echo $${v} | cut -d- -f1` build ; \
	done

unpack: 
	for v in ${VERSIONS} ; do \
		VERSION=$${v} ${MAKE} VERSIONS= WEBOS_VERSION=`echo $${v} | cut -d- -f1` unpack ; \
	done
else
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk

build: build/.built-${VERSION}
.PRECIOUS: build/.built-${VERSION}

unpack: build/.unpacked-${VERSION}
.PRECIOUS: build/.unpacked-${VERSION}
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
	echo "\"uiRevision\": 2," >> build/arm/usr/palm/applications/${APP_ID}/appinfo.json
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
		${KERNEL_IMAGE} ${KERNEL_MODULES} modules
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
		modules ; \
	      ${MAKE} -C $(shell pwd)/build/src-$*/patches/$$module ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_arm} \
		KERNEL_BUILD_PATH=$(shell pwd)/build/src-$*/linux-${KERNEL_VERSION} DEVICE=${DEVICE} \
		INSTALL_MOD_PATH=$(shell pwd)/build/arm/usr/palm/applications/${APP_ID}/additional_files \
		modules_install ) ; \
	  done \
	fi
	if [ -n "${EXTRA_MODULES}" ] ; then \
	  for module in ${EXTRA_MODULES} ; do \
	    ( cd $(shell pwd)/build/arm/usr/palm/applications/${APP_ID}/additional_files/lib/modules/${KERNEL_TYPE} ; \
	      mkdir -p ./extra ; mv $$module ./extra/ ) ; \
	  done ; \
	fi
	rm -f build/arm/usr/palm/applications/${APP_ID}/additional_files/lib/modules/${KERNEL_TYPE}/build
	rm -f build/arm/usr/palm/applications/${APP_ID}/additional_files/lib/modules/${KERNEL_TYPE}/source
	rm -f build/arm/usr/palm/applications/${APP_ID}/additional_files/lib/modules/${KERNEL_TYPE}/*.bin
	rm -f build/arm/usr/palm/applications/${APP_ID}/additional_files/lib/modules/${KERNEL_TYPE}/modules.*
	if [ -n "${KERNEL_IMAGE}" ]; then \
		cp build/src-$*/linux-${KERNEL_VERSION}/arch/arm/boot/uImage \
			build/arm/usr/palm/applications/${APP_ID}/additional_files/boot/uImage-${KERNEL_TYPE}; \
		cp build/src-$*/linux-${KERNEL_VERSION}/System.map \
			build/arm/usr/palm/applications/${APP_ID}/additional_files/boot/System.map-${KERNEL_TYPE}; \
		cp build/src-$*/linux-${KERNEL_VERSION}/.config \
			build/arm/usr/palm/applications/${APP_ID}/additional_files/boot/config-${KERNEL_TYPE}; \
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

ifeq ("${DEVICE}","touchpad")
# Special case for 3.0.6 based on 3.0.5 kernel source
build/.unpacked-3.0.6-%: ${DL_DIR}/linux-${KERNEL_VERSION}-3.0.5-${DEVICE}.tar.gz \
			    ${DL_DIR}/${NAME}-3.0.6-%.tar.gz
	rm -rf build/src-3.0.6-$*
	mkdir -p build/src-3.0.6-$*/patches
	${TAR} -C build/src-3.0.6-$* -zxf ${DL_DIR}/linux-${KERNEL_VERSION}-3.0.5-${DEVICE}.tar.gz
	${TAR} -C build/src-3.0.6-$*/patches -zxf ${DL_DIR}/${NAME}-3.0.6-$*.tar.gz
	if [ -n "${KERNEL_PATCHES}" ] ; then \
	  ( cd build/src-3.0.6-$*/patches ; cat ${KERNEL_PATCHES} > /dev/null ) || exit ; \
	  ( cd build/src-3.0.6-$*/patches ; cat ${KERNEL_PATCHES} ) | \
		patch -d build/src-3.0.6-$*/linux-${KERNEL_VERSION} -p1 ; \
	fi
	touch $@
endif

ifdef SRC_GIT
build/.unpacked-%: ${DL_DIR}/linux-${KERNEL_VERSION}-${WEBOS_VERSION}-${DEVICE}.tar.gz \
			    ${DL_DIR}/${NAME}-%.tar.gz
	rm -rf build/src-$*
	mkdir -p build/src-$*/patches
	${TAR} -C build/src-$* -zxf ${DL_DIR}/linux-${KERNEL_VERSION}-${WEBOS_VERSION}-${DEVICE}.tar.gz
	${TAR} -C build/src-$*/patches -zxf ${DL_DIR}/${NAME}-$*.tar.gz
	if [ -n "${KERNEL_PATCHES}" ] ; then \
	  ( cd build/src-$*/patches ; cat ${KERNEL_PATCHES} > /dev/null ) || exit ; \
	  ( cd build/src-$*/patches ; cat ${KERNEL_PATCHES} ) | \
		patch -d build/src-$*/linux-${KERNEL_VERSION} -p1 ; \
	fi
	touch $@
else
ifdef KERNEL_GIT
build/.unpacked-%:
	if [ ! -e git ] ; then \
	  git clone --mirror -n ${KERNEL_GIT} git ; \
	elif [ -L git ] ; then \
	  true ; \
	else \
	  ( cd git ; git fetch -u -t ) ; \
	fi
	rm -rf build/src-${VERSION}
	mkdir -p build/src-${VERSION}
	( cd build/src-${VERSION} ; git clone -l ../../git linux-${KERNEL_VERSION} )
	( cd build/src-${VERSION}/linux-${KERNEL_VERSION} ; git checkout ${KERNEL_TAG} )
	touch $@
else
build/.unpacked-%: ${DL_DIR}/linux-${KERNEL_VERSION}-${WEBOS_VERSION}-${DEVICE}.tar.gz
	rm -rf build/src-$*
	mkdir -p build/src-$*
	${TAR} -C build/src-$* -zxf ${DL_DIR}/linux-${KERNEL_VERSION}-${WEBOS_VERSION}-${DEVICE}.tar.gz
	touch $@
endif
endif

${DL_DIR}/linux-${KERNEL_VERSION}-${WEBOS_VERSION}-${DEVICE}.tar.gz: \
					${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-${DEVICE}.tar.gz \
					${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-patch-${DEVICE}.gz
	rm -rf build/src-${VERSION}
	mkdir -p build/src-${VERSION}
	${TAR} -C build/src-${VERSION} -zxf ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-${DEVICE}.tar.gz
	${ZCAT} ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-patch-${DEVICE}.gz | \
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
	rm -f $@ $@.tmp1 $@.tmp2
	mkdir -p ${DL_DIR}
	curl -f -R -L -o $@.tmp1 ${KERNEL_PATCH}
	tar -Oxvf $@.tmp1 ${KERNEL_SUBMISSION} | gzip -c > $@.tmp2
	rm -f $@.tmp1
	mv $@.tmp2 $@
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
