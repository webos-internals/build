TYPE = Patch
NAME = pdfviewer-extract-app
VERSION = 1.0.0
TITLE = Extract PdfViewer App
DESCRIPTION = Extracts the PdfViewer Application so that it can be patched.
APP_ID = org.webosinternals.${NAME}
HOMEPAGE = http://www.webos-internals.org/wiki/Portal:Patches_to_webOS
MAINTAINER = WebOS Internals <support@webos-internals.org>
CATEGORY = PdfViewer
#POSTINSTALLFLAGS = RestartLuna
#POSTREMOVEFLAGS = RestartLuna

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

build/all/CONTROL/prerm: build/.unpacked
	mkdir -p build/all/CONTROL
	cp prerm build/all/CONTROL/prerm
	chmod ugo+x $@

.PHONY: build
build: build/.built

build/.built: build/.unpacked
	rm -rf build/all
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
