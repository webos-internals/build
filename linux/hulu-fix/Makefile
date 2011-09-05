NAME     = hulu-fix
TITLE	 = Hulu Fix
APP_ID   = org.webosinternals.${NAME}
VERSION  = 3.1
BLDFLAGS = -p
TYPE	 = Linux Application
CATEGORY = Utilities
MAINTAINER = PuffTheMagic
ICON = http://www.webos-internals.org/images/d/da/Icon_Hulu_Patch.png
DESCRIPTION = Make Hulu work!
POSTINSTALLFLAGS = RestartLuna
POSTUPDATEFLAGS  = RestartLuna
POSTREMOVEFLAGS  = RestartLuna
MINWEBOSVERSION = 3.0.0

CHANGELOG = \
3.1: Added an icon.<br>\
3.0: Use LNX instead of WIN.<br>\
2.0: Fix fs read-only issue

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

build/all/CONTROL/prerm: build/.unpacked-${VERSION}
	mkdir -p build/all/CONTROL
	cp prerm build/all/CONTROL/prerm
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
