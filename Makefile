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

SUBDIRS = apps services plugins daemons linux

.PHONY: index package toolchain upload clobber clean


.PHONY: index
index:  webos-internals-index \
	patches-index \
	optware-index \
	ipkgs/precentral/Packages ipkgs/precentral-themes/Packages \
	palm-index \
	regression-index

.PHONY: optware-index
optware-index: ipkgs/optware/all/Packages ipkgs/optware/i686/Packages ipkgs/optware/armv6/Packages ipkgs/optware/armv7/Packages

.PHONY: palm-index
palm-index: ipkgs/palm-catalog/Packages ipkgs/palm-beta/Packages ipkgs/palm-web/Packages

.PHONY: patches-index
patches-index: ipkgs/webos-patches/1.3.5/Packages ipkgs/webos-patches/1.4.0/Packages
	chmod o-x ipkgs/webos-patches/1.4.0
	ln -f -s 1.3.5 ipkgs/webos-patches/1.3.5.1
	ln -f -s 1.3.5 ipkgs/webos-patches/1.3.5.2

.PHONY: regression-index
regression-index: ipkgs/regression-testing/1.0.0/Packages ipkgs/regression-testing/2.0.0/Packages 

.PHONY: webos-internals-index
webos-internals-index: ipkgs/webos-internals/all/Packages ipkgs/webos-internals/i686/Packages ipkgs/webos-internals/armv6/Packages ipkgs/webos-internals/armv7/Packages	

# Disable these until they are fixed
#	ipkgs/pimpmypre/Packages ipkgs/canuck-software/Packages \

ipkgs/webos-internals/%/Packages: package-subdirs
	rm -rf ipkgs/webos-internals/$*
	mkdir -p ipkgs/webos-internals/$*
	( find ${SUBDIRS} -type d -name ipkgs -print | \
	  xargs -I % find % -name "*_$*.ipk" -print | \
	  xargs -I % rsync -i -a % ipkgs/webos-internals/$* )
	TAR_OPTIONS=--wildcards \
	toolchain/ipkg-utils/ipkg-make-index \
		-v -p ipkgs/webos-internals/$*/Packages ipkgs/webos-internals/$*
	gzip -c ipkgs/webos-internals/$*/Packages > ipkgs/webos-internals/$*/Packages.gz

ipkgs/webos-patches/%/Packages: package-patches
	rm -rf ipkgs/webos-patches/$*
	mkdir -p ipkgs/webos-patches/$*
	( find autopatch -type d -name ipkgs -print | \
	  xargs -I % find % -name "*_$*-*_all.ipk" -print | \
	  xargs -I % rsync -i -a % ipkgs/webos-patches/$* )
	TAR_OPTIONS=--wildcards \
	toolchain/ipkg-utils/ipkg-make-index \
		-v -p ipkgs/webos-patches/$*/Packages ipkgs/webos-patches/$*
	gzip -c ipkgs/webos-patches/$*/Packages > ipkgs/webos-patches/$*/Packages.gz

ipkgs/optware/%/Packages: package-optware
	rm -rf ipkgs/optware/$*
	mkdir -p ipkgs/optware/$*
	( find optware -type d -name ipkgs -print | \
	  xargs -I % find % -name "*_$*.ipk" -print | \
	  xargs -I % rsync -i -a % ipkgs/optware/$* )
	TAR_OPTIONS=--wildcards \
	toolchain/ipkg-utils/ipkg-make-index \
		-v -p ipkgs/optware/$*/Packages ipkgs/optware/$*
	gzip -c ipkgs/optware/$*/Packages > ipkgs/optware/$*/Packages.gz

ipkgs/regression-testing/%/Packages: package-regression
	rm -rf ipkgs/regression-testing/$*
	mkdir -p ipkgs/regression-testing/$*
	( find regression -type d -name ipkgs -print | \
	  xargs -I % find % -name "*_$*_all.ipk" -print | \
	  xargs -I % rsync -i -a % ipkgs/regression-testing/$* )
	TAR_OPTIONS=--wildcards \
	toolchain/ipkg-utils/ipkg-make-index \
		-v -p ipkgs/regression-testing/$*/Packages ipkgs/regression-testing/$*
	gzip -c ipkgs/regression-testing/$*/Packages > ipkgs/regression-testing/$*/Packages.gz

ipkgs/palm-%/Packages: package-feeds
	rm -rf ipkgs/palm-$*
	mkdir -p ipkgs/palm-$*
	cat feeds/palm-$*-base/build/Metadata feeds/palm-$*/build/Metadata > ipkgs/palm-$*/Packages
	gzip -c ipkgs/palm-$*/Packages > ipkgs/palm-$*/Packages.gz

