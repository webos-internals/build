NAME     = devtoolbox
APP_ID   = com.palm.org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 1.0.0
HOMEPAGE = http://www.webos-internals.org/wiki/Application:DevToolbox
MAINTAINER = PuffTheMagic
TYPE	= Application
DESCRIPTION = Dev Toolbox
CATEGORY = System Utilities
ICON	= http://www.webos-internals.org/images/b/bd/Icon_WebOSInternals_WeboOSInternals.png
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/applications/devtoolbox.git

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
