NAME     = translate
APP_ID   = de.umass.${NAME}
VERSION  = 1.1
PLATFORM = all
HOMEPAGE = http://www.u-mass.de/translator

SRC_ZIP = http://u-mass.de/software/Translator_src_${VERSION}.zip
include ../../support/download.mk

build/.built build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.zip
	rm -rf build
	mkdir -p build/${NAME}/usr/palm/applications
	( cd build ; \
	  unzip ../$< ; \
	  mv Translate ${NAME}/usr/palm/applications/${APP_ID} )
	touch $@

include ../../support/application-package.mk
