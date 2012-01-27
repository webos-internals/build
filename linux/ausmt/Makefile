TYPE = Linux Application
NAME = ausmt
VERSION = 1.2.1
TITLE = AUSMT Scripts
MAINTAINER = Janne Julkunen <scorpio.iix@gmail.com>
DESCRIPTION = AUSMT makes updating patches and themes safe even after OTA update. There still might be certain corner cases that can cause problems after OTA update, so if you want to avoid all problems its still recommended to uninstall patches and theme before OTA update.
CHANGELOG = 1.2.1: Small fix for logging.<br>1.2.0: Added system verification script.<br>1.1.3: Included missing recovery script.<br>1.1.2: Small fix for logging.<br>1.1.1: Important bug fix release.<br>1.0.0: Initial release.
APP_ID = org.webosinternals.${NAME}
SIGNER = org.webosinternals
HOMEPAGE = http://www.webos-internals.org/wiki/Auto-Update_System_Modification_Technology
MAINTAINER = WebOS Internals <support@webos-internals.org>
CATEGORY = Utilities
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png

SRC_GIT = git://github.com/webos-internals/ausmt.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk
include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/all
	mkdir -p build/all/usr/bin
	install -m 755 build/src/ausmt/ausmt-cleanup build/all/usr/bin/
	install -m 755 build/src/ausmt/ausmt-install build/all/usr/bin/
	install -m 755 build/src/ausmt/ausmt-remove build/all/usr/bin/
	install -m 755 build/src/ausmt/ausmt-verify build/all/usr/bin/
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
