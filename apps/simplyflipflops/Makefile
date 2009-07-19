NAME     = simplyflipflops
APP_ID   = com.simplyflipflops
VERSION  = 0.9.99
PLATFORM = all
HOMEPAGE = http://forums.precentral.net/homebrew-apps/188554-simplyflipflops-v0-9-99-nrr.html

SRC_IPKG = http://forums.precentral.net/attachments/homebrew-apps/20349d1245854061-simplyflipflops-v0-9-99-nrr-${APP_ID}_${VERSION}_${PLATFORM}.ipk
include ../../support/download.mk

include ../../support/application-unpack.mk

build/.built: build/.unpacked
	touch $@

include ../../support/application-package.mk
