NAME = $(shell basename $(shell pwd))
PATCH = misc/${NAME}.patch
TITLE = Powersave CPU Scaling 600MHz
DESCRIPTION = This package is OBSOLETE. Please remove it. It is now known as 'Dangerous: Powersave CPU Scaling 500/600 MHz'.
CATEGORY = Obsolete
VERSION = 1.3.1-18
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
APP_ID=org.webosinternals.patches.${NAME}
TYPE = Patch

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
