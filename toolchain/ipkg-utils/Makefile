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

NAME     = ipkg-utils
VERSION  = 20050404
HOMEPAGE = http://handhelds.org/packages/ipkg-utils/

SRC_TGZ  = http://sources.nslu2-linux.org/sources/${NAME}_anoncvs.handhelds.org__${VERSION}.tar.gz
include ../../support/download.mk

PATCHES =  ipkg-utils-fix.patch \
           ipkg-py-sane-vercompare.patch \
           ipkg-py-tarfile.patch \
           arfile_even_alignment.patch \
           ipkg-make-index-track-stamps.patch \
           fields_tweaks.patch \
           ipkg-env.patch \
	   ipkg-membername-suffix.patch

.PHONY: build
build: build/${NAME}/ipkg-make-index

.PHONY: unpack
unpack: build/${NAME}/ipkg-make-index

build/${NAME}/ipkg-make-index: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build
	cd build ; tar zxf ../${DL_DIR}/${NAME}-${VERSION}.tar.gz
	cd patches ; cat ${PATCHES} | patch -d ../build/${NAME} -p1
	touch $@

clobber::
	rm -rf build
