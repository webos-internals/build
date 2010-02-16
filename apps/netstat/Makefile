NAME     = netstat
TITLE    = Netstat
APP_ID   = org.daemon.de.${NAME}
VERSION  = 1.0.9
DEPENDS  = org.daemon.de.${NAME}d
TYPE     = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.daemon.de/PalmPreNetstat
ICON     = http://www.daemon.de/images/netstat.png
DESCRIPTION = This is an app aimed at users with a limited traffic plan. Netstat consists of two parts, a webOS daemon which collects traffic data; and the app displaying it. So far it just displays the traffic of the current month as can be seen in the screenshot. You can set a traffic limit in the preferences and a day when to reset traffic counters. It is planned to show some nice graphs too, so you can see the traffic history per interface. The app reloads every 5 minutes.
CHANGELOG = 1.0.9: fixed bug in displaying invalid graph, set version number correctly<br/>1.0.8: fixed path bug (same as in netstatd)<br/>1.0.7: added pixi support, added traffic limit feature<br/>1.0.6: Added history function, bugfix: listeners were not properly removed in cleanup()<br/>1.0.5: added reload button to the main screen<br/>added reset button to the preferences screen where you can reset counters manually<br/>added preferences screen where you can configure the start day of the accounting cycle<br/>1.0.4: fixed reload cycle and added delay for error state if daemon seems not to run<br/>1.0.3: removed reload button, it reloads itself now<br/>1.0.2: fixed error message if daemon is not running<br/>fixed about message, now it mentions the daemon, not the service<br/>1.0.1:removed lib directory (unused at the moment)<br/>increased version to 1.0.1<br/>fixed error message if daemon is not running to renamed daemon<br/>fixed copyright msg<br/>1.0.0: initial commit version 
SCREENSHOTS = [\"http://www.daemon.de/images/netstat105main.png\",\
\"http://www.daemon.de/images/netstat105pref.png\",\
\"http://www.daemon.de/images/netstat106history.png\"]
LICENSE  = BSD Open Source License

SRC_GIT = git://git.webos-internals.org/applications/netstat.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.built-${VERSION} build/.unpack: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	tar -C build/all/usr/palm/applications/${APP_ID} -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build/all/usr/palm/applications/${APP_ID}/.git*
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
