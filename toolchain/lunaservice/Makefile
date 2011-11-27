NAME     = lunaservice
APP_ID	 = org.webosinternals.toolchain.lunaservice
VERSION  = 0.0.1-1
HOMEPAGE = http://git.webos-internals.org/?p=libraries/lunaservice.git;a=summary
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
	mkdir -p ../../staging/$*/usr/include/
	install -m 644 build/$*/usr/palm/applications/${APP_ID}/opt/include/lunaservice.h ../../staging/$*/usr/include/
	install -m 644 build/$*/usr/palm/applications/${APP_ID}/opt/include/lunaservice-errors.h ../../staging/$*/usr/include/
	mkdir -p ../../staging/$*/usr/lib
	install -m 644 build/$*/usr/palm/applications/${APP_ID}/opt/lib/liblunaservice.so ../../staging/$*/usr/lib/
	touch $@
