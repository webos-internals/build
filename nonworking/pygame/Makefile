NAME     = pygame
TITLE	 = pygame
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 1.9.1-1
VERSION  = 1.9.1release
CHANGELOG = 1.9.1release new upsteam release
HOMEPAGE = http://pygame.org
TYPE	 = Optware
CATEGORY = Python
ICON	 = http://www.webos-internals.org/images/4/48/Pygame.png

SRC_TGZ = http://pygame.org/ftp/${NAME}-${VERSION}.tar.gz

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk

include ../../support/package.mk
include ../../support/download.mk

build/.unpack: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build
	tar -C build -zxf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mv build/${NAME}-${VERSION} build/src
	touch $@

build/.built-${VERSION}: build/armv7.built-${VERSION}

build/armv7.built-${VERSION}: build/.unpack
	( cd build/src/; /usr/local/bin/python2.5 setup.py build )
	mkdir -p build/all/opt/python2.5/
	cp -a build/src/build/lib.linux-armv*tel-2.5/pygame build/all/opt/python2.5/
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
	rm -rf ipkgs

