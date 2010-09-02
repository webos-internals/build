TYPE = Linux Application
NAME = eom-overlord-monitoring
VERSION = 1.0.2
TITLE = EOM Overlord Monitoring
MAINTAINER = WebOS Internals <support@webos-internals.org>
DESCRIPTION = By default, Palm uploads multiple logs to ps.palmws.com. This stops that process.
APP_ID = org.webosinternals.${NAME}
SIGNER = org.webosinternals
MAINTAINER = WebOS Internals
CATEGORY = Utilities
ICON = http://www.webos-internals.org/images/4/4f/Epr.png
POSTINSTALLFLAGS = 

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
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
