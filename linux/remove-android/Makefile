NAME = remove-android
TITLE = Remove Android
APP_ID = org.webosinternals.${NAME}
SIGNER = org.webosinternals
VERSION = 1.0.2
TYPE = Linux Application
DEVICECOMPATIBILITY = [\"TouchPad\"]
CATEGORY = Utilities
MAINTAINER = WebOS Internals <support@webos-internals.org>
HOMEPAGE = http://www.webos-internals.org/wiki/Remove_Android
ICON = http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png
DESCRIPTION = Install this package to remove all files related to Android and moboot (and any other non-webOS boot images) from the /boot partition.  Use the Tailor application to remove the other Android partitions.
CHANGELOG = \
1.0.2: Set DeviceCompatibility to TouchPad only.<br>\
1.0.1: Clarified exactly what is removed.<br>\
1.0.0: Initial release.

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk
include ../../support/download.mk


.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}:
	rm -rf build
	mkdir -p build
	touch $@

build/all/CONTROL/postinst: build/.unpacked-${VERSION}
	mkdir -p build/all/CONTROL
	cp postinst build/all/CONTROL/postinst
	chmod ugo+x $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/all
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
