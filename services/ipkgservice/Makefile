NAME     = ipkgservice
CLASS    = IPKGService
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.7.7
HOMEPAGE = http://www.preware.org/wiki/Application:Preware
MAINTAINER = WebOS Internals <service@webos-internals.org>
DESCRIPTION = Package Manager Service
TYPE = Service
SECTION = Services and Plugins

SERVICEFILES = build/src/${APP_ID}.service
PACKAGEPATH := $(subst .,/,${APP_ID})
CLASSFILES := $(addsuffix .class,$(addprefix ${PACKAGEPATH}/,${CLASSES}))


SRC_GIT = git://git.webos-internals.org/services/ipkgservice.git
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
	mkdir -p build/${NAME}/usr/palm/applications/${APP_ID}
	mv build/src/LICENSE build/src/app build/src/appinfo.json \
	   build/src/images build/src/index.html build/src/sources.json \
	   build/src/stylesheets build/${NAME}/usr/palm/applications/${APP_ID}/
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
	mkdir -p build/${NAME}/etc/event.d
	echo "start on started java-serviceboot" > build/${NAME}/etc/event.d/${APP_ID}
	echo "script" >> build/${NAME}/etc/event.d/${APP_ID}
	echo "/usr/bin/luna-helper 'luna://com.palm.vm/launch' '{\"serviceName\":\"${APP_ID}\",\"className\":\"${APP_ID}.${CLASS}\"}'" >> build/${NAME}/etc/event.d/${APP_ID}
	echo "end script" >> build/${NAME}/etc/event.d/${APP_ID}
	echo "respawn" >> build/${NAME}/etc/event.d/${APP_ID}
	mkdir -p build/${NAME}/etc/ipkg
	install -m 644 feeds/*.conf build/${NAME}/etc/ipkg/
	touch $@

build/${NAME}/CONTROL/postinst:
	rm -f $@
	mkdir -p build/${NAME}/CONTROL
	echo "#!/bin/sh" > $@
	echo "rm -f /usr/lib/luna/java/${APP_ID}.jar" >> $@
	echo "ln -s /var/usr/lib/luna/java/${APP_ID}.jar /usr/lib/luna/java/${APP_ID}.jar" >> $@
	echo "rm -f /usr/share/dbus-1/system-services/${APP_ID}.service" >> $@
	echo "ln -s /var/usr/share/dbus-1/system-services/${APP_ID}.service /usr/share/dbus-1/system-services/${APP_ID}.service" >> $@
	echo "/sbin/initctl stop java-serviceboot" >> $@
	echo "rm -f /etc/event.d/${APP_ID}" >> $@
	echo "cp /var/etc/event.d/${APP_ID} /etc/event.d/${APP_ID}" >> $@
	echo "/sbin/initctl start java-serviceboot" >> $@
	echo "echo \"src/gz all http://ipkg.preware.org/feeds/webos-internals/all\" > /var/etc/ipkg/webos-internals.conf" >> $@
	echo "echo \"src/gz \`/bin/uname -m\` http://ipkg.preware.org/feeds/webos-internals/\`/bin/uname -m\`\" >> /var/etc/ipkg/webos-internals.conf" >> $@
	echo "sed -i -e 's|armv7l|armv7|g' /var/etc/ipkg/webos-internals.conf" >> $@
	echo "rm -f /var/etc/ipkg/arch.conf" >> $@
	echo "ln -s /etc/ipkg/arch.conf /var/etc/ipkg/arch.conf" >> $@
	echo "exit 0" >> $@
	chmod ugo+x $@

build/${NAME}/CONTROL/prerm:
	rm -f $@
	mkdir -p build/${NAME}/CONTROL
	echo "#!/bin/sh" > $@
	echo "rm -f /usr/lib/luna/java/${APP_ID}.jar" >> $@
	echo "rm -f /usr/share/dbus-1/system-services/${APP_ID}.service" >> $@
	echo "/sbin/initctl stop java-serviceboot" >> $@
	echo "rm -f /etc/event.d/${APP_ID}" >> $@
	echo "/sbin/initctl start java-serviceboot" >> $@
	echo "exit 0" >> $@
	chmod ugo+x $@

include ../../support/application-package.mk

clobber::
	rm -rf build
