NAME     = openssl
TITLE	 = OpenSSL
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 0.9.8l-1
VERSION  = 0.9.8.12-3
CHANGELOG = 0.9.8.12-3: Made compatible with the Emergency Service Enabler to survive doctoring.
HOMEPAGE = http://www.openssl.org/
TYPE	 = Optware
CATEGORY = Libraries
ICON	 = http://www.webos-internals.org/images/a/ae/Icon_WebOSInternals_OpenSSL.png

SRC_OPTWARE = ${NAME}_${OPT_VER}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built-${VERSION} : build/%.unpacked
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/lib/libcrypto.so
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/lib/libcrypto.so.0
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/lib/libssl.so
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/lib/libssl.so.0
	touch $@
