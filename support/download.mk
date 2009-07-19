# Makefile for PreWare downloads
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

.PHONY: download

DL_DIR = ../../downloads

PREWARE_SANITY =
ifndef VERSION
PREWARE_SANITY += $(error "Please define VERSION in your Makefile")
endif

ifdef SRC_TGZ

ifndef NAME
PREWARE_SANITY += $(error "Please define NAME in your Makefile")
endif

download: ${DL_DIR}/${NAME}-${VERSION}.tar.gz

${DL_DIR}/${NAME}-${VERSION}.tar.gz:
	$(call PREWARE_SANITY)
	mkdir -p ${DL_DIR}
	curl -L -o ${DL_DIR}/${NAME}-${VERSION}.tar.gz ${SRC_TGZ}

endif

ifdef SRC_IPKG

ifndef APP_ID
PREWARE_SANITY += $(error "Please define APP_ID in your Makefile")
endif
ifndef PLATFORM
PREWARE_SANITY += $(error "Please define PLATFORM in your Makefile")
endif

download: ${DL_DIR}/${APP_ID}_${VERSION}_all.ipk

${DL_DIR}/${APP_ID}_${VERSION}_all.ipk:
	$(call PREWARE_SANITY)
	mkdir -p ${DL_DIR}
	curl -L -o ${DL_DIR}/${APP_ID}_${VERSION}_${PLATFORM}.ipk ${SRC_IPKG}

endif
