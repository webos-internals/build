# Makefile for PreWare plugin packaging
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

ifndef NAME
PREWARE_SANITY += $(error "Please define NAME in your Makefile")
endif
ifndef TITLE
PREWARE_SANITY += $(error "Please define TITLE in your Makefile")
endif
ifndef VERSION
PREWARE_SANITY += $(error "Please define VERSION in your Makefile")
endif
ifndef APP_ID
PREWARE_SANITY += $(error "Please define APP_ID in your Makefile")
endif
ifndef TYPE
PREWARE_SANITY += $(error "Please define TYPE in your Makefile")
endif
ifndef CATEGORY
PREWARE_SANITY += $(error "Please define CATEGORY in your Makefile")
endif

ipkgs/${APP_ID}_${VERSION}_%.ipk: build/.built
	rm -f ipkgs/${APP_ID}_*_$*.ipk
	rm -f build/$*/CONTROL/control
	${MAKE} build/$*/CONTROL/control
	rm -f build/$*/CONTROL/postinst
	${MAKE} build/$*/CONTROL/postinst
	rm -f build/$*/CONTROL/prerm
	${MAKE} build/$*/CONTROL/prerm
	mkdir -p ipkgs
	( cd build ; \
	  TAR_OPTIONS=--wildcards \
	  ../../../toolchain/ipkg-utils/ipkg-build -o 0 -g 0 $* )
	mv build/${APP_ID}_${VERSION}_$*.ipk $@

build/%/CONTROL/postinst:
	true

build/%/CONTROL/prerm:
	true

ifeq ("${TYPE}", "Application")
build/%/CONTROL/control: build/%/usr/palm/applications/${APP_ID}/appinfo.json
else
build/%/CONTROL/control: /dev/null
endif
	$(call PREWARE_SANITY)
	rm -f $@
	mkdir -p build/$*/CONTROL
	echo "Package: ${APP_ID}" > $@
	echo -n "Version: " >> $@
ifdef VERSION
	echo "${VERSION}" >> $@
else
	sed -ne 's|^[[:space:]]*"version":[[:space:]]*"\(.*\)",[[:space:]]*$$|\1|p' $< >> $@
endif
	echo "Architecture: $*" >> $@
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
ifdef TITLE
	echo "${TITLE}" >> $@
else
	sed -ne 's|^[[:space:]]*"title":[[:space:]]*"\(.*\)",[[:space:]]*$$|\1|p' $< >> $@
endif
ifdef CATEGORY
	echo "Section: ${CATEGORY}" >> $@
else
	echo "Section: Unsorted" >> $@
endif
ifdef PRIORITY
	echo "Priority: ${PRIORITY}" >> $@
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
	echo -n ", \"Feed\":\"WebOS Internals\"" >> $@
ifdef TYPE
	echo -n ", \"Type\":\"${TYPE}\"" >> $@
endif
ifdef CATEGORY
	echo -n ", \"Category\":\"${CATEGORY}\"" >> $@
endif
ifdef SRC_IPKG
	echo -n ", \"LastUpdated\":\"" >> $@
	../../scripts/timestamp.py ${DL_DIR}/${APP_ID}_${VERSION}_all.ipk >> $@
	echo -n "\"" >> $@
endif
ifdef SRC_TGZ
	echo -n ", \"LastUpdated\":\"" >> $@
	../../scripts/timestamp.py ${DL_DIR}/${NAME}-${VERSION}.tar.gz >> $@
	echo -n "\"" >> $@
endif
ifdef SRC_ZIP
	echo -n ", \"LastUpdated\":\"" >> $@
	../../scripts/timestamp.py ${DL_DIR}/${NAME}-${VERSION}.zip >> $@
	echo -n "\"" >> $@
endif
ifdef SRC_GIT
	echo -n ", \"LastUpdated\":\"" >> $@
	../../scripts/timestamp.py ${DL_DIR}/${NAME}-${VERSION}.tar.gz >> $@
	echo -n "\"" >> $@
endif
ifdef TITLE
	echo -n ", \"Title\":\"${TITLE}\"" >> $@
endif
ifdef DESCRIPTION
	echo -n ", \"FullDescription\":\"${DESCRIPTION}\"" >> $@
endif
ifdef HOMEPAGE
	echo -n ", \"Homepage\":\"${HOMEPAGE}\"" >> $@
endif
ifdef ICON
	echo -n ", \"Icon\":\"${ICON}\"" >> $@
endif
ifdef SCREENSHOTS
	echo -n ", \"Screenshots\":${SCREENSHOTS}" >> $@
endif
ifdef LICENSE
	echo -n ", \"License\":\"${LICENSE}\"" >> $@
endif
ifdef POSTINSTALLFLAGS
	echo -n ", \"PostInstallFlags\":\"${POSTINSTALLFLAGS}\"" >> $@
endif
ifdef POSTREMOVEFLAGS
	echo -n ", \"PostRemoveFlags\":\"${POSTREMOVEFLAGS}\"" >> $@
endif
	echo " }" >> $@
	touch $@

.PHONY: clobber
clobber::
	$(call PREWARE_SANITY)
	rm -rf ipkgs

