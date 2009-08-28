# Makefile for PreWare application packaging
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

.PHONY: package clobber

ifndef NAME
PREWARE_SANITY += $(error "Please define NAME in your Makefile")
endif
ifndef VERSION
PREWARE_SANITY += $(error "Please define VERSION in your Makefile")
endif
ifndef APP_ID
PREWARE_SANITY += $(error "Please define APP_ID in your Makefile")
endif

package: ipkgs/${APP_ID}_${VERSION}_all.ipk

ipkgs/${APP_ID}_${VERSION}_all.ipk: build/.built
	rm -f ipkgs/${APP_ID}_*_all.ipk
	rm -f build/${NAME}/CONTROL/control
	${MAKE} build/${NAME}/CONTROL/control
	rm -f build/${NAME}/CONTROL/postinst
	${MAKE} build/${NAME}/CONTROL/postinst
	rm -f build/${NAME}/CONTROL/prerm
	${MAKE} build/${NAME}/CONTROL/prerm
	mkdir -p ipkgs
	( cd build ; \
	  TAR_OPTIONS=--wildcards \
	  ../../../toolchain/ipkg-utils/ipkg-build -o 0 -g 0 ${NAME} )
	mv build/${APP_ID}_${VERSION}_all.ipk $@

build/%/CONTROL/postinst:
	true

build/%/CONTROL/prerm:
	true

build/${NAME}/CONTROL/control: build/${NAME}/usr/palm/applications/${APP_ID}/appinfo.json
	rm -f $@
	mkdir -p build/${NAME}/CONTROL
	echo "Package: ${APP_ID}" > $@
	echo -n "Version: " >> $@
ifdef VERSION
	echo "${VERSION}" >> $@
else
	sed -ne 's|^[[:space:]]*"version":[[:space:]]*"\(.*\)",[[:space:]]*$$|\1|p' $< >> $@
endif
	echo "Architecture: all" >> $@
	echo -n "Maintainer: " >> $@
ifdef MAINTAINER
	echo "${MAINTAINER}" >> $@
else
	sed -ne 's|^[[:space:]]*"vendor":[[:space:]]*"\(.*\)",[[:space:]]*|\1|p' $< | tr -d '\n' >> $@
	echo -n " <" >> $@
	sed -ne 's|^[[:space:]]*"vendor_email":[[:space:]]*"\(.*\)",[[:space:]]*|\1|p' $< | tr -d '\n' >> $@
	echo ">" >> $@
endif
	echo -n "Description: " >> $@
ifdef DESCRIPTION
	echo "${DESCRIPTION}" >> $@
else
	sed -ne 's|^[[:space:]]*"title":[[:space:]]*"\(.*\)",[[:space:]]*$$|\1|p' $< >> $@
endif
	echo -n "Section: " >> $@
ifdef SECTION
	echo "${SECTION}" >> $@
else
	sed -ne 's|^[[:space:]]*"type":[[:space:]]*"\(.*\)",[[:space:]]*$$|\1|p' $< >> $@
endif
ifdef PRIORITY
	echo "${PRIORITY}" >> $@
else
	echo "Priority: optional" >> $@
endif
ifdef DEPENDS
	echo "Depends: ${DEPENDS}" >> $@
endif
ifdef CONFLICTS
	echo "Conficts: ${CONFLICTS}" >> $@
endif
	echo -n "Source: " >> $@
ifdef SRC_IPKG
	echo -n "{ \"Source\":\"${SRC_IPKG}\"">> $@
endif
ifdef SRC_TGZ
	echo -n "{ \"Source\":\"${SRC_TGZ}\"" >> $@
endif
ifdef SRC_ZIP
	echo -n "{ \"Source\":\"${SRC_ZIP}\"" >> $@
endif
ifdef SRC_GIT
	echo -n "{ \"Source\":\"${SRC_GIT}\"" >> $@
endif
	echo -n ", \"Last-Updated\":\""`date +%s`"\", \"LastUpdated\":\""`date +%s`"\", \"Feed\":\"WebOS Internals\", \"Category\":\"" >> $@
ifdef SECTION
	echo "${SECTION}\" }" >> $@
else
	sed -ne 's|^[[:space:]]*"type":[[:space:]]*"\(.*\)",[[:space:]]*$$|\1\" }|p' $< >> $@
endif
	touch $@

clobber::
	$(call PREWARE_SANITY)
	rm -rf ipkgs

