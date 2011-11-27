# Makefile for Palm App Catalog feed aggregation
#
# Copyright (C) 2010 by Rod Whitby <rod@whitby.id.au>
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

NAME     = palm-beta-updates
HOMEPAGE = http://www.palm.com/

# SRC_XML = http://developer.palm.com/rss/B/appcatalog.update.rss.xml

.PHONY: package
package: build/.built

# include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked build/.built: # ${DL_DIR}/${NAME}-feed.xml
	rm -f $@
	mkdir -p build
	cat ../../support/appcat-announcement.txt > build/Metadata
	touch $@

.PHONY: clobber
clobber::
	rm -rf build

.PHONY: clean
clean::
