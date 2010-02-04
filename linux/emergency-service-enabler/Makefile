TYPE = Linux Application
NAME = emergency-service-enabler
VERSION = 1.0.0
TITLE = Emergency Service Enabler
MAINTAINER = WebOS Internals <support@webos-internals.org>
DESCRIPTION = Install this package on your webOS device immediately after running the webOS Doctor to restart any services or plugins that have been disabled by running the webOS Doctor.  A side effect is that it also reapplies any patches, which is a good idea if you are doctoring to the same version, but a very bad idea if you are doctoring to a different version.
APP_ID = org.webosinternals.${NAME}
MAINTAINER = WebOS Internals
CATEGORY = Utilities
ICON = http://www.webos-internals.org/images/4/4f/Epr.png
POSTINSTALLFLAGS=RestartJava

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
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
