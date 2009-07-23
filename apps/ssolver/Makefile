NAME     = ssolver
APP_ID   = com.boatrights.${NAME}
VERSION  = 1.0
PLATFORM = all
HOMEPAGE = http://forums.precentral.net/homebrew-apps/191359-sudoku-solver-v1-0-nrr.html

SRC_IPKG = http://www.vocshop.com/junk/ssolver.ipk
include ../../support/download.mk

include ../../support/application-unpack.mk

build/.built: build/.unpacked
	( cd build/${NAME}/usr/palm/applications ; \
	  mv com.yourdomain.${NAME} ${APP_ID} ; \
	  sed -ire 's|com.yourdomain.${NAME}|${APP_ID}|' ${APP_ID}/appinfo.json )
	touch $@

include ../../support/application-package.mk
