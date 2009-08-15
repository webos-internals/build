NAME     = ipkgservice
CLASS    = IPKGService
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.0.3
PLATFORM = all
HOMEPAGE = http://www.preware.org/wiki/Application:IPKG_Service
MAINTAINER = WebOS Internals <service@webos-internals.org>
DESCRIPTION = IPKG Service
SECTION = libs

SERVICEFILES = build/src/${APP_ID}.service
PACKAGEPATH := $(subst .,/,${APP_ID})
CLASSFILES := $(addsuffix .class,$(addprefix ${PACKAGEPATH}/,${CLASSES}))


SRC_GIT = git://gitorious.org/webos-internals/applications.git
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
	rm -rf build build.tmp
	mkdir -p build.tmp
	tar -C build.tmp -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mkdir -p build
	cp -r build.tmp/${NAME} build/src
	rm -rf build.tmp
	${MAKE} ${JARFILES}
	install -m 644 ${JARFILES} build/src/
	touch $@

LUNAPATH = usr/lib/luna/java

.PHONY: build
build: build/.built

build/.built: build/src/${PACKAGEPATH}/${CLASS}.java
	rm -f $@
	( cd build/src ; ant build jar )
	mkdir -p build/${NAME}/${LUNAPATH}
	install -m 644 build/src/${APP_ID}.jar build/${NAME}/${LUNAPATH}/
	mkdir -p build/${NAME}/usr/share/dbus-1/system-services
	install -m 644 ${SERVICEFILES} build/${NAME}/usr/share/dbus-1/system-services/
	touch $@

build/${NAME}/CONTROL/postinst:
	rm -f $@
	mkdir -p build/${NAME}/CONTROL
	echo "#!/bin/sh" > $@
	echo "rm -f /usr/lib/luna/java/${APP_ID}.jar" >> $@
	echo "ln -s /var/usr/lib/luna/java/${APP_ID}.jar /usr/lib/luna/java/${APP_ID}.jar" >> $@
	echo "rm -f /usr/share/dbus-1/system-services/${APP_ID}.service" >> $@
	echo "ln -s /var/usr/share/dbus-1/system-services/${APP_ID}.service /usr/share/dbus-1/system-services/${APP_ID}.service" >> $@
	echo "exit 0" >> $@
	chmod ugo+x $@

build/${NAME}/CONTROL/prerm:
	rm -f $@
	mkdir -p build/${NAME}/CONTROL
	echo "#!/bin/sh" > $@
	echo "rm -f /usr/lib/luna/java/${APP_ID}.jar" >> $@
	echo "rm -f /usr/share/dbus-1/system-services/${APP_ID}.service" >> $@
	echo "exit 0" >> $@
	chmod ugo+x $@

include ../../support/service-package.mk

clobber::
	rm -rf build
