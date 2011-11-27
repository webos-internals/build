TYPE = Linux Application
NAME = emergency-filecache-wipe
VERSION = 1.1.0
TITLE = Emergency Filecache Wipe
MAINTAINER = WebOS Internals <support@webos-internals.org>
DESCRIPTION = Install this package on your webOS device to completely clear the file cache on your device.  Make sure you reboot the device immediately afterwards. All emails, attachments, contact photos and media thumbnails will be downloaded again or recreated over a period of time. The Pivot magazine issue for the current month will be lost but will update to the latest edition over a period of time.
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
