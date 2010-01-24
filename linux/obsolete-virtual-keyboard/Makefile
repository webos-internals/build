TYPE = Linux Application
NAME = virtual-keyboard
VERSION = 0.4.6
TITLE = OBSOLETE Virtual Keyboard
MAINTAINER = Eric J Gaudet <emoney_33@yahoo.com>
DESCRIPTION = This will clean up created files/directories from previous VKB installs and then install the actual Virtual Keyboard patch.
APP_ID = org.webosinternals.${NAME}
CATEGORY = Utilities
DEPENDS = org.webosinternals.patches.add-onscreen-keyboard

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
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
