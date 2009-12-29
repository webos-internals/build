NAME     = ipkgservice
CLASS    = IPKGService
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
VERSION  = 0.9.24.3
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Preware
MAINTAINER = WebOS Internals <support@webos-internals.org>
TITLE	 = Package Manager Service
DESCRIPTION = The Package Manager Service is a back-end interface to the ipkg command line application which manages all packages that are installed on the Pre.  It is required for advanced homebrew installers like Preware.
CHANGELOG = 0.9.24.3: Assist the automatic migration of packages in webOS 1.3.5<br>0.9.24.1: You can enable a smoother transition to webOS 1.3.5 by installing this first.<br>0.9.24: Added restartDevice service method.<br>0.9.23: Detect and report ipkg errors that are not reflected in the ipkg tool return value.<br>0.9.22: Updated for future webOS compatibility.<br>0.9.21: Fixed the support for enabling and disabling the ipkg wrapper, and hopefully fixed the package manager service startup bug.<br>0.9.20: Added a work-around for the Package Manager Service not starting problem.<br>0.9.19: Added support for Pixi binaries. PreThemer feed now using a faster non-mirrored feed.<br>0.9.18: Added methods for enabling and disabling the ipkg wrapper.<br>0.9.17: Removed PreYourMind.org feed at the request of the owner of that site (it is shutting down). PreThemer feed now uses the PreThemer.com mirror on preware.org to fix evdo access errors to that site.<br>0.9.16: Made the ipkg wrapper handle both the less than 64MiB installed and greater than 64MiB installed scenarios.<br>0.9.15: Update version-specific webos-patches feed on each boot.<br>0.9.14: Added support for version specific feeds.
TYPE	 = Service
CATEGORY = Luna
ICON	= http://www.webos-internals.org/images/7/77/Icon_WebOSInternals_PackageManager.png
LICENSE = GPL v2 Open Source
POSTINSTALLFLAGS = RestartJava
POSTUPDATEFLAGS  = RestartJava
POSTREMOVEFLAGS  = RestartJava

SERVICEFILES = build/src/${APP_ID}.service
PACKAGEPATH := $(subst .,/,${APP_ID})
CLASSFILES := $(addsuffix .class,$(addprefix ${PACKAGEPATH}/,${CLASSES}))

SRC_GIT = git://git.webos-internals.org/services/ipkgservice.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

JARFILES = \
	build/java/serviceframework.jar \
	build/java/json.jar \
	build/java/lunaservice.jar \
	build/java/Utils.jar

include ../../support/service-jars.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked build/src/${PACKAGEPATH}/${CLASS}.java: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	${MAKE} ${JARFILES}
	install -m 644 ${JARFILES} build/src/
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	mv build/src/LICENSE build/src/app build/src/appinfo.json build/src/icon.png \
	   build/src/images build/src/index.html build/src/sources.json \
	   build/src/stylesheets build/src/files \
	   build/all/usr/palm/applications/${APP_ID}/
	touch $@

LUNAPATH = usr/lib/luna/java

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/src/${PACKAGEPATH}/${CLASS}.java
	rm -f $@
	( cd build/src ; ant build jar )
	mkdir -p build/all/${LUNAPATH}
	install -m 644 build/src/${APP_ID}.jar build/all/${LUNAPATH}/
	mkdir -p build/all/usr/share/dbus-1/system-services
	install -m 644 ${SERVICEFILES} build/all/usr/share/dbus-1/system-services/
	mkdir -p build/all/etc/event.d
	install -m 644 build/src/upstart/${APP_ID} build/all/etc/event.d/${APP_ID}
	mkdir -p build/all/etc/ipkg
	install -m 644 feeds/*.conf build/all/etc/ipkg/
	touch $@

build/all/CONTROL/postinst:
	rm -f $@
	mkdir -p build/all/CONTROL
	install -m 0775 build/src/control/postinst build/all/CONTROL
	chmod ugo+x $@

build/all/CONTROL/prerm:
	rm -f $@
	mkdir -p build/all/CONTROL
	install -m 0775 build/src/control/prerm build/all/CONTROL
	chmod ugo+x $@

clobber::
	rm -rf build
