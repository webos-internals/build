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

SUBDIRS = apps services linux
KERNDIR = kernels
PTCHDIR = autopatch
OPTWDIR = optware

.PHONY: index package toolchain upload clobber clean


.PHONY: index
index:  webos-internals-index \
	webos-patches-index \
	webos-kernels-index \
	optware-index \
	precentral-index \
	palm-index

.PHONY: optware-index
optware-index: ipkgs/optware/all/Packages ipkgs/optware/i686/Packages ipkgs/optware/armv6/Packages ipkgs/optware/armv7/Packages

.PHONY: palm-index
palm-index: ipkgs/palm-catalog/Packages ipkgs/palm-beta/Packages ipkgs/palm-web/Packages \
	    ipkgs/palm-catalog-updates/Packages ipkgs/palm-beta-updates/Packages ipkgs/palm-web-updates/Packages

.PHONY: precentral-index
precentral-index: ipkgs/precentral/Packages

.PHONY: webos-patches-index
webos-patches-index: ipkgs/webos-patches/1.4.5/Packages \
		     ipkgs/webos-patches/2.0.0/Packages ipkgs/webos-patches/2.0.1/Packages \
		     ipkgs/webos-patches/2.1.0/Packages ipkgs/webos-patches/3.0.0/Packages \
		     ipkgs/webos-patches/3.0.2/Packages
	rm -f ipkgs/webos-patches/1.4.5.1
	ln -s 1.4.5 ipkgs/webos-patches/1.4.5.1
	rm -f ipkgs/webos-patches/2.1.1
	ln -s 2.1.0 ipkgs/webos-patches/2.1.1
	rm -f ipkgs/webos-patches/2.1.2
	ln -s 2.1.0 ipkgs/webos-patches/2.1.2
	rm -f ipkgs/webos-patches/unknown
	ln -s 3.0.0 ipkgs/webos-patches/unknown

.PHONY: webos-kernels-index
webos-kernels-index: ipkgs/webos-kernels/1.4.5/Packages \
		     ipkgs/webos-kernels/2.0.0/Packages ipkgs/webos-kernels/2.0.1/Packages \
		     ipkgs/webos-kernels/2.1.0/Packages ipkgs/webos-kernels/2.1.2/Packages \
		     ipkgs/webos-kernels/3.0.0/Packages ipkgs/webos-kernels/3.0.2/Packages
	rm -f ipkgs/webos-kernels/1.4.5.1
	ln -s 1.4.5 ipkgs/webos-kernels/1.4.5.1
	rm -f ipkgs/webos-kernels/unknown
	ln -s 3.0.0 ipkgs/webos-kernels/unknown

.PHONY: legacy-webos-kernels
legacy-webos-kernels:
	${MAKE} ipkgs/webos-kernels/1.4.5/Packages

.PHONY: legacy-webos-kernels-testing
legacy-webos-kernels-testing:
	${MAKE} KERNDIR="testing-kernels" FEED="WebOS Kernels Testing" ipkgs/webos-kernels/1.4.5/Packages

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
	  ( find ${OPTWDIR} -mindepth 2 -maxdepth 2 -type d -name ipkgs -print | \
	    xargs -I % find % -name "*_$*.ipk" -print | \
	    xargs -I % rsync -i -a % ipkgs/optware/$* ) ; \
	else \
	  ( find ${OPTWDIR} -mindepth 2 -maxdepth 2 -type d -name ipkgs -print | \
	    xargs -I % find % \( -name "*_$*.ipk" -o -name "*_arm.ipk" \) -print | \
	    xargs -I % rsync -i -a % ipkgs/optware/$* ) ; \
	fi	
	TAR_OPTIONS=--wildcards \
	toolchain/ipkg-utils/ipkg-make-index \
		-v -p ipkgs/optware/$*/Packages ipkgs/optware/$*
	gzip -c ipkgs/optware/$*/Packages > ipkgs/optware/$*/Packages.gz

