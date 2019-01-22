NAME     = ledmanager
CLASS    = LEDManager
APP_ID   = net.vertigostudios.${NAME}
SIGNER   = net.vertigostudios
VERSION  = 0.2.3
MAXWEBOSVERSION = 1.9.9
HOMEPAGE = http://forums.precentral.net/vertigo-studios/187407-my-flashlight-7-1-a.html
MAINTAINER = PreGame
TITLE	 = LED Manager Service
DESCRIPTION = The LED Manager Service is a back-end interface which controls the camera flash.  It is required for the My Flashlight application.
CHANGELOG = 0.2.3: Added additional status checking method<br>0.2.1: Fixed the post-install script for compatibility with both webOS 1.3.1 and webOS 1.3.5.<br>0.2.0: Rewritten for webOS 1.3.5
TYPE	 = Service
CATEGORY = Luna
ICON	= http://www.webos-internals.org/images/d/dd/Icon_Service_LED.png
LICENSE = GPL v2 Open Source
POSTINSTALLFLAGS = RestartJava
POSTUPDATEFLAGS  = RestartJava
POSTREMOVEFLAGS  = RestartJava

SERVICEFILES = build/src/${APP_ID}.service
PACKAGEPATH := $(subst .,/,${APP_ID})
CLASSFILES := $(addsuffix .class,$(addprefix ${PACKAGEPATH}/,${CLASSES}))

SRC_GIT = git://github.com/wosigh/ledmanager.git

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
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	${MAKE} ${JARFILES}
	install -m 644 ${JARFILES} build/src/
	touch $@

LUNAPATH = usr/lib/luna/java

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/.unpacked-${VERSION}
	rm -f $@
	( cd build/src ; ant build jar )
	mkdir -p build/all/${LUNAPATH}
	install -m 644 build/src/${APP_ID}.jar build/all/${LUNAPATH}/
	mkdir -p build/all/usr/share/dbus-1/system-services
	install -m 644 ${SERVICEFILES} build/all/usr/share/dbus-1/system-services/
	mkdir -p build/all/etc/event.d
	install -m 644 build/src/upstart/${APP_ID} build/all/etc/event.d/${APP_ID}
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
