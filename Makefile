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

.PHONY: index package toolchain upload clobber clean

index: package
	mkdir -p ipkgs/all
	TAR_OPTIONS=--wildcards \
	toolchain/ipkg-utils/build/ipkg-utils/ipkg-make-index \
		-v -l ipkgs/all/Packages.filelist -p ipkgs/all/Packages ipkgs/all
	gzip -c ipkgs/all/Packages > ipkgs/all/Packages.gz

package: toolchain
	mkdir -p ipkgs/all
	find apps mods plugins -type d -depth 1 -print | \
	xargs -I % ${MAKE} -C % package
	find apps mods plugins -type d -name ipkgs -print | \
	xargs -I % find % -name "*_all.ipk" -print | \
	xargs -I % rsync -i -a % ipkgs/all

toolchain: toolchain/ipkg-utils/build/ipkg-utils/ipkg-make-index

toolchain/ipkg-utils/build/ipkg-utils/ipkg-make-index:
	${MAKE} -C toolchain/ipkg-utils build

upload:
	rsync -avr ipkgs/ ipkg.preware.org:htdocs/ipkg/feeds/preware/

clobber:
	find apps mods plugins toolchain -type d -depth 1 -print | \
	xargs -I % ${MAKE} -C % clobber
	rm -rf ipkgs

clean:
	find . -name "*~" -delete