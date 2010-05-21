NAME     = ipkgservice
CLASS    = IPKGService
APP_ID   = org.webosinternals.${NAME}
VERSION  = 1.0.0
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Preware
MAINTAINER = WebOS Internals <support@webos-internals.org>
TITLE	 = Obsolete Package Manager Service
DESCRIPTION = This package removes the obsolete package manager service.
CATEGORY = Utilities
ICON	= http://www.webos-internals.org/images/7/77/Icon_WebOSInternals_PackageManager.png
LICENSE = GPL v2 Open Source

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
