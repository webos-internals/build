TYPE = Linux Application
NAME = emergency-mimetable-reset
VERSION = 1.0.0
TITLE = Emergency MimeTable Reset
MAINTAINER = WebOS Internals <support@webos-internals.org>
DESCRIPTION = Install this package on your webOS device to clear the MimeType mapping table.  Make sure you reboot the device immediately afterwards, and then reinstall any applications that add to the MimeTable.
APP_ID = org.webosinternals.${NAME}
SIGNER = org.webosinternals
MAINTAINER = WebOS Internals
CATEGORY = Utilities
ICON = http://www.webos-internals.org/images/4/4f/Epr.png
POSTINSTALLFLAGS = RestartDevice

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
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
