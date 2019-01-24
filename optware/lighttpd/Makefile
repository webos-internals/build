NAME     = lighttpd
TITLE	 = Lighty Web Server
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 1.4.32-1
VERSION  = 1.4.32-1
HOMEPAGE = http://www.lighttpd.net/
DESCRIPTION = Lighttpd (pronounced 'Lighty') is a web server which has a small memory footprint, effective management of the cpu load, and an advanced feature set.  By default, it is configured to publish the contents of the USB partition on port 80 with read access only and no authentication.  It can be configured with authentication options (including SSL client certificates), and can provide write access using WebDAV if desired.
CHANGELOG = \
1.4.32-1: Fix to make things build again
1.4.29-1: Robustified upstart scripts to improve start-up reliability.<br>\
1.4.25-6: Added support for the saverestore alias.<br>\
1.4.25-5: Create the /media/internal/www directory at install time.<br>\
1.4.25-4: Made compatible with the Emergency Service Enabler to survive doctoring. Moved to /media/internal/www for the directory served by the web server.
TYPE	 = Optware
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/3/36/Icon_lighttpd.png
DEPENDS	 = mobi.optware.pcre

SRC_OPTWARE = ${NAME}_${OPT_VER}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built-${VERSION} : build/%.unpacked-${VERSION}
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/share
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/etc/init.d
	install -m 644 files/${NAME}.conf build/$*/usr/palm/applications/${APP_ID}/opt/etc/${NAME}/${NAME}.conf
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/upstart
	install -m 644 upstart/${APP_ID} build/$*/usr/palm/applications/${APP_ID}/upstart/
	touch $@
