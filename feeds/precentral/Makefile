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

NAME     = precentral
HOMEPAGE = http://www.precentral.net/homebrew-apps/

SRC_XML = http://www.precentral.net/precentral-homebrew-filecoaster.xml
include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked build/Packages: ${DL_DIR}/${NAME}-feed.xml
	rm -f $@
	mkdir -p build
	../../scripts/precentral-homebrew-scraper.py ${DL_DIR} ${NAME}-feed.xml > build/Packages
	touch $@

.PHONY: package
package: ipkgs/Packages

ipkgs/Packages: build/Packages
	rm -rf ipkgs
	mkdir -p ipkgs
	install -m 644 $< $@

clobber::
	rm -rf build
