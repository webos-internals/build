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

WEBOS_VERSION = 1.2.1

SUBDIRS = apps services plugins linux

.PHONY: index package toolchain upload clobber clean


index:  ipkgs/webos-internals/all/Packages ipkgs/webos-internals/i686/Packages ipkgs/webos-internals/armv7/Packages \
	ipkgs/webos-patches/1.1.3/Packages ipkgs/webos-patches/1.2.1/Packages ipkgs/webos-patches/1.3.1/Packages \
	ipkgs/webos-patches/all/Packages \
	ipkgs/optware/all/Packages ipkgs/optware/i686/Packages ipkgs/optware/armv7/Packages \
	ipkgs/precentral/Packages ipkgs/precentral-themes/Packages \
	ipkgs/pimpmypre/Packages ipkgs/canuck-software/Packages ipkgs/prethemer/Packages

ipkgs/webos-internals/%/Packages: package
	rm -rf ipkgs/webos-internals/$*
	mkdir -p ipkgs/webos-internals/$*
	( find ${SUBDIRS} -type d -name ipkgs -print | \
	  xargs -I % find % -name "*_$*.ipk" -print | \
	  xargs -I % rsync -i -a % ipkgs/webos-internals/$* )
	TAR_OPTIONS=--wildcards \
	toolchain/ipkg-utils/ipkg-make-index \
		-v -p ipkgs/webos-internals/$*/Packages ipkgs/webos-internals/$*
	gzip -c ipkgs/webos-internals/$*/Packages > ipkgs/webos-internals/$*/Packages.gz

ipkgs/webos-patches/all/Packages: package
	rm -rf ipkgs/webos-patches/all
	mkdir -p ipkgs/webos-patches/all
	( find autopatch -type d -name ipkgs -print | \
	  xargs -I % find % -name "*_${WEBOS_VERSION}-*_all.ipk" -print | \
	  xargs -I % rsync -i -a % ipkgs/webos-patches/all )
	TAR_OPTIONS=--wildcards \
	toolchain/ipkg-utils/ipkg-make-index \
		-v -p ipkgs/webos-patches/all/Packages ipkgs/webos-patches/all
	gzip -c ipkgs/webos-patches/all/Packages > ipkgs/webos-patches/all/Packages.gz

ipkgs/webos-patches/%/Packages: package
	rm -rf ipkgs/webos-patches/$*
	mkdir -p ipkgs/webos-patches/$*
	( find autopatch -type d -name ipkgs -print | \
	  xargs -I % find % -name "*_$*-*_all.ipk" -print | \
	  xargs -I % rsync -i -a % ipkgs/webos-patches/$* )
	TAR_OPTIONS=--wildcards \
	toolchain/ipkg-utils/ipkg-make-index \
		-v -p ipkgs/webos-patches/$*/Packages ipkgs/webos-patches/$*
	gzip -c ipkgs/webos-patches/$*/Packages > ipkgs/webos-patches/$*/Packages.gz

ipkgs/optware/%/Packages: package
	rm -rf ipkgs/optware/$*
	mkdir -p ipkgs/optware/$*
	( find optware -type d -name ipkgs -print | \
	  xargs -I % find % -name "*_$*.ipk" -print | \
	  xargs -I % rsync -i -a % ipkgs/optware/$* )
	TAR_OPTIONS=--wildcards \
	toolchain/ipkg-utils/ipkg-make-index \
		-v -p ipkgs/optware/$*/Packages ipkgs/optware/$*
	gzip -c ipkgs/optware/$*/Packages > ipkgs/optware/$*/Packages.gz

ipkgs/%/Packages: package
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

package: toolchain
	for f in `find ${SUBDIRS} -mindepth 1 -maxdepth 1 -type d -print` ; do \
	  if [ -e $$f/Makefile ]; then \
	    ${MAKE} -C $$f package || exit ; \
	  fi; \
	done
	for f in `find autopatch -mindepth 1 -maxdepth 1 -type d -print` ; do \
	  if [ -e $$f/Makefile ]; then \
	    ${MAKE} -C $$f package || exit ; \
	  fi; \
	done
	for f in `find optware -mindepth 1 -maxdepth 1 -type d -print` ; do \
	  if [ -e $$f/Makefile ]; then \
	    ${MAKE} -C $$f package || exit ; \
	  fi; \
	done
	for f in `find feeds -mindepth 1 -maxdepth 1 -type d -print` ; do \
	  if [ -e $$f/Makefile ]; then \
	    ${MAKE} -C $$f package ; \
	  fi; \
	done

toolchain: toolchain/ipkg-utils/ipkg-make-index \
	   toolchain/cs08q1armel/build/arm-2008q1

toolchain/cs08q1armel/build/arm-2008q1:
	${MAKE} -C toolchain/cs08q1armel unpack

upload:
	rsync -avr ipkgs/ ipkg.preware.org:/home/preware/htdocs/ipkg/feeds/

testing: webos-internals-testing webos-patches-testing optware-testing

webos-internals-testing: ipkgs/webos-internals/all/Packages ipkgs/webos-internals/i686/Packages ipkgs/webos-internals/armv7/Packages
	rsync -avr ipkgs/webos-internals/ preware@ipkg.preware.org:/home/preware/htdocs/ipkg/feeds/webos-internals/testing/

webos-patches-testing: ipkgs/webos-patches/all/Packages
	rsync -avr ipkgs/webos-patches/ preware@ipkg.preware.org:/home/preware/htdocs/ipkg/feeds/webos-patches/testing/

optware-testing: ipkgs/optware/all/Packages ipkgs/optware/i686/Packages ipkgs/optware/armv7/Packages 
	rsync -avr ipkgs/optware/ preware@ipkg.preware.org:/home/preware/htdocs/ipkg/feeds/optware/testing/

distclean: clobber
	find toolchain -mindepth 1 -maxdepth 1 -type d -print | \
	xargs -I % ${MAKE} -C % clobber

clobber: clean
	find ${SUBDIRS} feeds optware autopatch -mindepth 1 -maxdepth 1 -type d -print | \
	xargs -I % ${MAKE} -C % clobber
	rm -rf ipkgs

clean:
	find . -name "*~" -delete