ipkgs/palm-%/Packages: package-feeds
	rm -rf ipkgs/palm-$*
	mkdir -p ipkgs/palm-$*
	cp feeds/palm-$*/build/Metadata ipkgs/palm-$*/Packages
	gzip -c ipkgs/palm-$*/Packages > ipkgs/palm-$*/Packages.gz

ipkgs/precentral/Packages: package-feeds
	rm -rf ipkgs/precentral
	mkdir -p ipkgs/precentral
	( find feeds/precentral -mindepth 1 -maxdepth 1 -type d -name ipkgs -print | \
	  xargs -I % find % -name "*.ipk" -print | \
	  xargs -I % rsync -i -a % ipkgs/precentral )
	TAR_OPTIONS=--wildcards \
	toolchain/ipkg-utils/ipkg-make-index \
		-v -p ipkgs/precentral/Packages ipkgs/precentral
	mv ipkgs/precentral/Packages ipkgs/precentral/Packages.orig
	scripts/merge-metadata.py feeds/precentral/build/Metadata ipkgs/precentral/Packages.orig > ipkgs/precentral/Packages
	rm -f ipkgs/precentral/Packages.orig* ipkgs/precentral/*.ipk
	gzip -c ipkgs/precentral/Packages > ipkgs/precentral/Packages.gz

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

package-webos-patches: toolchain
	for f in `find ${PTCHDIR} -mindepth 1 -maxdepth 1 -type d -print` ; do \
	  if [ -e $$f/Makefile ]; then \
	    ${MAKE} -C $$f package ; \
	  else \
	    rm -rf $$f ; \
	  fi; \
	done

package-webos-kernels: toolchain
	for f in `find ${KERNDIR} -mindepth 1 -maxdepth 1 -type d -print` ; do \
	  if [ -e $$f/Makefile ]; then \
	    ${MAKE} -C $$f package ; \
	  else \
	    rm -rf $$f ; \
	  fi; \
	done

package-optware: toolchain
	for f in `find ${OPTWDIR} -mindepth 1 -maxdepth 1 -type d -print` ; do \
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
	   toolchain/cs09q1armel/build/arm-2009q1 \
	   toolchain/cs07q3armel/build/arm-2007q3 \
	   toolchain/i686-unknown-linux-gnu/build/i686-unknown-linux-gnu \
	   staging/usr/include/mjson/json.h \
	   staging/usr/include/lunaservice.h \
	   staging/usr/include/glib.h \
	   staging/usr/include/zlib.h \
	   staging/usr/include/openssl/crypto.h \
	   staging/usr/include/curl/curl.h

toolchain/cs09q1armel/build/arm-2009q1:
	${MAKE} -C toolchain/cs09q1armel unpack

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

staging/usr/include/openssl/crypto.h:
	${MAKE} -C toolchain/openssl stage

staging/usr/include/zlib.h:
	${MAKE} -C toolchain/zlib stage

staging/usr/include/curl/curl.h:
	${MAKE} -C toolchain/libcurl stage

upload:
	rsync -avr ipkgs/ preware@ipkg3.preware.org:/home/preware/htdocs/ipkg/feeds/
	rsync -avr ipkgs/ preware@ipkg2.preware.org:/home/preware/htdocs/ipkg/feeds/
	rsync -avr ipkgs/ preware@ipkg1.preware.org:/home/preware/htdocs/ipkg/feeds/

testing: webos-internals-testing webos-patches-testing webos-kernels-testing optware-testing

webos-internals-testing:
	${MAKE} SUBDIRS="testing" FEED="WebOS Internals Testing" webos-internals-index
	rsync -avr ipkgs/webos-internals/ preware@ipkg3.preware.org:/home/preware/htdocs/ipkg/feeds/webos-internals/testing/
	rsync -avr ipkgs/webos-internals/ preware@ipkg2.preware.org:/home/preware/htdocs/ipkg/feeds/webos-internals/testing/
	rsync -avr ipkgs/webos-internals/ preware@ipkg1.preware.org:/home/preware/htdocs/ipkg/feeds/webos-internals/testing/

webos-patches-testing:
	${MAKE} PTCHDIR="testing-patches" FEED="WebOS Patches Testing" SUFFIX=.testing webos-patches-index
	rsync -avr ipkgs/webos-patches/ preware@ipkg3.preware.org:/home/preware/htdocs/ipkg/feeds/webos-patches/testing/
	rsync -avr ipkgs/webos-patches/ preware@ipkg2.preware.org:/home/preware/htdocs/ipkg/feeds/webos-patches/testing/
	rsync -avr ipkgs/webos-patches/ preware@ipkg1.preware.org:/home/preware/htdocs/ipkg/feeds/webos-patches/testing/

webos-kernels-testing:
	${MAKE} KERNDIR="testing-kernels" FEED="WebOS Kernels Testing" webos-kernels-index
	rsync -avr ipkgs/webos-kernels/ preware@ipkg3.preware.org:/home/preware/htdocs/ipkg/feeds/webos-kernels/testing/
	rsync -avr ipkgs/webos-kernels/ preware@ipkg2.preware.org:/home/preware/htdocs/ipkg/feeds/webos-kernels/testing/
	rsync -avr ipkgs/webos-kernels/ preware@ipkg1.preware.org:/home/preware/htdocs/ipkg/feeds/webos-kernels/testing/

optware-testing:
	${MAKE} OPTWDIR="testing-optware" FEED="Optware Testing" optware-index
	rsync -avr ipkgs/optware/ preware@ipkg3.preware.org:/home/preware/htdocs/ipkg/feeds/optware/testing/
	rsync -avr ipkgs/optware/ preware@ipkg2.preware.org:/home/preware/htdocs/ipkg/feeds/optware/testing/
	rsync -avr ipkgs/optware/ preware@ipkg1.preware.org:/home/preware/htdocs/ipkg/feeds/optware/testing/

distclean: clobber
	find toolchain -mindepth 1 -maxdepth 1 -type d -print | \
	xargs -I % ${MAKE} -C % clobber

clobber: clean clobber-subdirs clobber-patches clobber-kernels clobber-optware clobber-feeds
	rm -rf ipkgs

clobber-testing:
	${MAKE} SUBDIRS="testing" PTCHDIR="testing-patches" KERNDIR="testing-kernels" OPTWDIR="testing-optware" clobber

clean: clean-subdirs clean-patches clean-kernels clean-optware clean-feeds
	find . -name "*~" -delete

clean-testing:
	${MAKE} SUBDIRS="testing" PTCHDIR="testing-patches" KERNDIR="testing-kernels" OPTWDIR="testing-optware" clean

clobber-subdirs:
	find ${SUBDIRS} -mindepth 1 -maxdepth 1 -type d -print | \
	xargs -I % ${MAKE} -C % clobber

clean-subdirs:
	find ${SUBDIRS} -mindepth 1 -maxdepth 1 -type d -print | \
	xargs -I % ${MAKE} -C % clean

clobber-kernels:
	find ${KERNDIR} -mindepth 1 -maxdepth 1 -type d -print | \
	xargs -I % ${MAKE} -C % clobber

clean-kernels:
	find ${KERNDIR} -mindepth 1 -maxdepth 1 -type d -print | \
	xargs -I % ${MAKE} -C % clean

clobber-patches:
	find ${PTCHDIR} -mindepth 1 -maxdepth 1 -type d -print | \
	xargs -I % ${MAKE} -C % clobber

clean-patches:
	find ${PTCHDIR} -mindepth 1 -maxdepth 1 -type d -print | \
	xargs -I % ${MAKE} -C % clean

clobber-optware:
	find ${OPTWDIR} -mindepth 1 -maxdepth 1 -type d -print | \
	xargs -I % ${MAKE} -C % clobber

clean-optware:
	find ${OPTWDIR} -mindepth 1 -maxdepth 1 -type d -print | \
	xargs -I % ${MAKE} -C % clean

clobber-feeds:
	find feeds -mindepth 1 -maxdepth 1 -type d -print | \
	xargs -I % ${MAKE} -C % clobber

clean-feeds:
	find feeds -mindepth 1 -maxdepth 1 -type d -print | \
	xargs -I % ${MAKE} -C % clean
