NAME     = ncurses-dev
APP_ID	 = org.webosinternals.toolchain.${NAME}
VERSION  = 5.7-1
LICENSE  = LGPL Open Source

SRC_OPTWARE = ${NAME}_${VERSION}

.PHONY: package
package: build/.built-${VERSION}

include ../../support/download.mk

include ../../support/optware.mk

.PHONY: stage
stage: build/.staged-${VERSION}

build/.staged-${VERSION}: build/armv7.staged-${VERSION} build/armv6.staged-${VERSION} build/i686.staged-${VERSION}
	touch $@

build/%.staged-${VERSION} : build/%.built-${VERSION}
	mkdir -p ../../staging/$*/usr/
	cp -rp build/$*/usr/palm/applications/${APP_ID}/opt/* ../../staging/$*/usr/
	touch $@
