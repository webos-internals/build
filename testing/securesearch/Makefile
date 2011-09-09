NAME     = securesearch
TITLE	 = Secure Search
APP_ID   = org.webosinternals.${NAME}
VERSION  = 1.0
BLDFLAGS = -p
TYPE	 = Linux Application
CATEGORY = Utilities
MAINTAINER = WebOS Internals
ICON = 
DESCRIPTION = This enables secure search options in the webOS mobile browser. (Phones only for now).
POSTINSTALLFLAGS = RestartDevice
MINWEBOSVERSION = 2.0.0
DEVICECOMPATIBILITY = [\"Pre\", \"Pre2\", \"Pre3\", \"Veer\", \"Pixi\"]

CHANGELOG = \
1.0: Add options for secure Google and DuckDuckGo searches

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
