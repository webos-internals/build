NAME     = bash
TITLE	 = Bourne Again Shell
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 3.2.54-1
VERSION  = 3.2.54-1
CHANGELOG = 3.2.49-3: Made compatible with the Emergency Service Enabler to survive doctoring.
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Bash
TYPE	 = Optware
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png
DEPENDS  = mobi.optware.readline

SRC_OPTWARE = ${NAME}_${OPT_VER}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built-${VERSION} : build/%.unpacked-${VERSION}
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/etc
	touch $@
