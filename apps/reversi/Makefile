NAME     = reversi
APP_ID   = com.boatrights.${NAME}
VERSION  = 1.0
PLATFORM = all
HOMEPAGE = http://www.preware.org/wiki/Application:${NAME}

SRC_IPKG = http://www.vocshop.com/junk/othello.ipk
include ../../support/download.mk

include ../../support/application-unpack.mk

build/.built: build/.unpacked
	( cd build/${NAME}/usr/palm/applications ; \
	  mv com.yourdomain.reversi ${APP_ID} ; \
	  sed -ire 's|com.yourdomain.reversi|${APP_ID}|' ${APP_ID}/appinfo.json ; \
	  rm ${APP_ID}/othello.ipk )
	touch $@

include ../../support/application-package.mk
