NAME     = libcurl-dev
APP_ID   = mobi.optware.libcurl-dev
OPT_VER  = 7.21.7-1
VERSION  = 7.21.7

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
	mkdir -p ../../staging/$*/usr/lib
	cp -rp build/$*/usr/palm/applications/${APP_ID}/opt/lib/* ../../staging/$*/usr/lib/
	mkdir -p ../../staging/$*/usr/include
	cp -rp build/$*/usr/palm/applications/${APP_ID}/opt/include/* ../../staging/$*/usr/include/
	touch $@
