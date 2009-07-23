NAME     = blackjack
APP_ID   = org.preware.${NAME}
VERSION  = 0.2.21
PLATFORM = all
HOMEPAGE = http://forums.precentral.net/homebrew-apps/192958-blackjack-0-2-21-nrr.html

SRC_IPKG = http://forums.precentral.net/attachments/homebrew-apps/21749d1247707037-blackjack-0-2-21-nrr-com.example.blackjack_0.2.21_all.ipk
include ../../support/download.mk

include ../../support/application-unpack.mk

build/.built: build/.unpacked
	( cd build/${NAME}/usr/palm/applications ; \
	  mv com.example.${NAME} ${APP_ID} ; \
	  sed -ire 's|com.example.${NAME}|${APP_ID}|' ${APP_ID}/appinfo.json )
	touch $@

include ../../support/application-package.mk
