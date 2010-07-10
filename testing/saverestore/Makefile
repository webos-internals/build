NAME     = saverestore
TITLE    = Save/Restore
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.9.6
DEPENDS  = org.webosinternals.unzip, org.webosinternals.zip
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:SaveRestore
ICON	 = http://www.webos-internals.org/images/f/f0/Icon_WebOSInternals_Saver.png
DESCRIPTION = Save/Restore enables saving and restoring application data to and from the /media/internal/saverestore/ directory on a webOS device.<br>It is in a general beta testing phase, but you should not trust it as your sole backup of data.<br>\
WebOS Internals provides Save/Retore as is without warranty of any kind, either expressed or implied, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose.  The entire risk as to the quality and performance of Save/Restore is with you.  Should Save/Restore prove defective, you assume the cost of all necessary servicing, repair or correction.<br>\
In no event will WebOS Internals or any other party be liable to you for damages, including any general, special, incidental or consequential damages arising out of the use or inability to use Save/Restore (including but not limited to loss of data or data being rendered inaccurate or losses sustained by you or third parties or a failure of Save/Restore to operate with any other programs).
CHANGELOG = \
0.9.6: Applications: Agenda, Twee, Comics, Bubbles Plus, Bubbles (free), FillUps, TXT Group, Topple Ball, Topple Ball Mini, Warranty Manager, ASCII Star Wars, Ski for Pre, Ski for Pre Lite, WebUI for WebOS Lite, WebUI for WebOS PRO.<br>\
0.9.5: Applications: Avatar, Super KO Boxing 2, Scratchpad, Starship Commander, News Feed, Milage Monitor Plus.<br>\
0.9.4: Applications: Applications: Preware (Now supports saving of custom feeds), WOG Card Keeper (enhanced support), Suduko (by Cakefight), Five Dice, Battleship (EA), Fall-E, Fall-E pro, Back of the Net, Timepiece, Ampache Mobile, Plumbers Nightmare.<br>\
0.9.3: Fixed Launcher support.<br>\
0.9.2: Applications: Defensive Warfare (courtesy of pip smith), Preset Reset, ShareTheCost (STC), Sudoku Lite, Milage Monitor, Hero of Sparta, Score Keeper, Timesheet, Radio Hibiki, Online Tracker, Battery Monitor Plus, Quick Contacts, Crossword Lite.<br>\
0.9.1: Fixed Launcher support. Now supports the Palm Web Browser.<br>\
0.9.0: Now stores the archives as zip files, so the media indexer does not see the constituent files.<br>\
0.8.6: Fixed Govnah support.<br>\
0.8.5: Improved support for Add-to-Launcher icons (e.g. browser, launchpoints, contacts).<br>\
0.8.4: Applications: Govnah (Now supports saving of profiles), Net2Streams Pro, Assassins Creed, Thought Bubble, Giant Fighting Robots, Jump O Clock, Real Tennis, Tiger Woods PGA Tour.<br>\
0.8.3: Applications: Cloud Hopper. Now supports Add-to-Launcher icons (e.g. browser, launchpoints, contacts).<br>\
0.8.2: Applications: Applications: Gangstar, wIRC (courtesy of Audermars02).<br>\
0.8.1: Removed DOS line endings from some contributed scripts that caused startup failure.<br>\
0.8.0: Applications: Sports Live, Football Live, US Soccer Live (all courtesy of MoreSolutions).<br>\
0.7.9: Applications: Hockey Live, Basketball Live, Baseball Live (all courtesy of MoreSolutions).<br>\
0.7.8: Applications: Pack n Track, Pribbage, Top Stocks, Roll Quest, The Helicopter Game, Whendle, Bubble Puzzle (all courtesy of Audermars02), Time Tracker Full (courtesy of baldric).<br>\
0.7.7: Applications: Transformers G1, WOG Card Keeper (both courtesy of Audermars02).<br>\
0.7.6: Robustified initial loading of applications. Added the Installed Applications list.<br>\
0.7.5: Applications: MapTool, Just Pong, Match This, Consumption Calculator, UberRadio, Soccer 2010, TravelGuide, Wikay, OGCOpenInfo, My webOS Apps, FreeWeather (all courtesy of MetaView). Improved Mail Lists support.<br>\
0.7.4: Robustified saving and restoring multiple items.<br>\
0.7.3: Improved Deer Hunter 3D support.<br>\
0.7.2: Improved Govnah support.<br>\
0.7.1: Applications: Govnah, ClassicNote, Mail Lists, Shopping Manager, Super Contacts, Epocrates, Family Medical History, XboxLive Friends, Bible Reader KJV, Time Tracker, Deer Hunter 3D<br>\
0.7.0: Added initial support for saving and restoring Launcher icon positions<br>\
0.6.9: Applications: WSOP3, The Settlers<br>\
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
	chmod ugo+x build/src/scripts/*
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
