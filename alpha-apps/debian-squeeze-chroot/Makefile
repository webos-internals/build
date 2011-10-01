NAME     = debian-squeeze-chroot
TITLE    = Debian 6.0.2 Chroot
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
MAINTAINER = pezman726 <pezman726@gmail.com>
BLDFLAGS = -p
VERSION  = 6.0.2-7
TYPE	 = Linux Application
CATEGORY = Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/DebianChroot
ICON	 = http://www.webos-internals.org/images/2/24/Icon_WebOSInternals_Debian.png
DESCRIPTION = ${APPINFO_DESCRIPTION}
APPINFO_DESCRIPTION = A minimal Debian 6.0.2 chroot that works on ARMv6 and ARMv7 CPUs. Requires a dedicated ext3fs partition to be set up using the WebOS Internals Meta-Doctor.
CHANGELOG = \
6.0.2-7 Added hostname support ('hostname'-Ubuntu), Copy /etc/hosts to chroot<br>\
6.0.2-6: Added support for starting multiple applications in separate cards.<br>\
6.0.2-5: Move to an event based start.<br>\
6.0.2-4: Added multi-card support.<br>\
6.0.2-3: Change mount -t to --bind for /proc and /dev/pts.<br>\
6.0.2-2: Check that the ext3fs is mounted before installing. Add a non-privileged webos user in the chroot.<br>\
6.0.2-1: Initial testing release.
APPINFO_CHANGELOG = [ \
{ "version" : "6.0.2-7",  "log" : [ "Added hostname support ('hostname'-Ubuntu)","Copy /etc/hosts to chroot" ] },\
{ "version" : "6.0.2-6",  "log" : [ "Added support for starting multiple applications in separate cards." ] },\
{ "version" : "6.0.2-5",  "log" : [ "Move to an event based start." ] },\
{ "version" : "6.0.2-4",  "log" : [ "Added multi-card support." ] },\
{ "version" : "6.0.2-3",  "log" : [ "Change mount -t to --bind for /proc and /dev/pts" ] }, \
{ "version" : "6.0.2-2",  "log" : [ "Check that the ext3fs is mounted before installing", "Add a non-privileged webos user in the chroot" ] }, \
{ "version" : "6.0.2-1",  "log" : [ "Initial testing release" ] } \
]

SCREENSHOTS = [\
 ]
LICENSE  = GPL v2 Open Source

include ../../support/download.mk

HEADLESSAPP_VERSION = 0.2.0

include ../../support/headlessapp.mk

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk # ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}:
	rm -rf build
	mkdir -p build
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/arm.built-${VERSION} # build/i686.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/${NAME}.tgz:
	rm -f build/${NAME}.tgz
	if [ -f ${NAME}.tgz ] ; then \
	  ln -s ../${NAME}.tgz build/${NAME}.tgz ; \
	else \
	  ( cd build ; ../rootstock --no-root --fqdn ${NAME} --dist squeeze --mirror http://ftp.us.debian.org/debian/ --components main contrib) ; \
	  mv build/armel-rootfs*.tgz build/${NAME}.tgz ; \
	fi

build/%.built-${VERSION}: build/.unpacked-${VERSION} build/${NAME}.tgz ${DL_DIR}/headlessapp-${HEADLESSAPP_VERSION}.tar.gz
	rm -rf build/$*
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	tar -C build/$*/usr/palm/applications/${APP_ID} -xf ${DL_DIR}/headlessapp-${HEADLESSAPP_VERSION}.tar.gz
	rm -rf build/$*/usr/palm/applications/${APP_ID}/.git
	install -m 644 build/${NAME}.tgz build/$*/usr/palm/applications/${APP_ID}/${NAME}.tgz 
	install -m 644 icon.png build/$*/usr/palm/applications/${APP_ID}/icon.png
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/upstart
	install -m 644 upstart/${APP_ID} build/$*/usr/palm/applications/${APP_ID}/upstart/
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	install -m 755 bin/*.sh build/$*/usr/palm/applications/${APP_ID}/bin/
	echo "{" > build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"title\": \"${TITLE}\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"id\": \"${APP_ID}\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"version\": \"${VERSION}\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"vendor\": \"WebOS Internals\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"type\": \"web\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"main\": \"index.html\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"icon\": \"icon.png\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
ifdef APPINFO_DESCRIPTION
	echo '"message": "${APPINFO_DESCRIPTION}",' >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
endif
ifdef APPINFO_CHANGELOG
	echo '"changeLog": ${APPINFO_CHANGELOG},' >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
endif
	echo '"uiRevision": "2",' >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"noWindow\": true" >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "}" >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	touch $@

clobber::
	rm -rf build
