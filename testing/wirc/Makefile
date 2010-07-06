NAME     = wirc
TITLE    = wIRC
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.2.99.1-1
TYPE     = Application
CATEGORY = Communication
MAINTAINER = oil, PuffTheMagic, zsoc, egaudet, rwhitby
HOMEPAGE = http://www.webos-internals.org/wiki/Application:WIRC
ICON     = http://www.webos-internals.org/images/1/10/Icon_WebOSInternals_wIRC.png
DESCRIPTION = A native webOS IRC client. <b><font color=red>THIS ONLY WORKS with webOS >=1.4.5</font></b>
CHANGELOG = 0.3.0: No more service, Now a hybrid app (plugin/mojo), and all the changes that went along with that<br>Tossing the main stage will now kill the entire app, including all child stages, and any connections to servers<br>Added option to stop the screen from dimming<br>Better random colors, they now are changed based on theme<br>DCC Chat and Send support<br>Correctly parses color in messages<br>Added option to turn off join/part/quit/mode event messages<br>Changing the theme resets message color options to be visible on the current theme<br>Favorite channels support<br>More palm-dark theme updates<br>Added this scene right here<br>Added theme based color prefs<br>Added custom aliases for commands<br>Gesture+Q and Gesture+A cycle though command history<br>/ctcp requests<br>Custom ctcp replies<br>Added events preference pages<br>/ping works when autoping is off<br>Auto-prepend \# to channel names if they\'re forgotten on /join<br>Fixed bug stoping you from joining channels that didn\'t start with \#<br>Relaunch bugfix<br>Added contextual menu when you tap a message<br>Added yell and connect launch commands for very webosy cross-app integration<br>Changed how notice events and /msg commands are displayed<br>/ns aliased to /msg NickServ<br>/authserv aliased to /msg AuthServ<br>Fixed /topic command bug<br>Now handles numeric 404 event<br>Changes to app-menus on most scenes<br>Fixed bug in timestamps<br>Added format options for timestamps<br>Added standard help scene<br>Removed old about scene<br>Turning off autoping actually turns off autoping<br>Added option to set autoping interval<br>Split messages longer than 255 char<br>/part messages now work<br>Now rejoins channels with open cards on a reconnect 0.2.4: Renamed appid and removes separate wircd service on install. 0.2.0: Service and Application combined for easier and safer install and removal.
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/5/5a/Wirc.png\",\
\"http://www.webos-internals.org/images/d/d2/Wirc_2.png\",\
\"http://www.webos-internals.org/images/b/b6/Wirc_3.png\",\
\"http://www.webos-internals.org/images/7/7c/Wirc_4.png\",\
\"http://www.webos-internals.org/images/9/9d/Wirc_5.png\" ]
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/applications/wIRC.git

D = build/$*/usr/palm/applications/${APP_ID}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk

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

build/.built-${VERSION}: build/armv7.built-${VERSION} build/i686.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	( cd build/src/src/libpdl ; rm -f *.o ; rm -f *.so ; cd .. ; \
	  ${MAKE} STAGING_DIR=${STAGING_DIR_$*} CC=${CROSS_COMPILE_$*}gcc \
		clobber ${NAME} )
	mkdir -p ${D}
	install -m 755 build/src/src/${NAME} ${D}
	cp -r build/src/* ${D}
	rm -rf ${D}/src
	touch $@

build/%/CONTROL/postinst:
	rm -f $@
	mkdir -p build/$*/CONTROL
	chmod +x ${IPKG_OFFLINE_ROOT}/usr/palm/applications/${APP_ID}/${NAME}" > $@
	chmod ugo+x $@

clobber::
	rm -rf build
