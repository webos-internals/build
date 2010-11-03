# Makefile for PreWare
#
# Copyright (C) 2009 by Rod Whitby <rod@whitby.id.au>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
#

SUBDIRS = apps services daemons linux
KERNDIR = kernels
PTCHDIR = autopatch

.PHONY: index package toolchain upload clobber clean


.PHONY: index
index:  webos-internals-index \
	webos-patches-index \
	webos-kernels-index \
	optware-index \
	ipkgs/precentral/Packages ipkgs/precentral-themes/Packages \
	palm-index

.PHONY: optware-index
optware-index: ipkgs/optware/all/Packages ipkgs/optware/i686/Packages ipkgs/optware/armv6/Packages ipkgs/optware/armv7/Packages

.PHONY: palm-index
palm-index: ipkgs/palm-catalog/Packages ipkgs/palm-beta/Packages ipkgs/palm-web/Packages \
	    ipkgs/palm-catalog-updates/Packages ipkgs/palm-beta-updates/Packages ipkgs/palm-web-updates/Packages

.PHONY: webos-patches-index
webos-patches-index: ipkgs/webos-patches/1.4.5/Packages ipkgs/webos-patches/2.0.0/Packages

.PHONY: webos-kernels-index
webos-kernels-index: ipkgs/webos-kernels/1.4.5/Packages ipkgs/webos-kernels/2.0.0/Packages

.PHONY: regression-index
regression-index: ipkgs/regression-testing/1.0.0/Packages ipkgs/regression-testing/2.0.0/Packages 

.PHONY: webos-internals-index
webos-internals-index: ipkgs/webos-internals/all/Packages ipkgs/webos-internals/i686/Packages ipkgs/webos-internals/armv6/Packages ipkgs/webos-internals/armv7/Packages	

ipkgs/webos-internals/%/Packages: package-subdirs
	rm -rf ipkgs/webos-internals/$*
	mkdir -p ipkgs/webos-internals/$*
	if [ "$*" = "i686" -o "$*" = "all" ] ; then \
	  ( find ${SUBDIRS} -mindepth 2 -maxdepth 2 -type d -name ipkgs -print | \
	    xargs -I % find % -name "*_$*.ipk" -print | \
	    xargs -I % rsync -i -a % ipkgs/webos-internals/$* ) ; \
	else \
	  ( find ${SUBDIRS} -mindepth 2 -maxdepth 2 -type d -name ipkgs -print | \
	    xargs -I % find % \( -name "*_$*.ipk" -o -name "*_arm.ipk" \) -print | \
	    xargs -I % rsync -i -a % ipkgs/webos-internals/$* ) ; \
	fi	
	TAR_OPTIONS=--wildcards \
	toolchain/ipkg-utils/ipkg-make-index \
		-v -p ipkgs/webos-internals/$*/Packages ipkgs/webos-internals/$*
	gzip -c ipkgs/webos-internals/$*/Packages > ipkgs/webos-internals/$*/Packages.gz

ipkgs/webos-patches/%/Packages: package-webos-patches
	rm -rf ipkgs/webos-patches/$*
	mkdir -p ipkgs/webos-patches/$*
	( find ${PTCHDIR} -mindepth 2 -maxdepth 2 -type d -name ipkgs -print | \
	  xargs -I % find % -name "*_$*-*_all.ipk" -print | \
	  xargs -I % rsync -i -a % ipkgs/webos-patches/$* )
	TAR_OPTIONS=--wildcards \
	toolchain/ipkg-utils/ipkg-make-index \
		-v -p ipkgs/webos-patches/$*/Packages ipkgs/webos-patches/$*
	gzip -c ipkgs/webos-patches/$*/Packages > ipkgs/webos-patches/$*/Packages.gz

ipkgs/webos-kernels/%/Packages: package-webos-kernels
	rm -rf ipkgs/webos-kernels/$*
	mkdir -p ipkgs/webos-kernels/$*
	( find ${KERNDIR} -mindepth 2 -maxdepth 2 -type d -name ipkgs -print | \
	  xargs -I % find % -name "*_$*-*_*.ipk" -print | \
	  xargs -I % rsync -i -a % ipkgs/webos-kernels/$* )
	TAR_OPTIONS=--wildcards \
	toolchain/ipkg-utils/ipkg-make-index \
		-v -p ipkgs/webos-kernels/$*/Packages ipkgs/webos-kernels/$*
	gzip -c ipkgs/webos-kernels/$*/Packages > ipkgs/webos-kernels/$*/Packages.gz

