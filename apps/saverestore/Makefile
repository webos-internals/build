NAME     = saverestore
TITLE    = Save/Restore
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.6.8
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:SaveRestore
ICON	 = http://www.webos-internals.org/images/2/2e/Icon_WebOSInternals_SaveRestore.png
DESCRIPTION = Save/Restore enables saving and restoring application data to and from the /media/internal/saverestore/ directory on a webOS device.<br>It is in a general beta testing phase, but you should not trust it as your sole backup of data.<br>\
WebOS Internals provides Save/Retore as is without warranty of any kind, either expressed or implied, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose.  The entire risk as to the quality and performance of Save/Restore is with you.  Should Save/Restore prove defective, you assume the cost of all necessary servicing, repair or correction.<br>\
In no event will WebOS Internals or any other party be liable to you for damages, including any general, special, incidental or consequential damages arising out of the use or inability to use Save/Restore (including but not limited to loss of data or data being rendered inaccurate or losses sustained by you or third parties or a failure of Save/Restore to operate with any other programs).
CHANGELOG = \
0.6.8: Fixed Messaging query support. Applications: N.O.V.A<br>\
0.6.7: Applications: AmpachPre, Stock Kernel (Palm Pre), Uber-Kernel (Palm Pre)<br>\
0.6.6: Applications: NFL 2010, Real Soccer 2010, Sandstorm, Let\'s Golf, Shopping List, ShopList, ClassTracker, Fliq Notes<br>\
0.6.5: Applications: NewsRoom, SecuStore<br>\
0.6.4: Applications: Checkbook, Brothers in Arms<br>\
0.6.3: Fixed positioning of the list when toggling selections. Now supports databases on the emulator. Applications: Preware, FlashCards, Absolute Fitness<br>\
0.6.2: Applications: Hawx, Myles, Time is Money<br>\
0.6.1: Applications: Sorrowind Slots, GiftJammer, GolfPinFinder, Flickr Addict<br>\
0.6.0: Added support for saving and restoring cookies. Applications: Paratrooper, Weather Window, Scoop, Tweed, Clock Sync.<br>\
0.5.2: Added activity notifications and disabled main buttons while reloading.<br>\
0.5.1: Made the restore screen default to all off - much safer that way. Fixed a bug in screen positioning for partial restores.<br>\
0.5.0: First Public Release. Applications: Dr Podder, Monopoly, NFSU, The Sims 3, A+ Student Organiser, Asphalt5, Dungeon Hunter, Shrek Kart, Dragon Game, Glyder 2, Keyring, Messaging (Save Only), Memos (Save Only), JogStats, SplashID, Netstat

SCREENSHOTS = [\
\"http://www.webos-internals.org/images/b/b5/Saverestore_ss1.png\", \
\"http://www.webos-internals.org/images/7/76/Saverestore_ss2.png\", \
\"http://www.webos-internals.org/images/4/47/Saverestore_ss3.png\", \
\"http://www.webos-internals.org/images/3/36/Saverestore_ss4.png\" \
 ]
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/applications/saverestore.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	tar -C build/src/scripts -zcf build/src/scripts.tgz .
	rm -rf build/src/scripts
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/arm.built build/i686.built
	touch $@

include ../../support/cross-compile.mk

build/%.built: build/.unpacked
	rm -rf build/$*
	( cd build/src/src ; \
	  ${MAKE} STAGING_DIR=${STAGING_DIR_$*} CC=${CROSS_COMPILE_$*}gcc \
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
