NAME     = dropbear
TITLE	 = Dropbear
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 0.52-5
VERSION  = 0.52-15
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Dropbear
TYPE	 = Optware
DESCRIPTION = Dropbear is a compact SSH server and client, which enables secure root access via wifi only, on port 22, with secure ssh key authentication only (passwords are completely disabled by default).  See the Homepage link for mandatory configuration instructions.  Note that you must set a root password to use dropbear, even though password authentication is disabled by default.  For this reason, openssh is recommended ahead of dropbear.
CHANGELOG = \
0.52-15: Moved upstart script from /etc/event.d/ to /var/palm/event.d/ to handle apps and data erases better.<br>\
0.52-10: Made compatible with the Emergency Service Enabler to survive doctoring.<br>\
0.52-9: Updated for future webOS compatibility.<br>\
0.52-8: Initial version.
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/7/76/Icon_WebOSInternals_DropBear.png
DEPENDS  = mobi.optware.ipkg-opt

SRC_OPTWARE = ${NAME}_${OPT_VER}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built-${VERSION} : build/%.unpacked-${VERSION}
	rm -rf   build/$*/usr/palm/applications/${APP_ID}/opt/etc/default
	rm -rf   build/$*/usr/palm/applications/${APP_ID}/opt/etc/init.d
	rm -f    build/$*/usr/palm/applications/${APP_ID}/opt/bin/dbclient
	rm -f    build/$*/usr/palm/applications/${APP_ID}/opt/sbin/dropbear
	rm -f    build/$*/usr/palm/applications/${APP_ID}/opt/sbin/dropbearconvert
	rm -f    build/$*/usr/palm/applications/${APP_ID}/opt/sbin/dropbearkey
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/upstart
	install -m 644 upstart/${APP_ID} build/$*/usr/palm/applications/${APP_ID}/upstart/${APP_ID}
	touch $@
