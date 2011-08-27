NAME     = ubuntu-natty-chroot
TITLE    = Ubuntu 11.04 Chroot
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 11.04-3
TYPE	 = Linux Application
CATEGORY = Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/UbuntuChroot
ICON	 = http://www.webos-internals.org/images/5/5e/Icon_WebOSInternals_Ubuntu.png
DESCRIPTION = ${APPINFO_DESCRIPTION}
APPINFO_DESCRIPTION = A minimal Ubuntu 11.04 chroot. Requires a dedicated ext3fs partition to be set up using the WebOS Internals Meta-Doctor.
CHANGELOG = \
11.04-4: Check that the ext3fs is mounted before installing. Add a non-privileged webos user in the chroot.<br>\
11.04-3: Fixed pre-remove script.<br>\
11.04-2: Initial testing release.
APPINFO_CHANGELOG = [ \
{ "version" : "11.04-4",  "log" : [ "Check that the ext3fs is mounted before installing", "Add a non-privileged webos user in the chroot" ] }, \
{ "version" : "11.04-3",  "log" : [ "Fixed pre-remove script" ] }, \
{ "version" : "11.04-2",  "log" : [ "Initial testing release" ] } \
]

SCREENSHOTS = [\
 ]
LICENSE  = GPL v2 Open Source

# Also requires upstart changes from:
# http://gyp.blogs.balabit.com/2011/01/using-upstart-in-a-chroot/
# http://git.balabit.hu/?p=gyp/upstart-dummy.git;a=summary

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
	( cd build ; rootstock --no-root --fqdn ${NAME} --dist natty )
	mv build/armel-rootfs*.tgz build/${NAME}.tgz

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
	echo "\"noWindow\": true" >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "}" >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	touch $@

clobber::
	rm -rf build
