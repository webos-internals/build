NAME     = showprops
APP_ID   = com.palm.org.webosinternals.${NAME}
VERSION  = 0.1.0
HOMEPAGE = http://www.webos-internals.org/wiki/Application:ShowProperties
MAINTAINER = WebOS Internals <support@webos-internals.org>
TYPE	= Application
DESCRIPTION = A utility to display System Properties
CHANGELOG = 0.1.0: Initial version
CATEGORY = System Utilities
ICON	= http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png
LICENSE  = GPL v2 Open Source
SCREENSHOTS = []

SRC_GIT = git://git.webos-internals.org/applications/showprops.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.built-${VERSION} build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	tar -C build/all/usr/palm/applications/${APP_ID} -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build/all/usr/palm/applications/${APP_ID}/.git*
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
