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

SUBDIRS = apps plugins services

.PHONY: index package toolchain upload clobber clean

index:  ipkgs/preware/all/Packages ipkgs/preware/i686/Packages ipkgs/preware/armv7/Packages \
	ipkgs/precentral/Packages ipkgs/pimpmypre/Packages

ipkgs/preware/%/Packages: package
	rm -rf ipkgs/preware/$*
	mkdir -p ipkgs/preware/$*
	( find ${SUBDIRS} -type d -name ipkgs -print | \
	  xargs -I % find % -name "*_$*.ipk" -print | \
	  xargs -I % rsync -i -a % ipkgs/preware/$* )
	TAR_OPTIONS=--wildcards \
	toolchain/ipkg-utils/build/ipkg-utils/ipkg-make-index \
		-v -l ipkgs/preware/$*/Packages.filelist -p ipkgs/preware/$*/Packages ipkgs/preware/$*
	gzip -c ipkgs/preware/$*/Packages > ipkgs/preware/$*/Packages.gz

ipkgs/%/Packages: package
	rm -rf ipkgs/$*
	mkdir -p ipkgs/$*
	( find feeds/$* -type d -name ipkgs -print | \
	  xargs -I % find % -name "*.ipk" -print | \
	  xargs -I % rsync -i -a % ipkgs/$* )
	TAR_OPTIONS=--wildcards \
	toolchain/ipkg-utils/build/ipkg-utils/ipkg-make-index \
		-v -l ipkgs/$*/Packages.filelist -p ipkgs/$*/Packages ipkgs/$*
	gzip -c ipkgs/$*/Packages > ipkgs/$*/Packages.gz

package: toolchain
	for f in `find ${SUBDIRS} -mindepth 1 -maxdepth 1 -type d -print` ; do \
	  ${MAKE} -C $$f package || exit ; \
	done
	for f in `find feeds -mindepth 1 -maxdepth 1 -type d -print` ; do \
	  ${MAKE} -C $$f package || exit ; \
	done

toolchain: toolchain/ipkg-utils/build/ipkg-utils/ipkg-make-index \
	   toolchain/cs08q1armel/build/arm-2008q1

toolchain/ipkg-utils/build/ipkg-utils/ipkg-make-index:
	${MAKE} -C toolchain/ipkg-utils build

toolchain/cs08q1armel/build/arm-2008q1:
	${MAKE} -C toolchain/cs08q1armel unpack

upload:
	rsync -avr ipkgs/ ipkg.preware.org:/home/preware/htdocs/ipkg/feeds/

distclean: clobber
	find toolchain -mindepth 1 -maxdepth 1 -type d -print | \
	xargs -I % ${MAKE} -C % clobber

clobber: clean
	find ${SUBDIRS} -mindepth 1 -maxdepth 1 -type d -print | \
	xargs -I % ${MAKE} -C % clobber
	rm -rf ipkgs

clean:
	find . -name "*~" -delete