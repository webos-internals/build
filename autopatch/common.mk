TYPE = Patch
APP_ID = org.webosinternals.patches.${NAME}
HOMEPAGE = http://www.webos-internals.org/wiki/Portal:Patches_to_webOS
MAINTAINER = WebOS Internals <support@webos-internals.org>
DEPENDS = org.webosinternals.patch, org.webosinternals.diffstat
FEED = WebOS Patches
LICENSE = MIT License Open Source
VERSION = ${WEBOS_VERSION}-${IPKG_VERSION}
META_GLOBAL_VERSION = 1
#POSTINSTALLFLAGS = RestartLuna
#POSTREMOVEFLAGS = RestartLuna
ifneq ("${META_SUB_VERSION}","")
META_VERSION = ${META_GLOBAL_VERSION}-${META_SUB_VERSION}
else
META_VERSION = ${META_GLOBAL_VERSION}
endif

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

.PHONY: build
build: build/.built-${VERSION}

build/.meta-${META_VERSION}:
	touch $@

build/.built-${VERSION}: build/.unpacked-${VERSION} build/.meta-${META_VERSION}
	rm -rf build/all
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	install -m 644 build/src-${VERSION}/${PATCH} build/all/usr/palm/applications/${APP_ID}/
	touch $@

build/all/CONTROL/prerm: build/.unpacked-${VERSION}
	mkdir -p build/all/CONTROL
	cp ../prerm build/all/CONTROL/prerm
	sed -i -e 's|PATCH_NAME=|PATCH_NAME=$(shell basename ${PATCH})|' build/all/CONTROL/prerm
	sed -i -e 's|APP_DIR=|APP_DIR=/var/usr/palm/applications/${APP_ID}|' build/all/CONTROL/prerm
	chmod ugo+x $@

build/all/CONTROL/postinst: build/.unpacked-${VERSION}
	mkdir -p build/all/CONTROL
	cp ../postinst build/all/CONTROL/postinst
	sed -i -e 's|PATCH_NAME=|PATCH_NAME=$(shell basename ${PATCH})|' build/all/CONTROL/postinst
	sed -i -e 's|APP_DIR=|APP_DIR=/var/usr/palm/applications/${APP_ID}|' build/all/CONTROL/postinst
	chmod ugo+x $@

.PHONY: clobber
clobber::
	rm -rf build

include ../../support/package.mk

