NAME     = preware
TITLE	 = Preware
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
VERSION  = 0.9.36
DEPENDS	 = org.webosinternals.ipkgservice
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Preware
ICON	 = http://www.webos-internals.org/images/e/e4/Icon_Preware.png
DESCRIPTION = The revolutionary webOS on-device installer capable of installing advanced homebrew applications, themes, patches, services and plugins.  Preware is also able to access official Palm App Catalog feeds.  Requires webOS 1.3.5 or later.
CHANGELOG = 0.9.36: Added searching from the main screen. Added the ability to email an IPKG Log. Added warning message for custom feed additions, and robustified the feed management page. Added support for kernel packages.<br>0.9.35: Added Saved Package List functionality for saving and restoring your list of installed packages. Updated German translations, courtesy of Markus Leutwyler (swisstomcat). Restricted new feed names to lower case characters for consistency.<br>0.9.33: Restricted input character set for new custom feed names. Fixed javascript timeout problem with large feeds.<br>0.9.31: Renamed Fix Unknown Types to Scan Unknown Packages, and now reports the id of the package being scannned.<br>0.9.30: Now chooses the correct information to display for packages in multiple feeds.<br>0.9.29: Added option to search package descriptions instead of just the titles. Integrated Luna Manager into Preware, find it in the app menu.<br>0.9.28: Added support for displaying the countries for which an application is released.<br>0.9.27: Fixed a serious bug in update subscription handling. Now hides the price sort option when none of the loaded packages have any prices.
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/3/36/Preware_ss1.png\",\
\"http://www.webos-internals.org/images/9/97/Preware_ss2.png\",\
\"http://www.webos-internals.org/images/6/6f/Preware_ss2a.png\",\
\"http://www.webos-internals.org/images/e/e6/Preware_ss2b.png\",\
\"http://www.webos-internals.org/images/8/8a/Preware_ss3.png\",\
\"http://www.webos-internals.org/images/a/a1/Preware_ss4.png\",\
\"http://www.webos-internals.org/images/2/28/Preware_ss5.png\",\
\"http://www.webos-internals.org/images/e/e1/Preware_ss6.png\",\
\"http://www.webos-internals.org/images/5/55/Preware_ss7.png\",\
\"http://www.webos-internals.org/images/9/94/Preware_ss8.png\",\
\"http://www.webos-internals.org/images/e/ea/Preware_ss9.png\",\
\"http://www.webos-internals.org/images/b/bc/Preware_ss10.png\",\
\"http://www.webos-internals.org/images/7/75/Preware_ss11.png\" ]
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
