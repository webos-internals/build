# Makefile for Preware feed aggregation
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

NAME     = precentral-themes
HOMEPAGE = http://www.precentral.net/webos-themes/

SRC_XML = http://www.precentral.net/webos-themes/precentral-theme-repo.xml

.PHONY: package
package: build/.built

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-feed.xml
	rm -f $@
	mkdir -p build zips
	#../../scripts/precentral-scraper.py ${DL_DIR}/${NAME}-feed.xml zips > build/Metadata
	touch $@

build/.built: build/.unpacked
	rm -f $@
	mkdir -p ipkgs
	for f in zips/*.zip ; do \
	  if [ ! -e ipkgs/`basename $$f .zip`.ipk ] ; then \
	    rm -rf build/`basename $$f .zip` ; \
	    mkdir -p build/`basename $$f .zip`/net.precentral.themes ; \
	    unzip -q -d build/`basename $$f .zip`/net.precentral.themes $$f ; \
	    mkdir -p build/`basename $$f .zip`/CONTROL ; \
	    ../../scripts/xml-theme-converter.py \
	      build/`basename $$f .zip`/net.precentral.themes/theme.xml \
	      build/`basename $$f .zip` `basename $$f .zip` && \
	    chmod ugo+x build/`basename $$f .zip`/CONTROL/postinst build/`basename $$f .zip`/CONTROL/prerm && \
	    ( cd ipkgs ; ../../../toolchain/ipkg-utils/ipkg-build ../build/`basename $$f .zip` ) ; \
	  fi ; \
	done
	touch $@

.PHONY: clobber
clobber::
	rm -rf build ipkgs
