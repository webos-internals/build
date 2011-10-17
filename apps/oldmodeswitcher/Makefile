NAME     = modeswitcher
MAINTAINER = sconix
TITLE    = Mode Switcher - Legacy
APP_ID   = com.palm.org.e-lnx.wee.apps.${NAME}
VERSION  = 1.1.1
TYPE     = Application
CATEGORY = System Utilities
HOMEPAGE = http://forums.precentral.net/showthread.php?p=2623085
ICON     = http://wee.e-lnx.org/webos/images/icons/modeswitcher.png
DESCRIPTION = Mode Switcher.
SCREENSHOTS = []
LICENSE  = BSD Open Source License
POSTINSTALLFLAGS = RestartLuna
POSTUPDATEFLAGS = RestartLuna
MINWEBOSVERSION = 1.0.0
MAXWEBOSVERSION = 1.9.9
CHANGELOG = \
1.1.1: Updated all googled docs import/export connections use https which should fix the login problems.<br>\
1.1.0: Changed title and prevented install on WebOS 2.x since Mode Switcher 2.x is now out.<br>\
1.0.9: Small change to display trigger, removed experimental code, fixed no match calendar trigger functionality.<br>\
1.0.8: Fixed two mode changing bugs and removed delay from display on trigger event.<br>\
1.0.7: Fixed starting bug with faulty configuration, calendar ringtone not saving, battery trigger, large delay options, silent switch trigger and made close all apps to not close phone app.<br>\
1.0.6: Added French translation and fixed default configuration option not having effect bug.<br>\
1.0.5: Fixed calendar trigger and bug in MS app handling. Also added dashboard notification dialog.<br>\
1.0.4: Fixed MS app handling on launch.<br>\
1.0.3: Fixed popup launcher.<br>\
1.0.2: Corrected the version.<br>\
1.0.1: Fixed a small bug.<br>\
1.0.0: Initial release.

SRC_GIT = git://git.webos-internals.org/applications/oldmodeswitcher.git

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
