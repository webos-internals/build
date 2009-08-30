NAME     = accelexample
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.1.0
HOMEPAGE = http://www.preware.org/wiki/Application:AccelService
MAINTAINER = Eric J. Gaudet <emoney_33@yahoo.com>
DEPENDS = org.webosinternals.accelservice
TYPE	= Application
DESCRIPTION = An example of how to use the Accelerometer Service (org.webosinternals.accelservice).
CATEGORY = System Utilities
ICON	= http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png

SRC_GIT = git://git.webos-internals.org/applications/accelexample.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.built build/.unpack: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	tar -C build/all/usr/palm/applications/${APP_ID} -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build/all/usr/palm/applications/${APP_ID}/.git*
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
