NAME     = mjson
APP_ID	 = org.webosinternals.toolchain.mjson
VERSION  = 1.0-1
HOMEPAGE = https://sourceforge.net/projects/mjson/
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
	install -m 644 build/$*/usr/palm/applications/${APP_ID}/opt/include/json.h ../../staging/$*/usr/include/
	install -m 644 build/$*/usr/palm/applications/${APP_ID}/opt/include/json_helper.h ../../staging/$*/usr/include/
	install -m 644 build/$*/usr/palm/applications/${APP_ID}/opt/include/json_utils.h ../../staging/$*/usr/include/
	mkdir -p ../../staging/$*/usr/lib
	install -m 644 build/$*/usr/palm/applications/${APP_ID}/opt/lib/libmjson.so ../../staging/$*/usr/lib/
	touch $@
