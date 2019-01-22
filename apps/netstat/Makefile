NAME     = netstat
TITLE    = Netstat
APP_ID   = org.daemon.de.${NAME}
BLDFLAGS = -p
VERSION  = 1.1.4
TYPE     = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webosnation.com/netstat
ICON     = http://i.imgur.com/yvj32.png
DESCRIPTION = This is an app aimed at users with a limited traffic plan. Netstat consists of two parts, a webOS daemon which collects traffic data; and the app displaying it. So far it just displays the traffic of the current month as can be seen in the screenshot. You can set a traffic limit in the preferences and a day when to reset traffic counters. It is planned to show some nice graphs too, so you can see the traffic history per interface. The app reloads every 5 minutes.
CHANGELOG = 1.1.4: fixed the cellular interface for the Pre 3.<br>1.1.3: fixed the cellular interface for the Veer.<br>1.1.2: fixed the cellular interface for the Pre 2.<br>1.1.0: merged the daemon and the application into a single package.<br>1.0.11: fixed typo in history-assistant.js<br/>1.0.10: fixed empty json output bug, added conditional db directory lookup to the history assistent<br/>1.0.9: fixed bug in displaying invalid graph, set version number correctly<br/>1.0.8: fixed path bug (same as in netstatd)<br/>1.0.7: added pixi support, added traffic limit feature<br/>1.0.6: Added history function, bugfix: listeners were not properly removed in cleanup()<br/>1.0.5: added reload button to the main screen<br/>added reset button to the preferences screen where you can reset counters manually<br/>added preferences screen where you can configure the start day of the accounting cycle<br/>1.0.4: fixed reload cycle and added delay for error state if daemon seems not to run<br/>1.0.3: removed reload button, it reloads itself now<br/>1.0.2: fixed error message if daemon is not running<br/>fixed about message, now it mentions the daemon, not the service<br/>1.0.1:removed lib directory (unused at the moment)<br/>increased version to 1.0.1<br/>fixed error message if daemon is not running to renamed daemon<br/>fixed copyright msg<br/>1.0.0: initial commit version 
SCREENSHOTS = [\"http://i.imgur.com/yvj32.png\",\
\"http://i.imgur.com/4k9no.png\",\
\"http://i.imgur.com/4k9no.png\"]
LICENSE  = BSD Open Source License

SRC_GIT = git://github.com/wosigh/netstat.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/.unpacked
	rm -rf build/all
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/all/usr/palm/applications/${APP_ID}/
	touch $@

build/all/CONTROL/prerm: build/.unpacked
	rm -f $@
	mkdir -p build/all/CONTROL
	install -m 0775 build/src/control/prerm build/all/CONTROL
	chmod ugo+x $@

build/all/CONTROL/postinst: build/.unpacked
	rm -f $@
	mkdir -p build/all/CONTROL
	install -m 0775 build/src/control/postinst build/all/CONTROL
	chmod ugo+x $@

.PHONY: clobber
clobber::
	rm -rf build
