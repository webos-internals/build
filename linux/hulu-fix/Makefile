NAME     = hulu-fix
TITLE	 = Hulu Fix
APP_ID   = org.webosinternals.${NAME}
MAINTAINER = PuffTheMagic
VERSION  = 3.0-1
BLDFLAGS = -p
TYPE	 = Linux Application
CATEGORY = Utilities
POSTINSTALLFLAGS = RestartLuna
POSTUPDATEFLAGS  = RestartLuna
POSTREMOVEFLAGS  = RestartLuna
DESCRIPTION = Make Hulu work!
MINWEBOSVERSION = 3.0.0

CHANGELOG = <BR>\
2.0 - Fix fs read-only issue<BR>\
3.0 - Use LNX instead of WIN

SRC_BZ2 =

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
