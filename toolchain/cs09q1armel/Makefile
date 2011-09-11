# Makefile for PreWare ipkg-utils toolchain
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

NAME     = arm
VERSION	 = 2009q1-203-arm-none-linux-gnueabi-i686-pc-linux-gnu

# SRC_BZ2  = http://www.codesourcery.com/sgpp/lite/arm/portal/package4571/public/arm-none-linux-gnueabi/${NAME}-${VERSION}.tar.bz2
SRC_BZ2  = http://sources.nslu2-linux.org/sources/arm-none-linux-gnueabi/${NAME}-${VERSION}.tar.bz2
include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.tar.bz2
	rm -rf build
	mkdir -p build
	tar -C build -jxf ${DL_DIR}/${NAME}-${VERSION}.tar.bz2
	touch $@

clobber::
	rm -rf build
