NAME     = php-fcgi
TITLE	 = PHP Fast CGI module
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 5.2.12-1
VERSION  = 5.2.12-1
HOMEPAGE = http://www.fastcgi.com/
DESCRIPTION =  PHP-FCGI is the php scripting language, built as an fcgi module to accomodate lighty web server. PHP-FCGI was built as a fast cgi module becaause it is still CGI with only a few extensions and also because of it's low memory footprint.
CHANGELOG = 5.2.12-1: Initial release to webos-internals
TYPE	 = Optware
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/wiki/Image:Icon_lighttpd.png
DEPENDS	 = mobi.optware.lighttpd

SRC_OPTWARE = ${NAME}_${OPT_VER}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built-${VERSION} : build/%.unpacked
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/share
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/etc/init.d
	install -m 644 files/${NAME}.conf build/$*/usr/palm/applications/${APP_ID}/opt/etc/${NAME}/${NAME}.conf
	mkdir -p build/$*/etc/event.d
	install -m 644 upstart/${APP_ID} build/$*/etc/event.d/${APP_ID}
	touch $@