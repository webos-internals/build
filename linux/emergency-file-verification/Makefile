TYPE = Linux Application
NAME = emergency-file-verification
VERSION = 1.1.1
TITLE = Emergency File Verification
MAINTAINER = Eric J Gaudet <emoney_33@yahoo.com>
DESCRIPTION = Verifies all patch packages are installed with supported patch technology and then verifies all files are stock or modified by working aupt technology
APP_ID = org.webosinternals.${NAME}
SIGNER = org.webosinternals
HOMEPAGE = http://www.webos-internals.org/wiki/Portal:Patches_to_webOS
MAINTAINER = WebOS Internals <support@webos-internals.org>
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
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
