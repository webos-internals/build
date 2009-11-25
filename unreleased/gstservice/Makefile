NAME     = gstservice
CLASS    = GstService
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.2.3
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Precorder
MAINTAINER = Zsoc <precorder.webosinternals@gmail.com>, Jason Robitaille, Rod Whitby
TITLE	 = GStreamer Service
DESCRIPTION = The GStreamer Service is a back-end interface for the Precorder application.  It is not an application in itself and does not appear in the launcher when installed.
CHANGELOG = 
TYPE	 = Service
CATEGORY = Luna
ICON	= http://www.webos-internals.org/images/a/ac/Icon_WebOSInternals_Camera.png
LICENSE = MIT Open Source
POSTINSTALLFLAGS = RestartJava
POSTREMOVEFLAGS  = RestartJava

SERVICEFILES = build/src/${APP_ID}.service
PACKAGEPATH := $(subst .,/,${APP_ID})
CLASSFILES := $(addsuffix .class,$(addprefix ${PACKAGEPATH}/,${CLASSES}))

SRC_GIT = git://git.webos-internals.org/services/gstservice.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_armv7.ipk
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
	touch $@

LUNAPATH = usr/lib/luna/java

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv6.built build/armv7.built
	touch $@

build/%.built: build/src/${PACKAGEPATH}/${CLASS}.java
	rm -f $@
	( cd build/src ; ant build jar )
	mkdir -p build/$*/${LUNAPATH}
	install -m 644 build/src/${APP_ID}.jar build/$*/${LUNAPATH}/
	mkdir -p build/$*/usr/share/dbus-1/system-services
	install -m 644 ${SERVICEFILES} build/$*/usr/share/dbus-1/system-services/
	mkdir -p build/$*/etc/event.d
	install -m 644 build/src/upstart/${APP_ID} build/$*/etc/event.d/${APP_ID}
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	install -m 644 build/src/LICENSE build/$*/usr/palm/applications/${APP_ID}/
	install -m 644 build/src/binaries/README build/$*/usr/palm/applications/${APP_ID}/
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/binaries/gst-launch build/$*/usr/palm/applications/${APP_ID}/bin/
	touch $@

build/%/CONTROL/postinst:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/postinst build/$*/CONTROL
	chmod ugo+x $@

build/%/CONTROL/prerm:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/prerm build/$*/CONTROL
	chmod ugo+x $@

clobber::
	rm -rf build
