NAME     = pcre
TITLE	 = pcre
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 8.31-1
VERSION  = 8.31-1
HOMEPAGE = http://www.pcre.org/
DESCRIPTION = The PCRE library is a set of functions that implement regular expression pattern matching using the same syntax and semantics as Perl 5.
CHANGELOG = 8.31-1: Updated to match feeds.
TYPE	 = Optware
CATEGORY = Libraries
ICON	 = http://www.webos-internals.org/images/5/5f/Icon_WebOSInternals_Base_Optware.png

SRC_OPTWARE = ${NAME}_${OPT_VER}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built-${VERSION} : build/%.unpacked-${VERSION}
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/bin
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/share
	rm -f build/$*/usr/palm/applications/${APP_ID}/opt/lib/libpcre.so.0
	rm -f build/$*/usr/palm/applications/${APP_ID}/opt/lib/libpcre.so
	rm -f build/$*/usr/palm/applications/${APP_ID}/opt/lib/libpcrecpp.so.0
	rm -f build/$*/usr/palm/applications/${APP_ID}/opt/lib/libpcrecpp.so
	rm -f build/$*/usr/palm/applications/${APP_ID}/opt/lib/libpcreposix.so.0
	rm -f build/$*/usr/palm/applications/${APP_ID}/opt/lib/libpcreposix.so
	touch $@
