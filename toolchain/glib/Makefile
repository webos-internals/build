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
	mkdir -p ../../staging/$*/usr/lib/pkgconfig
	cp -rp build/$*/usr/palm/applications/${APP_ID}/opt/lib/*.a ../../staging/$*/usr/lib/
	cp -rp build/$*/usr/palm/applications/${APP_ID}/opt/lib/*.so* ../../staging/$*/usr/lib/
	cp -rp build/$*/usr/palm/applications/${APP_ID}/opt/lib/pkgconfig/* ../../staging/$*/usr/lib/pkgconfig/
	sed -i 's|/opt|/usr|' ../staging/$*/usr/lib/pkgconfig/gio-2.0.pc
	sed -i 's|/opt|/usr|' ../staging/$*/usr/lib/pkgconfig/gio-unix-2.0.pc
	sed -i 's|/opt|/usr|' ../staging/$*/usr/lib/pkgconfig/glib-2.0.pc
	sed -i 's|/opt|/usr|' ../staging/$*/usr/lib/pkgconfig/gmodule-2.0.pc
	sed -i 's|/opt|/usr|' ../staging/$*/usr/lib/pkgconfig/gmodule-export-2.0.pc
	sed -i 's|/opt|/usr|' ../staging/$*/usr/lib/pkgconfig/gmodule-no-export-2.0.pc
	sed -i 's|/opt|/usr|' ../staging/$*/usr/lib/pkgconfig/gobject-2.0.pc
	sed -i 's|/opt|/usr|' ../staging/$*/usr/lib/pkgconfig/gthread-2.0.pc
	rm -f ../staging/$*/usr/lib/*-2.0.la >/dev/null 2>&1
	touch $@
