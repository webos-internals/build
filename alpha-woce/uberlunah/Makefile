NAME = $(shell basename $(shell pwd))
TITLE = UberLunah
DEVICE = touchpad
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
CATEGORY = User Interface
VERSIONS = 4.1.0
APPINFO_DESCRIPTION = A collection of all the best LunaSysMgr improvements for the HP TouchPad, rolled into a single convenient installation package.<br><br>\
Current additions include:<ul>\
<li>App switching bezel gestures.</li>\
<li>Tabbed card support.</li>\
<li>Infinite card cycling.</li>\
<li>Maximizable edge cards.</li>\
<li>Lower minimum brightness for better night-time reading.</li>\
<li>A status bar search button.</li>\
<li>More responsive gesture detection.</li>\
<li>Other various user interface refinements and improvements.</li>\
</ul>\
All additions are controlled by using the Tweaks application.<br>\
You need to remove your PIN code before installing this package, and all your saved passwords will need to be entered again.<br>
APPINFO_CHANGELOG = [ \
{ "version" : "4.1.0", "log" : [ "Added some more features" ] }, \
{ "version" : "4.0.0", "log" : [ "Initial public release" ] } \
]

HOMEPAGE = http://www.webos-ports.org
TYPE = OS Application

include ../../support/woce.mk

build/arm.built-${VERSION}: ${WEBOS_DOCTOR}
	rm -rf build/arm
	mkdir -p build/arm/usr/palm/applications/${APP_ID}/additional_files
	unzip -p $< resources/webOS.tar | \
	${TAR} -O -x -f - ./nova-cust-image-${CODENAME}.rootfs.tar.gz | \
	${TAR} -C build/arm/usr/palm/applications/${APP_ID}/additional_files/ -m -z -x -f - ./md5sums.gz
	gunzip -f build/arm/usr/palm/applications/${APP_ID}/additional_files/md5sums.gz
	mkdir -p build/arm/usr/palm/applications/${APP_ID}/additional_files/etc/event.d
	cp upstart/LunaSysMgr build/arm/usr/palm/applications/${APP_ID}/additional_files/etc/event.d/LunaSysMgr
	mkdir -p build/arm/usr/palm/applications/${APP_ID}/additional_files/usr/bin
	cp bin/LunaSysMgr build/arm/usr/palm/applications/${APP_ID}/additional_files/usr/bin/LunaSysMgr
	mkdir -p build/arm/usr/palm/applications/${APP_ID}/additional_files/tweaks
	cp tweaks/* build/arm/usr/palm/applications/${APP_ID}/additional_files/tweaks
	touch $@

build/.unpacked-${VERSION}:
	touch $@
