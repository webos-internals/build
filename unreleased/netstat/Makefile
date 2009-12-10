NAME     = netstat
TITLE    = Netstat
APP_ID   = org.daemon.de.${NAME}
VERSION  = 1.0.3
DEPENDS  = org.daemon.de.${NAME}d
TYPE     = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.daemon.de/PalmPreNetstat
ICON     = http://www.daemon.de/images/netstat.png
DESCRIPTION = This is an app aimed at german users of the GSM Pre using the O2 flatrate ('M Plan'). This flatrate is limited to 200 MB traffic. If you reach it your bandwidth will be limited from UMTS to GSM. However, O² does not provide any app to check how far you are at the limit.<br/> Here, Netstat, comes into play. It consists of two parts, a webOS daemon which collects traffic data; and the app displaying it. So far it just displays the traffic of the current month as can be seen in the screenshot. It is planned to show some nice graphs too, so you can see the traffic history per interface. The app reloads every 5 minutes.
CHANGELOG = 1.0.3: removed reload button, it reloads itself now
SCREENSHOTS = [\"http://www.daemon.de/images/netstat_2009-08-12_224929.png\"]
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
