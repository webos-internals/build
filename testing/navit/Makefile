NAME     = navit
TITLE    = Navit - Car navigation system
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION	 = 0.5.0.4113-1
TYPE     = Application
CATEGORY = Utilities
DESCRIPTION = <p><strong style="color:red">Please read the \
	<a href="http://en.m.webos-internals.org/wiki/Application:NavitReleaseNotes\#v${VERSION}">release notes</a> \
	before updating/installing this package!</strong></p> \
	<p>This package does not include map-data. Please visit \
	the <a href="http://en.m.webos-internals.org/wiki/Application:Navit">\
       	Homepage</a> to find out how to obtain and install maps.</p><p>Navit is \
       	an open source (GPL) car navigation software for Linux systems. It will \
       	display your position on a map (in bird-view mode or as a 3D \
       	"visualization") from GPS sensor data, and can provide precise route \
       	calculation, touch screen functionality and supports Points of Interest \
       	(POI), which can be extended via an easy to use plugin system. Unlike \
       	other navigation systems, Navit maps are dynamically generated in real \
       	time from vector data.</p>
CHANGELOG = \
	    0.5.0.4113-1: Update to svn r4113. Apply some optimzations and bugfixes to graphics output. <br/> \
	    0.5.0.4100-1: Update to svn r4100. Fix startup crash. <br/> \
	    0.5.0.4095-1: Update to svn r4095. Fix speedcam-warner. Modified layout and vehivleprofiles. See release notes. <br/> \
	    0.5.0.4077-1: Update to svn r4077. Hide speedcam-warner when there is nothing to show. <br/> \
	    0.5.0.3939-4: Update skin and menu. <br/> \
	    0.5.0.3939-3: Internal testing. <br/> \
	    0.5.0.3939-2: Internal testing. <br/> \
	    0.5.0.3939-1: Update to svn r3939. This removes the change that broke webOS 2.0 completely. Also the bookmark-menu-bug is fixed. <br/> \
	    0.5.0.3922-2: Fix a menu bug. <br/> \
	    0.5.0.3922-1: Update to svn r3922. Featuring a new menu layout. <br/> \
	    0.5.0.3904-1: Update to svn r3904. Reduce GPS lag to 15. <br/> \
	    0.5.0.3883-2: Fix fontdisplay in menus. <br/> \
	    0.5.0.3883-1: update to svn r3883. <br/> \
	    0.5.0.3873-1: update to svn r3873. <br/> \
	    0.5.0.3845-2: fix package description. <br/> \
	    0.5.0.3845-1: update to svn r3845. New config update handling. <br/> \
	    0.5.0.3839-1: update to svn r3839. Add better debug output for GPS. <br/> \
	    0.5.0.3832-1: update to svn r3832. <br/> \
	    0.2.0.3813-1: update to svn r3813. Now with paging for bookmarks <br/> \
	    0.2.0.3784-1: update to svn r3784. <br/> \
	    0.2.0.3771-1: update to svn r3771. Noteworthy changes include better font rendering, thanks to the upstream devs :) <br/> \
	    0.2.0.3690-1: update to svn r3690 <br/> \
	    0.2.0.3621-1: update to svn r3621, containing some bug-fixes <br/> \
	    0.2.0.3617-1: update to svn r3617, now with POI patch and some flaky support for the back gesture <br/> \
	    0.2.0.3591-1: update to svn r3591, remove POI patch <br/> \
	    0.2.0.3587-1: update to svn r3587, add POI optimization from ticket 619 <br/> \
	    0.2.0.3582-1: update to svn r3582, gets rid of "Unknown key e17", features new navit_layout.xml from HaPe <br/> \
	    0.2.0.3541-1: update ro svn r3541, now officially containing the sunrise-fix <br/> \
	    0.2.0.3540-1: update ro svn r3540 <br/> \
	    0.2.0.3537-2: Add support for Pixi <br/> \
	    0.2.0.3537-1: update to svn r3537; apply fix for sunrise/set calculation; use a smaller font for the next street name.<br/> \
	    0.2.0.3490-4: Make sure the maps-directory exists <br/> \
	    0.2.0.3490-3: Fixed wrong default speech engine <br/> \
	    0.2.0.3490-2: Initial release
SCREENSHOTS = [\"http://www.webos-internals.org/images/c/c7/NavitScreenshot2.jpg\",\
\"http://www.webos-internals.org/images/1/1e/NavitScreenshot1.jpg\",\
\"http://www.webos-internals.org/images/5/58/NavitScreenshot3.jpg\"]
DEPENDS  = org.webosinternals.locale, org.webosinternals.speechd
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Navit
ICON	 = http://www.webos-internals.org/images/4/4d/Navit_icon.png
LICENSE  = GPL
MINWEBOSVERSION = 1.4.5

D = build/$*/usr/palm/applications/${APP_ID}

SRC_GIT = git://git.webos-internals.org/applications/navit.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk
include ../../support/package.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

include ../../support/download.mk

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	>$@

.PHONY: build
build: build/.built-${VERSION}
build/.built-${VERSION}: build/armv7.built-${VERSION} build/armv6.built-${VERSION}
	>$@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	mkdir -p ${D}
	cp -r build/src/all/* build/src/$*/* ${D}
	cp -r build/src/all/.fonts build/src/$*/* ${D}
	sed -re "s/@VERSION@/${VERSION}/" ${D}/appinfo.json.in > ${D}/appinfo.json
	rm ${D}/appinfo.json.in
	>$@

build/%/CONTROL/postinst:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/postinst build/$*/CONTROL
	chmod ugo+x $@

clobber::
	rm -rf build git
