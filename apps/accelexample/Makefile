NAME     = accelexample
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.1.0
HOMEPAGE = http://www.preware.org/wiki/Application:AccelService
MAINTAINER = Eric J. Gaudet <emoney_33@yahoo.com>
DEPENDS = org.webosinternals.accelservice

SRC_GIT = git://git.webos-internals.org/applications/accelexample.git
include ../../support/download.mk

build/.built build/.unpack: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/${NAME}/usr/palm/applications/${APP_ID}
	tar -C build/${NAME}/usr/palm/applications/${APP_ID} -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build/${NAME}/usr/palm/applications/${APP_ID}/.git
	touch $@

include ../../support/application-package.mk

clobber::
	rm -rf build
