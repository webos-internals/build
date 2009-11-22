NAME = misc-powersave-cpu-scaling
PATCH = misc/${NAME}.patch
TITLE = Powersave CPU Scaling
DESCRIPTION = OBSOLETE
CATEGORY = Obsolete
VERSION = 1.3.1-17
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
APP_ID=org.webosinternals.patches.${NAME}

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
