NAME     = lighttpd
TITLE	 = lighttpd
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
VERSION  = 1.4.25-1
HOMEPAGE = http://www.lighttpd.net/
DESCRIPTION = Lighttpd (pronounced lighty) is a web server which has a small memory footprint, effective management of the cpu load, and an advanced feature set.  By default, it is configured to publish the contents of the USB partition on port 80 with read access only and no authentication.  It can be configured with authentication options (including SSL client certificates), and can provide write access using WebDAV.
TYPE	 = Optware
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/5/5f/Icon_WebOSInternals_Base_Optware.png
DEPENDS	 = mobi.optware.pcre

SRC_OPTWARE = ${NAME}_${VERSION}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built-${VERSION} : build/%.unpacked
	rm -rf build/$*/opt/share build/$*/opt/etc/init.d
	install -m 644 files/${NAME}.conf build/$*/opt/etc/${NAME}/${NAME}.conf
	mkdir -p build/$*/etc/event.d
	install -m 644 upstart/${APP_ID} build/$*/etc/event.d/${APP_ID}
	touch $@
