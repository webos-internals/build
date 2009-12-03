NAME     = wolservice
CLASS    = WOLService
APP_ID   = com.thebitguru.${NAME}
VERSION  = 0.5.0
HOMEPAGE = 
MAINTAINER = 
TITLE	 = WakeOnLAN Service
DESCRIPTION = 
CHANGELOG = 
TYPE	 = Service
CATEGORY = Luna
ICON	= 
LICENSE = MIT Open Source
POSTINSTALLFLAGS = RestartJava
POSTREMOVEFLAGS  = RestartJava

SERVICEFILES = build/src/${APP_ID}.service
PACKAGEPATH := $(subst .,/,${APP_ID})
CLASSFILES := $(addsuffix .class,$(addprefix ${PACKAGEPATH}/,${CLASSES}))

SRC_GIT = git://git.webos-internals.org/services/wolservice.git

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

build/.unpacked build/src/${CLASS}.java: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	${MAKE} ${JARFILES}
	install -m 644 ${JARFILES} build/src/
	touch $@

LUNAPATH = usr/lib/luna/java

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/src/${CLASS}.java
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
