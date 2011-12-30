NAME     = glib
APP_ID	 = org.webosinternals.toolchain.glib
VERSION  = 2.20.4-1
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
	mkdir -p ../../staging/$*/usr/include
	cp -rp build/$*/usr/palm/applications/${APP_ID}/opt/include/* ../../staging/$*/usr/include/
	cp -rp build/$*/usr/palm/applications/${APP_ID}/opt/lib/glib-2.0/include/* ../../staging/$*/usr/include/
	mkdir -p ../../staging/$*/usr/lib
	cp -rp build/$*/usr/palm/applications/${APP_ID}/opt/lib/* ../../staging/$*/usr/lib/
	mkdir -p ../../staging/$*/usr/bin
	cp -rp build/$*/usr/palm/applications/${APP_ID}/opt/bin/* ../../staging/$*/usr/bin
	touch $@
