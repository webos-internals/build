NAME     = readline
TITLE	 = GNU Readline Library
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 6.1-2
VERSION  = 6.1-1
CHANGELOG = 6.1-2: Updated to match the feeds.
HOMEPAGE = http://directory.fsf.org/project/readline/
TYPE	 = Optware
CATEGORY = Libraries
ICON	 = http://www.webos-internals.org/images/f/f3/Icon_WebOSInternals_GNUReadlineLib.png

SRC_OPTWARE = ${NAME}_${OPT_VER}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built-${VERSION} : build/%.unpacked-${VERSION}
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/share
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/include
	rm -f build/$*/usr/palm/applications/${APP_ID}/opt/lib/libhistory.so
	rm -f build/$*/usr/palm/applications/${APP_ID}/opt/lib/libhistory.so.6
	rm -f build/$*/usr/palm/applications/${APP_ID}/opt/lib/libreadline.so
	rm -f build/$*/usr/palm/applications/${APP_ID}/opt/lib/libreadline.so.6
	touch $@
