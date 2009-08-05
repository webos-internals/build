NAME     = accelexample
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.0.1
PLATFORM = all
HOMEPAGE = http://www.preware.org/wiki/Application:AccelService
MAINTAINER = egaudet <emoney_33@yahoo.com>
DEPENDS = org.webosinternals.accelservice

SRC_GIT = git://gitorious.org/webos-internals/applications.git
include ../../support/download.mk

build/.built build/.unpack: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build build.tmp
	mkdir -p build.tmp
	tar -C build.tmp -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mkdir -p build/${NAME}/usr/palm/applications/
	mv build.tmp/${APP_ID} build/${NAME}/usr/palm/applications/${APP_ID}
	rm -rf build.tmp
	touch $@

include ../../support/application-package.mk

clobber::
	rm -rf build
