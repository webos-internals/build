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

ifdef SRC_XML

download: ${DL_DIR}/${NAME}-feed.xml

${DL_DIR}/${NAME}-feed.xml:
	rm -f $@
	mkdir -p ${DL_DIR}
	curl -L -o ${DL_DIR}/${NAME}-feed.xml ${SRC_XML}

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

ifdef SRC_BZ2

ifndef NAME
PREWARE_SANITY += $(error "Please define NAME in your Makefile")
endif

download: ${DL_DIR}/${NAME}-${VERSION}.tar.bz2

${DL_DIR}/${NAME}-${VERSION}.tar.bz2:
	$(call PREWARE_SANITY)
	mkdir -p ${DL_DIR}
	curl -L -o ${DL_DIR}/${NAME}-${VERSION}.tar.bz2 ${SRC_BZ2}

endif

ifdef SRC_ZIP

ifndef NAME
PREWARE_SANITY += $(error "Please define NAME in your Makefile")
endif

download: ${DL_DIR}/${NAME}-${VERSION}.zip

${DL_DIR}/${NAME}-${VERSION}.zip:
	$(call PREWARE_SANITY)
	mkdir -p ${DL_DIR}
	curl -L -o ${DL_DIR}/${NAME}-${VERSION}.zip ${SRC_ZIP}

endif

ifdef SRC_IPKG

ifndef APP_ID
PREWARE_SANITY += $(error "Please define APP_ID in your Makefile")
endif

download: ${DL_DIR}/${APP_ID}_${VERSION}_all.ipk

${DL_DIR}/${APP_ID}_${VERSION}_all.ipk:
	$(call PREWARE_SANITY)
	mkdir -p ${DL_DIR}
	curl -L -o ${DL_DIR}/${APP_ID}_${VERSION}_all.ipk ${SRC_IPKG}

endif

ifdef SRC_GIT

ifndef NAME
PREWARE_SANITY += $(error "Please define NAME in your Makefile")
endif

download: ${DL_DIR}/${NAME}-${VERSION}.tar.gz

${DL_DIR}/${NAME}-${VERSION}.tar.gz:
	$(call PREWARE_SANITY)
	rm -rf build
	mkdir build
	( cd build ; git clone ${SRC_GIT} )
	mkdir -p ${DL_DIR}
	tar -C build/`basename ${SRC_GIT} .git` -zcf $@ .

endif

