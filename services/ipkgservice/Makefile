NAME     = ipkgservice
CLASS    = IPKGService
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.9.1
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Preware
MAINTAINER = WebOS Internals <support@webos-internals.org>
TITLE	 = Package Manager Service
DESCRIPTION = The Package Manager Service is a back-end interface to the ipkg command line application which manages all packages that are installed on the Pre.  It is required for advanced homebrew installers like Preware.
CHANGELOG = 0.9.1: Added the optware feed.
TYPE	 = Service
CATEGORY = Services and Plugins
ICON	= http://www.webos-internals.org/images/7/77/Icon_WebOSInternals_PackageManager.png
LICENSE = GPL v2 Open Source
POSTINSTALLFLAGS = RestartJava
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
	mv build/src/LICENSE build/src/app build/src/appinfo.json \
	   build/src/images build/src/index.html build/src/sources.json \
	   build/src/stylesheets build/all/usr/palm/applications/${APP_ID}/
	touch $@

LUNAPATH = usr/lib/luna/java

.PHONY: build
build: build/.built

build/.built: build/src/${PACKAGEPATH}/${CLASS}.java
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
