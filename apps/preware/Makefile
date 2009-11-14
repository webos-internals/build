NAME     = preware
TITLE	 = Preware
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.9.8
DEPENDS	 = org.webosinternals.ipkgservice
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Preware
ICON	 = http://www.webos-internals.org/images/e/e4/Icon_Preware.png
DESCRIPTION = The revolutionary webOS on-device installer capable of installing advanced homebrew applications.
CHANGELOG = 0.9.8: Serialised the gathering of data for Type:Unknown packages to fix the hangs.<br>0.9.7: Added preference to enable or disable fetching of additional information for Type:Unknown packages.<br>0.9.6: Added the initial startup screen. Fixed the display of packages with multiple maintainers. Now loads extended appinfo and control file information for Unknown packages. Changed default list second-line to version + maintainer. No longer allows back-gestures during package operations. Multi-line package titles are now supported. Show All Packages changed to Show Available Types and now defaults to No for new users.<br>0.9.5: Better error reporting, and more verbose status messages giving indications of how long it is reasonable to wait.<br>0.9.4: Added support for package dependencies.<br>0.9.3: Enabled feed management and added the webos-patches feed.  If you have previously installed Patches from the autopatch feed or the online repository, you should run the Emergency Patch Recovery application before using this first public release of the webos-patches feed.
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/7/7f/Preware_ss1.jpg\",\
\"http://www.webos-internals.org/images/4/41/Preware_ss2.jpg\",\
\"http://www.webos-internals.org/images/3/3b/Preware_ss3.jpg\",\
\"http://www.webos-internals.org/images/4/49/Preware_ss4.jpg\",\
\"http://www.webos-internals.org/images/4/4b/Preware_ss5.jpg\",\
\"http://www.webos-internals.org/images/6/6a/Preware_ss6.jpg\" ]
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/applications/preware.git

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
