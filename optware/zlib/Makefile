NAME     = zlib
TITLE	 = zlib
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 1.2.5-1
VERSION  = 1.2.5-1
HOMEPAGE = http://www.zlib.net/
DESCRIPTION = A Massively Spiffy Yet Delicately Unobtrusive Compression Library (Also Free, Not to Mention Unencumbered by Patents)
CHANGELOG = 1.2.5-1: Updated to match the feeds.
TYPE	 = Optware
CATEGORY = Libraries
ICON	 = http://www.webos-internals.org/images/d/d9/Icon_WebOSInternals_ZLib.png

SRC_OPTWARE = ${NAME}_${OPT_VER}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built-${VERSION} : build/%.unpacked-${VERSION}
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/include
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/lib/libz.so
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/lib/libz.so.1
	touch $@
