NAME     = supertux
APP_ID   = org.webosinternals.${NAME}
MAXWEBOSVERSION = 1.9.9
SIGNER   = org.webosinternals
VERSION  = 1.0.3
DEPENDS  = org.webosinternals.upstartmgr
HOMEPAGE = http://www.webos-internals.org/wiki/Application:SuperTux
MAINTAINER = Eric J Gaudet <emoney_33@yahoo.com>
TITLE   = SuperTux
TYPE	= Application
DESCRIPTION = Port of SuperTux - Can be played without use of keyboard<br>It requires webOS 1.3.5 or later.<br><br>NOTE: App takes close to 10 seconds to initially load, please be patient.  You can tilt up/down to navigate the menus and tap Gesture area to select.  Alternatively you may use the keyboard controls and enter key to navigate menus.<br<br>Controls:<br> tilt for joystick directions<br> tilt up towards you to duck<br> tap gesture area to jump<br> tap screen to throw fireball<br><br>Alternate Keyboard Controls:<br> G: Up<br> F: Down<br> T: Left<br> V: Right<br> Space: Jump<br> B: Duck<br> Period: Fireball
CATEGORY = Games
ICON	= http://www.webos-internals.org/images/a/a4/Supertux_icon.png
LICENSE  = GPL
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/5/5e/Supertux1.png\",\
\"http://www.webos-internals.org/images/a/a8/Supertux3.png\",\
\"http://www.webos-internals.org/images/4/42/Supertux2.png\"\
]

SRC_GIT = git://github.com/webos-internals/supertux.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src/
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mv build/src/binaries build/binaries
	mv build/src/src/data build/data
	touch $@

build/.built-${VERSION}: build/armv7.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -f $@
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/data
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	rm -rf build/$*/usr/palm/applications/${APP_ID}/upstart
	rm -rf build/$*/usr/palm/applications/${APP_ID}/control
	install -m 755 build/binaries/$*/supertux build/$*/usr/palm/applications/${APP_ID}/bin/
	cp -r build/data build/$*/usr/palm/applications/${APP_ID}/
	chmod -R 755 build/$*/usr/palm/applications/${APP_ID}/data
	mkdir -p build/$*/etc/event.d
	install -m 644 build/src/upstart/${APP_ID} build/$*/etc/event.d/${APP_ID}
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

.PHONY: clobber
clobber::
	rm -rf build
