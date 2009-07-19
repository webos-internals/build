# Makefile for PreWare applications that need to be modified
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

.PHONY: unpack build package clobber

PREWARE_SANITY =
ifndef DL_DIR
PREWARE_SANITY += $(error "Please include ../../support/download.mk in your Makefile")
endif
ifndef APP_ID
PREWARE_SANITY += $(error "Please define APP_ID in your Makefile")
endif
ifndef VERSION
PREWARE_SANITY += $(error "Please define VERSION in your Makefile")
endif
ifndef PLATFORM
PREWARE_SANITY += $(error "Please define PLATFORM in your Makefile")
endif

ifdef SRC_IPKG

unpack: build/CONTROL

build/CONTROL: ${DL_DIR}/${APP_ID}_${VERSION}_${PLATFORM}.ipk
	$(call PREWARE_SANITY)
	rm -rf build
	TAR_OPTIONS=--wildcards \
	../../toolchain/ipkg-utils/build/ipkg-utils/ipkg-unbuild $<
	mv ${APP_ID}_${VERSION}_${PLATFORM} build
	touch $@

package: unpack ipkgs/${APP_ID}_${VERSION}_${PLATFORM}.ipk

endif

clobber::
	$(call PREWARE_SANITY)
	rm -rf ipkgs

