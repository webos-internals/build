NAME     = pcre
TITLE	 = pcre
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 8.00-1
VERSION  = 8.0.0-1
HOMEPAGE = http://www.pcre.org/
DESCRIPTION = The PCRE library is a set of functions that implement regular expression pattern matching using the same syntax and semantics as Perl 5.
TYPE	 = Optware
CATEGORY = Libraries
ICON	 = http://www.webos-internals.org/images/5/5f/Icon_WebOSInternals_Base_Optware.png

SRC_OPTWARE = ${NAME}_${OPT_VER}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built-${VERSION} : build/%.unpacked
	rm -rf build/$*/opt/bin build/$*/opt/share
	touch $@
