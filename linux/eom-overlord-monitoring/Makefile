TYPE = Linux Application
NAME = eom-overlord-monitoring
VERSION = 1.0.5
TITLE = EOM Overlord Monitoring
MAINTAINER = WebOS Internals <support@webos-internals.org>
DESCRIPTION = By default, Palm uploads multiple logs to ps.palmws.com. This includes such things as every application you have ever installed, the exact timestamp of every time you open and close an application, the full list of wifi access points that have been in range of your device at any time (even if you didn't use them), etc. This stops that process. If you install this, consider adding the "Muffle System Logging" patch from Preware too. 
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
