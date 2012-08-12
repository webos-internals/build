.NOTPARALLEL:

SIGNER = org.webosinternals
MAINTAINER = WebOS Ports
ICON = http://www.webos-internals.org/images/2/2c/LunaCommunityEdition.png
DEPENDS = 
FEED = WebOS Ports
LICENSE = Apache Open Source
ifeq ("${DEVICE}","touchpad")
WEBOS_VERSION = 3.0.5
endif
DL_DIR = ../../downloads
POSTINSTALLFLAGS = RestartLuna
POSTUPDATEFLAGS  = RestartLuna
POSTREMOVEFLAGS  = RestartLuna
UPSTART_SCRIPT=LunaSysMgr

HEADLESSAPP_VERSION = 0.2.0

KERNEL_DISCLAIMER = WebOS Internals and WebOS Ports provides this program as is without warranty of any kind, either expressed or implied, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose.  The entire risk as to the quality and performance of this program is with you.  Should this program prove defective, you assume the cost of all necessary servicing, repair or correction.<br>\
In no event will WebOS Internals, WebOS Ports or any other party be liable to you for damages, including any general, special, incidental or consequential damages arising out of the use or inability to use this program (including but not limited to loss of data or data being rendered inaccurate or losses sustained by you or third parties or a failure of this program to operate with any other programs).

ifeq ($(shell uname -s),Darwin)
TAR	= gnutar
ZCAT	= gzcat
else
TAR	= tar
ZCAT	= zcat
endif

PREWARE_SANITY =
ifneq ("$(TYPE)","OS Application")
ifneq ("$(TYPE)","OS Daemon")
PREWARE_SANITY += $(error "Please define TYPE as OS Application or OS Daemon in your Makefile")
endif
endif

APP_ID = org.webosports.${NAME}

ifeq ("${DEVICE}","touchpad")
CODENAME = topaz
DEVICECOMPATIBILITY = [\"TouchPad\"]
endif

ifeq ("${DEVICE}","touchpad")
ifeq ("${WEBOS_VERSION}", "3.0.5")
WEBOS_DOCTOR = ${DOCTOR_DIR}/webosdoctorp305hstnhwifi-${WEBOS_VERSION}.jar
endif
endif
COMPATIBLE_VERSIONS = ${WEBOS_VERSION}

.PHONY: package build unpack

ifneq ("${VERSIONS}", "")
package: 
	for v in ${VERSIONS} ; do \
		VERSION=$${v} ${MAKE} VERSIONS= package ; \
	done

build: 
	for v in ${VERSIONS} ; do \
		VERSION=$${v} ${MAKE} VERSIONS= build ; \
	done

unpack: 
	for v in ${VERSIONS} ; do \
		VERSION=$${v} ${MAKE} VERSIONS= unpack ; \
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
	cp ../../support/woce.png build/arm/usr/palm/applications/${APP_ID}/icon.png
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

build/%/CONTROL/postinst:
	mkdir -p build/arm/CONTROL
	sed -e 's/PID=/PID="${APP_ID}"/' -e 's/FORCE_INSTALL=/FORCE_INSTALL="${FORCE_INSTALL}"/' \
	    -e 's/%COMPATIBLE_VERSIONS%/${COMPATIBLE_VERSIONS}/' \
	    -e 's|%UPSTART_SCRIPT%|${UPSTART_SCRIPT}|' \
		../../support/woce.postinst > $@
	chmod ugo+x $@

build/%/CONTROL/prerm:
	mkdir -p build/arm/CONTROL
	sed -e 's/PID=/PID="${APP_ID}"/' -e 's/FORCE_REMOVE=/FORCE_REMOVE="${FORCE_REMOVE}"/' \
	    -e 's/%COMPATIBLE_VERSIONS%/${COMPATIBLE_VERSIONS}/' \
	    -e 's|%UPSTART_SCRIPT%|${UPSTART_SCRIPT}|' \
		../../support/woce.prerm > $@
	chmod ugo+x $@

build/arm.built-%: build/.unpacked-% ${WEBOS_DOCTOR}
	rm -rf build/arm
	unzip -p ${WEBOS_DOCTOR} resources/webOS.tar | \
	${TAR} -O -x -f - ./nova-cust-image-${CODENAME}.rootfs.tar.gz | \
	${TAR} -C build/arm/usr/palm/applications/${APP_ID}/additional_files/ --wildcards -m -z -x -f - ./md5sums*
	if [ -f build/arm/usr/palm/applications/${APP_ID}/additional_files/md5sums.gz ] ; then \
	  gunzip -f build/arm/usr/palm/applications/${APP_ID}/additional_files/md5sums.gz ; \
	fi
	touch $@

endif

.PHONY: clobber
clobber::
	rm -rf build
