TYPE = Linux Application
NAME = ausmt-system-verify
VERSION = 1.0.0
TITLE = AUSMT System Verification
MAINTAINER = Janne Julkunen <scorpio.iix@gmail.com>
DESCRIPTION = Verifies that applied theme and all patch packages are installed with supported patch technologies and that all files are stock or modified by AUSMT.
CHANGELOG = 1.0.0: Initial release.
APP_ID = org.webosinternals.${NAME}
SIGNER = org.webosinternals
HOMEPAGE = http://www.webos-internals.org/wiki/Auto-Update_System_Modification_Technology
MAINTAINER = WebOS Internals <support@webos-internals.org>
CATEGORY = Utilities
ICON = http://www.webos-internals.org/images/4/4f/Epr.png

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
