TYPE = Linux Application
NAME = emergency-reconstruction-utility
VERSION = 1.0.0
TITLE = Emergency Reconstruction Utility
MAINTAINER = WebOS Internals <support@webos-internals.org>
DESCRIPTION = Install this package on your Pre to reconstruct the ipkg status file in the event that it has been corrupted.  The symptom of a corrupted status file is Preware suddenly not noticing some or all installed packages.  NOTE: If the symptom occurs directly after an OTA update to 1.3.5.x WebOS, you should install Emergency Migration Helper.
APP_ID = org.webosinternals.${NAME}
MAINTAINER = WebOS Internals
CATEGORY = Utilities
ICON = http://www.webos-internals.org/images/4/4f/Epr.png

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk
include ../../support/download.mk


.PHONY: unpack
unpack: build/.unpacked

build/.unpacked:
	rm -rf build
	mkdir -p build
	touch $@

build/all/CONTROL/postinst: build/.unpacked
	mkdir -p build/all/CONTROL
	cp postinst build/all/CONTROL/postinst
	chmod ugo+x $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/.unpacked
	rm -rf build/all
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