ipkgs/optware/%/Packages: package-optware
	rm -rf ipkgs/optware/$*
	mkdir -p ipkgs/optware/$*
	if [ "$*" = "i686" -o "$*" = "all" ] ; then \
	  ( find optware -mindepth 2 -maxdepth 2 -type d -name ipkgs -print | \
	    xargs -I % find % -name "*_$*.ipk" -print | \
	    xargs -I % rsync -i -a % ipkgs/optware/$* ) ; \
	else \
	  ( find optware -mindepth 2 -maxdepth 2 -type d -name ipkgs -print | \
	    xargs -I % find % \( -name "*_$*.ipk" -o -name "*_arm.ipk" \) -print | \
	    xargs -I % rsync -i -a % ipkgs/optware/$* ) ; \
	fi	
	TAR_OPTIONS=--wildcards \
	toolchain/ipkg-utils/ipkg-make-index \
		-v -p ipkgs/optware/$*/Packages ipkgs/optware/$*
	gzip -c ipkgs/optware/$*/Packages > ipkgs/optware/$*/Packages.gz

ipkgs/regression-testing/%/Packages: package-regression
	rm -rf ipkgs/regression-testing/$*
	mkdir -p ipkgs/regression-testing/$*
	( find regression -mindepth 2 -maxdepth 2 -type d -name ipkgs -print | \
	  xargs -I % find % -name "*_$*_all.ipk" -print | \
	  xargs -I % rsync -i -a % ipkgs/regression-testing/$* )
	TAR_OPTIONS=--wildcards \
	toolchain/ipkg-utils/ipkg-make-index \
		-v -p ipkgs/regression-testing/$*/Packages ipkgs/regression-testing/$*
	gzip -c ipkgs/regression-testing/$*/Packages > ipkgs/regression-testing/$*/Packages.gz

ipkgs/palm-%/Packages: package-feeds
	rm -rf ipkgs/palm-$*
	mkdir -p ipkgs/palm-$*
	cp feeds/palm-$*/build/Metadata ipkgs/palm-$*/Packages
	gzip -c ipkgs/palm-$*/Packages > ipkgs/palm-$*/Packages.gz

ipkgs/%/Packages: package-feeds
	rm -rf ipkgs/$*
	mkdir -p ipkgs/$*
	( find feeds/$* -mindepth 1 -maxdepth 1 -type d -name ipkgs -print | \
	  xargs -I % find % -name "*.ipk" -print | \
	  xargs -I % rsync -i -a % ipkgs/$* )
	TAR_OPTIONS=--wildcards \
	toolchain/ipkg-utils/ipkg-make-index \
		-v -p ipkgs/$*/Packages ipkgs/$*
	mv ipkgs/$*/Packages ipkgs/$*/Packages.orig
	scripts/merge-metadata.py feeds/$*/build/Metadata ipkgs/$*/Packages.orig > ipkgs/$*/Packages
	rm -f ipkgs/$*/Packages.orig*
	gzip -c ipkgs/$*/Packages > ipkgs/$*/Packages.gz

package: package-subdirs package-webos-patches package-webos-kernels package-optware package-feeds

package-subdirs: toolchain
	for f in `find ${SUBDIRS} -mindepth 1 -maxdepth 1 -type d -print` ; do \
	  if [ -e $$f/Makefile ]; then \
	    ${MAKE} -C $$f package ; \
	  else \
	    rm -rf $$f ; \
	  fi; \
	done

package-webos-patches:
	for f in `find ${PTCHDIR} -mindepth 1 -maxdepth 1 -type d -print` ; do \
	  if [ -e $$f/Makefile ]; then \
	    ${MAKE} -C $$f package ; \
	  else \
	    rm -rf $$f ; \
	  fi; \
	done

package-webos-kernels:
	for f in `find ${KERNDIR} -mindepth 1 -maxdepth 1 -type d -print` ; do \
	  if [ -e $$f/Makefile ]; then \
	    ${MAKE} -C $$f package ; \
	  else \
	    rm -rf $$f ; \
	  fi; \
	done

package-optware: toolchain
	for f in `find optware -mindepth 1 -maxdepth 1 -type d -print` ; do \
	  if [ -e $$f/Makefile ]; then \
	    ${MAKE} -C $$f package ; \
	  else \
	    rm -rf $$f ; \
	  fi; \
	done

package-regression: toolchain
	for f in `find regression -mindepth 1 -maxdepth 1 -type d -print` ; do \
	  if [ -e $$f/Makefile ]; then \
	    ${MAKE} -C $$f package ; \
	  else \
	    rm -rf $$f ; \
	  fi; \
	done

package-feeds: toolchain
	for f in `find feeds -mindepth 1 -maxdepth 1 -type d -print` ; do \
	  if [ -e $$f/Makefile ]; then \
	    ${MAKE} -C $$f package ; \
	  else \
	    rm -rf $$f ; \
	  fi; \
	done

toolchain: toolchain/ipkg-utils/ipkg-make-index \
	   toolchain/cs07q3armel/build/arm-2007q3 \
	   toolchain/i686-unknown-linux-gnu/build/i686-unknown-linux-gnu \
	   staging/usr/include/mjson/json.h \
	   staging/usr/include/lunaservice.h \
	   staging/usr/include/glib.h

toolchain/cs07q3armel/build/arm-2007q3:
	${MAKE} -C toolchain/cs07q3armel unpack

toolchain/i686-unknown-linux-gnu/build/i686-unknown-linux-gnu:
	${MAKE} -C toolchain/i686-unknown-linux-gnu unpack

