NAME     = wolui
APP_ID   = com.thebitguru.${NAME}
VERSION  = 0.5.0
HOMEPAGE = 
MAINTAINER = 
TITLE   = Wake-on-LAN
DEPENDS = com.thebitguru.wolservice
TYPE	= Application
DESCRIPTION = 
CHANGELOG = 
CATEGORY = 
ICON	= 
LICENSE  = 
# SCREENSHOTS = [\"\"]

SRC_GIT = git://git.webos-internals.org/applications/wolui.git

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
