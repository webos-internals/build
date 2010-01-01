NAME     = myflashlight
APP_ID   = net.vertigostudios.${NAME}
VERSION  = 0.0.1
HOMEPAGE = 
MAINTAINER = 
DEPENDS = net.vertigostudios.ledmanager
TYPE	= Application
DESCRIPTION = 
CHANGELOG = 
CATEGORY = System Utilities
ICON	= 
LICENSE  = GPL v2 Open Source
# SCREENSHOTS = [\"\"]

SRC_GIT = git://git.webos-internals.org/applications/myflashlight.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.built-${VERSION} build/.unpack: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	tar -C build/all/usr/palm/applications/${APP_ID} -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build/all/usr/palm/applications/${APP_ID}/.git*
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
