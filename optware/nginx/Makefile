NAME     = nginx
TITLE	 = Nginx Web Server
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 1.0.5-1
VERSION  = 1.0.5-1
HOMEPAGE = http://nginx.org/
DESCRIPTION = nginx (pronounced “engine X”) is a lightweight, high-performance Web server/reverse proxy and e-mail (IMAP/POP3) proxy, licensed under a BSD-like license.
CHANGELOG = \
1.0.1-1: Robustified upstart scripts to improve start-up reliability.<br>\
1.0.2-4: Switch to using try_files and to remove firewall access upon stop.<br>\
1.0.2-3: Remove openssl and zlib dependencies.<br>\
1.0.2-2: Moved upstart script from /etc/event.d/ to /var/palm/event.d/ to handle apps and data erases better.<br>\
1.0.2-1: Update to v1.0.2.<br>\
0.7.67-6: Fixed the hanging problem.<br>\
0.7.67-5: Fixed upstart script and config file.<br>\
0.7.67-1: First release
TYPE	 = Optware
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/9/9e/Icon_NGiNX.png
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
	install -m 644 files/index.html build/$*/usr/palm/applications/${APP_ID}/opt/etc/${NAME}/index.html
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/upstart
	install -m 644 upstart/${APP_ID} build/$*/usr/palm/applications/${APP_ID}/upstart/
	touch $@
