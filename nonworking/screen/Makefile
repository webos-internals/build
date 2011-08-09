NAME     = screen
TITLE    = screen
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 4.0.3-2
VERSION  = 4.0.3-3
CHANGELOG = 4.0.3-3: Fixed post install locations for Preware Installation.  4.0.3-2: Initial Load into Preware.
HOMEPAGE = http://www.gnu.org/s/screen/
TYPE     = Optware
CATEGORY = Utilities
ICON     = http://www.webos-internals.org/images/9/98/Icon_Screen_Optware.png

DEPENDS	 = mobi.optware.termcap

SRC_OPTWARE = ${NAME}_${OPT_VER}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built-${VERSION} : build/%.unpacked-${VERSION}
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/lib
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/include
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/bin
	touch $@
