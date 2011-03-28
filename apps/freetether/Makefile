NAME     = freetether
TITLE    = freeTether
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 1.0.0-2
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:FreeTether
ICON	 = http://www.webos-internals.org/images/8/84/Icon_FreeTether.png
DESCRIPTION = freeTether is an application that allows you to share your cellular internet connection with other devices connected via USB, Bluetooth, or WiFi.<br>If you find freeTether useful, please consider making a <a href='https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=2HVTWGXCB6C7N'>donation</a> to support the developers.
MAINTAINER = Ryan Hope <rmh3093@gmail.com>, Eric Gaudet <emoney_33@yahoo.com>
MINWEBOSVERSION = 1.4.5
CHANGELOG = \
1.0.0: Move out of testing feed.<br>\
0.99.15: Fix TCP cookie bug.<br>\
0.99.14: Fix cookie bug... saving settings works properly.<br>\
0.99.13: Disable settings while interface active.<br>\
         Add TCP/IP Preferences.<br>\
0.99.12: Defaul to Open for WiFi Tethering.<br>\
         Styling tweaks.<br>\
	 Show passphrase hint.<br>\
	 Menu options for each interface.<br>\
0.99.11: Add client info scene.<br>\
         Stop freeTether service on app kill.<br>\
0.99.10: Default to WPA for WiFi Tethering.<br>\
         Provide default passphrase<br>\
	 Enforce min passphrase length<br>\
	 Random passphrase generator<br>\
0.99.9: Connections List and service fixes.<br>\
        Save and restore interface state.<br>\
        Fix spinner states and multi-interface toggling.<br>\
        Fix client list to correctly update hostnames.<br>\
0.99.7: Bluetooth PAN Profile Fix.<br>\
0.99.6: USB, Bluetooth and WiFi support.<br>\
        1.4.5 and 2.x.x support.<br>\
        Improved UI.
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/1/16/FreeTether_ss1.png\", \
\"http://www.webos-internals.org/images/0/04/FreeTether_ss2.png\" \
 ]
LICENSE  = GPL v2 Open Source

GIT_TAG = v1.0.0
SRC_GIT = git://git.webos-internals.org/applications/freetether.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/arm.built-${VERSION} build/i686.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	( cd build/src/src ; \
	  ${MAKE} STAGING_DIR=${STAGING_DIR_$*} CC=${CROSS_COMPILE_$*}gcc APP_ID=${APP_ID} \
		clobber ${NAME} \
	)
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/src/${NAME} build/$*/usr/palm/applications/${APP_ID}/bin/${APP_ID}
	touch $@

build/%/CONTROL/postinst:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/postinst build/$*/CONTROL
	chmod ugo+x $@

build/%/CONTROL/prerm:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/prerm build/$*/CONTROL
	chmod ugo+x $@

clobber::
	rm -rf build
