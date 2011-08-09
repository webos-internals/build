NAME     = tide
TITLE    = TouchPad IDE
APP_ID   = us.ryanhope.${NAME}
SRV_ID   = us.ryanhope.${NAME}.fileio
SIGNER   = org.webosinternals
BLDFLAGS = -p
BASEVER  = 0.0.23
GIT_TAG  = v${BASEVER}
VERSION  = ${BASEVER}
TYPE	 = Application
CATEGORY = Development
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Tide
ICON	 = http://www.webos-internals.org/images/0/02/Icon-64.png
DESCRIPTION = A code editor (and soon more) for your TouchPad.
MINWEBOSVERSION = 3.0.0

CHANGELOG = \
<table cellspacing='12px'>\
<tr><td align='right'>v0.0.23</td><td>- Spinner+scrim when opening/saving files</td></tr>\
<td></td><td>- File dialog starts in path of last opened file</td></tr>\
<tr><td align='right'>v0.0.22</td><td>- Smaller toolbar</td></tr>\
<tr><td align='right'>v0.0.21</td><td>- Fix spinner issue for file dialog with no files</td></tr>\
<td></td><td>- Add cut/copy/paste menu buttons (keybindings to come)</td></tr>\
<td></td><td>- VSlider fixes/enhancements</td></tr>\
<tr><td align='right'>v0.0.20</td><td>- Add pref to set default path for file dialogs</td></tr>\
<tr><td align='right'>v0.0.19</td><td>- Mostly working scroller (still needs a little work)</td></tr>\
<td></td><td>- Add back text selection (no copy/cut/paste yet)</td></tr>\
<tr><td align='right'>v0.0.18</td><td>- Add highlight support for Scala, OCaml, SCAD, Groovy</td></tr>\
<td></td><td>- Add pref to show/hide gutter</td></tr>\
<tr><td align='right'>v0.0.17</td><td>- More file dialog fixes</td></tr>\
<tr><td align='right'>v0.0.16</td><td>- Improved BT keyboard support</td></tr>\
<td></td><td>- Fixed save file dialog</td></tr>\
<tr><td align='right'>v0.0.15</td><td>- Backfill changelog</td></tr>\
<tr><td align='right'>v0.0.14</td><td>- Add this awesome changelog</td></tr>\
<tr><td align='right'>v0.0.13</td><td>- Saving files works</td></tr>\
<td></td><td>- Hidden files toggle works</td></tr>\
<tr><td align='right'>v0.0.11</td><td>- Unjail node service</td></tr>\
<tr><td align='right'>v0.0.10</td><td>- File dialog improvements</td></tr>\
<td></td><td>- Auto set syntax highlight mode based on file extension</td></tr>\
<tr><td align='right'> v0.0.8</td><td>- Remove demo documents</td></tr>\
<tr><td align='right'> v0.0.5</td><td>- Working prefs menu</td></tr>\
<td></td><td>- Properly size editor area</td></tr>\
<td></td><td>- Use fullscreen mode</td></tr>\
<td></td><td>- Add nice buttons to toolbar</td></tr>\
<tr><td align='right'> v0.0.3</td><td>- Disable text highlighting for better scrolling</td></tr>\
<td></td><td>- Switch name from Editah to Tide</td></tr>\
<td></td><td>- Add more demo docs</td></tr>\
</table>

SCREENSHOTS = [\
\"http://www.webos-internals.org/images/d/d0/Tide_2011-07-08_164058.png\" ]

LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/enyo/editah.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	#cp -r ~/workspace/editah/* build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	#cd build/src; git submodule update --init --recursive
	mkdir build/src/control
	mv build/src/pmPostInstall.script build/src/control/postinst
	mv build/src/pmPreRemove.script build/src/control/prerm
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/all.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	cd build/src; rm -rf ace; mv ace-build ace
	#make clean ace/build/src/ace.js;\
	#rm -rf `cat excludes.txt`;\
	#rm -rf Makefile;\
	#rm -rf `find . -name ".git*"`
	mkdir -p build/$*/usr/palm/services
	cp -r build/src/node-service build/$*/usr/palm/services/${SRV_ID}
	mkdir -p build/$*/usr/palm/packages
	cp -r build/src/package build/$*/usr/palm/packages/${APP_ID}
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/node-service
	rm -rf build/$*/usr/palm/applications/${APP_ID}/package
	rm -rf build/$*/usr/palm/applications/${APP_ID}/control
	touch $@

build/%/CONTROL/prerm:
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/prerm build/$*/CONTROL
	chmod ugo+x $@

build/%/CONTROL/postinst:
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/postinst build/$*/CONTROL
	chmod ugo+x $@

clobber::
	rm -rf build
