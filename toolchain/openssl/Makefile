NAME     = openssl
APP_ID   = mobi.optware.openssl
OPT_VER  = 0.9.8p-1
VERSION  = 0.9.8.16

SRC_OPTWARE = ${NAME}_${OPT_VER}

.PHONY: package
package: build/.built-${VERSION}

include ../../support/download.mk

include ../../support/optware.mk

.PHONY: stage
stage: build/.staged-${VERSION}

build/.staged-${VERSION}: build/armv7.staged-${VERSION} build/armv6.staged-${VERSION} build/i686.staged-${VERSION}
	touch $@

build/%.staged-${VERSION} : build/%.built-${VERSION}
	mkdir -p ../../staging/$*/usr/share
	cp -rp build/$*/usr/palm/applications/${APP_ID}/opt/share/* ../../staging/$*/usr/share/
	mkdir -p ../../staging/$*/usr/lib
	cp -rp build/$*/usr/palm/applications/${APP_ID}/opt/lib/* ../../staging/$*/usr/lib/
	touch $@