staging/usr/include/mjson/json.h:
	${MAKE} -C toolchain/mjson stage

staging/usr/include/lunaservice.h:
	${MAKE} -C toolchain/lunaservice stage

staging/usr/include/glib.h:
	${MAKE} -C toolchain/glib stage

upload:
	rsync -avr ipkgs/ preware@ipkg1.preware.org:/home/preware/htdocs/ipkg/feeds/
	rsync -avr ipkgs/ preware@ipkg2.preware.org:/home/preware/htdocs/ipkg/feeds/
	rsync -avr ipkgs/ preware@ipkg3.preware.org:/home/preware/htdocs/ipkg/feeds/

testing: webos-internals-testing webos-patches-testing webos-kernels-testing optware-testing regression-testing

webos-internals-testing:
	${MAKE} SUBDIRS="testing" FEED="WebOS Internals Testing" webos-internals-index
	rsync -avr ipkgs/webos-internals/ preware@ipkg1.preware.org:/home/preware/htdocs/ipkg/feeds/webos-internals/testing/
	rsync -avr ipkgs/webos-internals/ preware@ipkg2.preware.org:/home/preware/htdocs/ipkg/feeds/webos-internals/testing/
	rsync -avr ipkgs/webos-internals/ preware@ipkg3.preware.org:/home/preware/htdocs/ipkg/feeds/webos-internals/testing/

webos-patches-testing:
	${MAKE} PTCHDIR="testing-patches" FEED="WebOS Patches Testing" SUFFIX=.testing webos-patches-index
	rsync -avr ipkgs/webos-patches/ preware@ipkg1.preware.org:/home/preware/htdocs/ipkg/feeds/webos-patches/testing/
	rsync -avr ipkgs/webos-patches/ preware@ipkg2.preware.org:/home/preware/htdocs/ipkg/feeds/webos-patches/testing/
	rsync -avr ipkgs/webos-patches/ preware@ipkg3.preware.org:/home/preware/htdocs/ipkg/feeds/webos-patches/testing/

webos-kernels-testing:
	${MAKE} KERNDIR="testing-kernels" FEED="WebOS Kernels Testing" webos-kernels-index
	rsync -avr ipkgs/webos-kernels/ preware@ipkg1.preware.org:/home/preware/htdocs/ipkg/feeds/webos-kernels/testing/
	rsync -avr ipkgs/webos-kernels/ preware@ipkg2.preware.org:/home/preware/htdocs/ipkg/feeds/webos-kernels/testing/
	rsync -avr ipkgs/webos-kernels/ preware@ipkg3.preware.org:/home/preware/htdocs/ipkg/feeds/webos-kernels/testing/

optware-testing:
	${MAKE} FEED="Optware Testing" optware-index
	rsync -avr ipkgs/optware/ preware@ipkg1.preware.org:/home/preware/htdocs/ipkg/feeds/optware/testing/
	rsync -avr ipkgs/optware/ preware@ipkg2.preware.org:/home/preware/htdocs/ipkg/feeds/optware/testing/
	rsync -avr ipkgs/optware/ preware@ipkg3.preware.org:/home/preware/htdocs/ipkg/feeds/optware/testing/

regression-testing:
	${MAKE} FEED="Regression Testing" regression-index
	rsync -avr ipkgs/regression-testing/ preware@ipkg1.preware.org:/home/preware/htdocs/ipkg/feeds/regression-testing/
	rsync -avr ipkgs/regression-testing/ preware@ipkg2.preware.org:/home/preware/htdocs/ipkg/feeds/regression-testing/
	rsync -avr ipkgs/regression-testing/ preware@ipkg3.preware.org:/home/preware/htdocs/ipkg/feeds/regression-testing/

distclean: clobber
	find toolchain -mindepth 1 -maxdepth 1 -type d -print | \
	xargs -I % ${MAKE} -C % clobber

clobber: clean clobber-subdirs clobber-patches clobber-kernels clobber-optware clobber-regression clobber-feeds
	rm -rf ipkgs

clobber-subdirs:
	find ${SUBDIRS} -mindepth 1 -maxdepth 1 -type d -print | \
	xargs -I % ${MAKE} -C % clobber

clobber-kernels:
	find ${KERNDIR} -mindepth 1 -maxdepth 1 -type d -print | \
	xargs -I % ${MAKE} -C % clobber

clobber-patches:
	find ${PTCHDIR} -mindepth 1 -maxdepth 1 -type d -print | \
	xargs -I % ${MAKE} -C % clobber

clobber-optware:
	find optware -mindepth 1 -maxdepth 1 -type d -print | \
	xargs -I % ${MAKE} -C % clobber

clobber-regression:
	find regression -mindepth 1 -maxdepth 1 -type d -print | \
	xargs -I % ${MAKE} -C % clobber

clobber-feeds:
	find feeds -mindepth 1 -maxdepth 1 -type d -print | \
	xargs -I % ${MAKE} -C % clobber

clean:
	find . -name "*~" -delete
