TYPE = Patch
APP_ID = org.webosinternals.patches.${NAME}
HOMEPAGE = http://www.webos-internals.org/wiki/Portal:Patches_to_webOS
MAINTAINER = WebOS Internals <support@webos-internals.org>
DEPENDS = org.webosinternals.patch, org.webosinternals.diffstat
FEED = Autopatch
#POSTINSTALLFLAGS = RestartLuna
#POSTREMOVEFLAGS = RestartLuna

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk

.PHONY: unpack
unpack: build/.unpacked

.PHONY: build
build: build/.built

build/.meta-${META_VERSION}:
	touch $@

build/.built: build/.unpacked build/.meta-${META_VERSION}
	rm -rf build/all
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	install -m 644 build/src/${PATCH} build/all/usr/palm/applications/${APP_ID}/
	touch $@

build/all/CONTROL/prerm: build/.unpacked
	mkdir -p build/all/CONTROL
	cp ../prerm build/all/CONTROL/prerm
	sed -i -e 's|PATCH_NAME=|PATCH_NAME=$(shell basename ${PATCH})|' build/all/CONTROL/prerm
	sed -i -e 's|APP_DIR=|APP_DIR=/var/usr/palm/applications/${APP_ID}|' build/all/CONTROL/prerm
	chmod ugo+x $@

build/all/CONTROL/postinst: build/.unpacked
	mkdir -p build/all/CONTROL
	cp ../postinst build/all/CONTROL/postinst
	sed -i -e 's|PATCH_NAME=|PATCH_NAME=$(shell basename ${PATCH})|' build/all/CONTROL/postinst
	sed -i -e 's|APP_DIR=|APP_DIR=/var/usr/palm/applications/${APP_ID}|' build/all/CONTROL/postinst
	chmod ugo+x $@

.PHONY: clobber
clobber::
	rm -rf build

include ../../support/package.mk