ipkgs/%/Packages: package-feeds
	rm -rf ipkgs/$*
	mkdir -p ipkgs/$*
	( find feeds/$* -type d -name ipkgs -print | \
	  xargs -I % find % -name "*.ipk" -print | \
	  xargs -I % rsync -i -a % ipkgs/$* )
	TAR_OPTIONS=--wildcards \
	toolchain/ipkg-utils/ipkg-make-index \
		-v -p ipkgs/$*/Packages ipkgs/$*
	mv ipkgs/$*/Packages ipkgs/$*/Packages.orig
	scripts/merge-metadata.py feeds/$*/build/Metadata ipkgs/$*/Packages.orig > ipkgs/$*/Packages
	rm -f ipkgs/$*/Packages.orig*
	gzip -c ipkgs/$*/Packages > ipkgs/$*/Packages.gz

package: package-subdirs package-patches package-optware package-feeds

package-subdirs: toolchain
	for f in `find ${SUBDIRS} -mindepth 1 -maxdepth 1 -type d -print` ; do \
	  if [ -e $$f/Makefile ]; then \
	    ${MAKE} -C $$f package ; \
	  fi; \
	done

package-patches:
	for f in `find autopatch -mindepth 1 -maxdepth 1 -type d -print` ; do \
	  if [ -e $$f/Makefile ]; then \
	    ${MAKE} -C $$f package ; \
	  fi; \
	done

package-optware: toolchain
	for f in `find optware -mindepth 1 -maxdepth 1 -type d -print` ; do \
	  if [ -e $$f/Makefile ]; then \
	    ${MAKE} -C $$f package ; \
	  fi; \
	done

package-regression: toolchain
	for f in `find regression -mindepth 1 -maxdepth 1 -type d -print` ; do \
	  if [ -e $$f/Makefile ]; then \
	    ${MAKE} -C $$f package ; \
	  fi; \
	done

package-feeds: toolchain
	for f in `find feeds -mindepth 1 -maxdepth 1 -type d -print` ; do \
	  if [ -e $$f/Makefile ]; then \
	    ${MAKE} -C $$f package ; \
	  fi; \
	done

toolchain: toolchain/ipkg-utils/ipkg-make-index \
	   toolchain/cs08q1armel/build/arm-2008q1 \
	   staging/usr/include/mjson/json.h \
	   staging/usr/include/lunaservice.h \
	   staging/usr/include/glib.h

toolchain/cs08q1armel/build/arm-2008q1:
	${MAKE} -C toolchain/cs08q1armel unpack

staging/usr/include/mjson/json.h:
	${MAKE} -C toolchain/mjson stage

staging/usr/include/lunaservice.h:
	${MAKE} -C toolchain/lunaservice stage

staging/usr/include/glib.h:
	${MAKE} -C toolchain/glib stage

upload:
	rsync -avr ipkgs/ preware@ipkg.preware.org:/home/preware/htdocs/ipkg/feeds/
	rsync -avr ipkgs/ preware@ipkg2.preware.org:/home/preware/htdocs/ipkg/feeds/

testing: webos-internals-testing webos-patches-testing optware-testing regression-testing

webos-internals-testing:
	${MAKE} SUBDIRS="unreleased" webos-internals-index
	rsync -avr ipkgs/webos-internals/ preware@ipkg.preware.org:/home/preware/htdocs/ipkg/feeds/webos-internals/testing/
	rsync -avr ipkgs/webos-internals/ preware@ipkg2.preware.org:/home/preware/htdocs/ipkg/feeds/webos-internals/testing/

webos-patches-testing: patches-index
	rsync -avr ipkgs/webos-patches/ preware@ipkg.preware.org:/home/preware/htdocs/ipkg/feeds/webos-patches/testing/
	rsync -avr ipkgs/webos-patches/ preware@ipkg2.preware.org:/home/preware/htdocs/ipkg/feeds/webos-patches/testing/

optware-testing: optware-index
	rsync -avr ipkgs/optware/ preware@ipkg.preware.org:/home/preware/htdocs/ipkg/feeds/optware/testing/
	rsync -avr ipkgs/optware/ preware@ipkg2.preware.org:/home/preware/htdocs/ipkg/feeds/optware/testing/

regression-testing: regression-index
	rsync -avr ipkgs/regression-testing/ preware@ipkg.preware.org:/home/preware/htdocs/ipkg/feeds/regression-testing/
	rsync -avr ipkgs/regression-testing/ preware@ipkg2.preware.org:/home/preware/htdocs/ipkg/feeds/regression-testing/

distclean: clobber
	find toolchain -mindepth 1 -maxdepth 1 -type d -print | \
	xargs -I % ${MAKE} -C % clobber

clobber: clean clobber-subdirs clobber-patches clobber-optware clobber-regression clobber-feeds
	rm -rf ipkgs

clobber-subdirs:
	find ${SUBDIRS} -mindepth 1 -maxdepth 1 -type d -print | \
	xargs -I % ${MAKE} -C % clobber

clobber-patches:
	find autopatch -mindepth 1 -maxdepth 1 -type d -print | \
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
