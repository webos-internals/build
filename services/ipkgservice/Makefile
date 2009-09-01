NAME     = ipkgservice
CLASS    = IPKGService
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.7.7
HOMEPAGE = http://www.preware.org/wiki/Application:Preware
MAINTAINER = WebOS Internals <support@webos-internals.org>
TITLE	 = Package Manager Service
DESCRIPTION = The Package Manager Service is a back-end interface to the ipkg command line application which manages all packages that are installed on the Pre.  It cannot be launched from the launcher screen - it can only be used by another application.  If you do see an icon for it in the launcher, just reboot and the icon will disappear.  Do not delete the icon.
TYPE	 = Service
CATEGORY = Services and Plugins
ICON	= http://www.webos-internals.org/images/7/77/Icon_WebOSInternals_PackageManager.png
LICENSE = GPL v2 Open Source

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
	echo "start on started java-serviceboot" > build/all/etc/event.d/${APP_ID}
	echo "script" >> build/all/etc/event.d/${APP_ID}
	echo "/usr/bin/luna-helper 'luna://com.palm.vm/launch' '{\"serviceName\":\"${APP_ID}\",\"className\":\"${APP_ID}.${CLASS}\"}'" >> build/all/etc/event.d/${APP_ID}
	echo "end script" >> build/all/etc/event.d/${APP_ID}
	echo "respawn" >> build/all/etc/event.d/${APP_ID}
	mkdir -p build/all/etc/ipkg
	install -m 644 feeds/*.conf build/all/etc/ipkg/
	touch $@

build/all/CONTROL/postinst:
	rm -f $@
	mkdir -p build/all/CONTROL
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

build/all/CONTROL/prerm:
	rm -f $@
	mkdir -p build/all/CONTROL
	echo "#!/bin/sh" > $@
	echo "rm -f /usr/lib/luna/java/${APP_ID}.jar" >> $@
	echo "rm -f /usr/share/dbus-1/system-services/${APP_ID}.service" >> $@
	echo "/sbin/initctl stop java-serviceboot" >> $@
	echo "rm -f /etc/event.d/${APP_ID}" >> $@
	echo "/sbin/initctl start java-serviceboot" >> $@
	echo "exit 0" >> $@
	chmod ugo+x $@

clobber::
	rm -rf build
