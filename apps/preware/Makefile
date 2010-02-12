NAME     = preware
TITLE	 = Preware
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
VERSION  = 0.9.22
DEPENDS	 = org.webosinternals.ipkgservice
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Preware
ICON	 = http://www.webos-internals.org/images/e/e4/Icon_Preware.png
DESCRIPTION = The revolutionary webOS on-device installer capable of installing advanced homebrew applications, themes, patches, services and plugins.  Preware is also able to access official Palm App Catalog feeds.
CHANGELOG = 0.9.22: Added Italian translation support, courtesy of Federico Pietta (Darkmagister).<br>0.9.21: Added German translation support, courtesy of Volker Zota (DocZet) and Thomas Linden (debilater). Fixed bug in updating Linux Daemon packages.<br>0.9.20: Fixed an error in the French support which prevented Preware from loading.<br>0.9.19: Localization support and French translations added, courtesy of Yannick LE NY. Fixed the OnFeeds split error, caused by zero length feed config files. Now continues to load the package feeds after an update error.<br>0.9.18: Added second line options for feed, price & feed, and price & version & feed. Added reporting of each feed index file as it is being downloaded.<br>0.9.16: Removed the partial app limit fix (obsolete as of webOS 1.3.5).<br>0.9.15: Added Palm App Catalog feeds, including price information.<br>0.9.14: Added support for installation of signed packages without confirmation. Fixed the auto-configuration of disabled webos-patches feeds.<br>0.9.13: Enabled the Update All button, and added support for skipping restart actions (e.g. when installing multiple patches).<br>0.9.12: Added a fix for the recurring splash screen.<br>0.9.11: Added a preference for the partial app limit fix.<br>0.9.10: Added support for theme categories.
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
