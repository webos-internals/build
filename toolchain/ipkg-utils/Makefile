NAME     = ipkg-utils
VERSION  = 1.7
HOMEPAGE = http://handhelds.org/packages/ipkg-utils/

SRC_TGZ  = http://nslu.sourceforge.net/downloads/${NAME}-${VERSION}.tar.gz
include ../../support/download.mk

.PHONY: build
build: build/${NAME}/ipkg-make-index

.PHONY: unpack
unpack: build/${NAME}/ipkg-make-index

build/${NAME}/ipkg-make-index: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build
	cd build ; tar zxvf ../${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mv build/${NAME}-${VERSION} build/${NAME}
	touch $@

clobber::
	rm -rf build
