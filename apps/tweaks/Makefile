NAME     = tweaks
TITLE    = Tweaks
APP_ID   = org.webosinternals.${NAME}
SRV_ID   = org.webosinternals.${NAME}.prefs
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 1.8.1
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Tweaks
ICON	 = http://www.webos-internals.org/images/2/2e/Tweaks-icon.png
DESCRIPTION = Tweaks for your webOS device.
MINWEBOSVERSION = 2.0.0
CHANGELOG = \
1.8.1: Fixed to use Mojo UI if Enyo framework is not available.<br>\
1.8.0: Made enyo the primary UI and added file picker widget.<br>\
1.6.5: Installation problems should be finally fixed.<br>\
1.6.4: Another small bug fix for the installation.<br>\
1.6.3: Fixed a small typo in the installation script.<br>\
1.6.2: Small fix for the installation of the service.<br>\
1.6.1: Fixed the black bar in Mojo UI for Pre3.<br>\
1.6.0: First public release of tweaks with enyo UI.<br>\
1.5.2: Small update for the tablet user interface.<br>\
1.5.1: Small bug fix for the tablet user interface.<br>\
1.5.0: Added enyo based user interface for the tablet.<br>\
1.3.3: Added more characters to be allowed for the text fields.<br>\
1.3.2: Promotional release to support sconix, no new features.<br>\
1.3.1: Fixed text field tweaks not count as new tweaks bug.<br>\
1.3.0: Added support for basic text field widget.<br>\
1.2.0: Work around the fatal webOS 2.x db permissions bug.  Remove and reinstall Tweaks *twice* to fix it.<br>\
1.1.0: Allow for the tweaks json file to override the owner value.<br>\
1.0.0: Initial public release.

SCREENSHOTS = [\
\"http://www.webos-internals.org/images/d/de/Tweaks_ss1.png\" ]

LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/applications/tweaks.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build/src/*.script
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/all.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/enjo-app/* build/$*/usr/palm/applications/${APP_ID}/
	mkdir -p build/$*/usr/palm/services/${SRV_ID}
	cp -r build/src/node-service/* build/$*/usr/palm/services/${SRV_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/node-service
	mkdir -p build/$*/usr/palm/packages/${APP_ID}
	cp -r build/src/package/* build/$*/usr/palm/packages/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/package
	touch $@

build/%/CONTROL/prerm:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/prerm build/$*/CONTROL
	chmod ugo+x $@

build/%/CONTROL/postinst:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/postinst build/$*/CONTROL
	chmod ugo+x $@

clobber::
	rm -rf build
