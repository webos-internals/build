NAME     = pwgen
TITLE	 = Password Generator
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 2.04-1
VERSION  = 2.0.4-2
CHANGELOG = 2.0.4-2: Made compatible with the Emergency Service Enabler to survive doctoring.
HOMEPAGE = http://pwgen.sourceforge.net/
TYPE	 = Optware
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/c/c9/Icon_WebOSInternals_Password.png

SRC_OPTWARE = ${NAME}_${OPT_VER}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built-${VERSION} : build/%.unpacked-${VERSION}
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/man
	touch $@
