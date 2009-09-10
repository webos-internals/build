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
ifdef SRC_OPTWARE
	if [ -e control/postinst ] ; then \
	  install -m 755 control/postinst $@ ; \
	fi
endif
	true

build/%/CONTROL/prerm:
ifdef SRC_OPTWARE
	if [ -e control/prerm ] ; then \
	  install -m 755 control/prerm $@ ; \
	fi
endif
	true

ifeq ("${TYPE}", "Application")
build/%/CONTROL/control: build/%/usr/palm/applications/${APP_ID}/appinfo.json
else ifdef SRC_OPTWARE
build/%/CONTROL/control: build/%.control
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
else ifeq ("${TYPE}", "Application")
	sed -ne 's|^[[:space:]]*"version":[[:space:]]*"\(.*\)",[[:space:]]*$$|\1|p' $< >> $@
else
	echo "0.0.0" >> $@
endif
	echo "Architecture: $*" >> $@
	echo -n "Maintainer: " >> $@
ifdef MAINTAINER
	echo "${MAINTAINER}" >> $@
else ifeq ("${TYPE}", "Application")
	sed -ne 's|^[[:space:]]*"vendor":[[:space:]]*"\(.*\)",[[:space:]]*|\1|p' $< | tr -d '\n' >> $@
	echo -n " <" >> $@
	sed -ne 's|^[[:space:]]*"vendor_email":[[:space:]]*"\(.*\)",[[:space:]]*|\1|p' $< | tr -d '\n' >> $@
	echo ">" >> $@
else
	echo "WebOS Internals <support@webos-internals.org>" >> $@
endif
	echo -n "Description: " >> $@
ifdef TITLE
	echo "${TITLE}" >> $@
else ifeq ("${TYPE}", "Application")
	sed -ne 's|^[[:space:]]*"title":[[:space:]]*"\(.*\)",[[:space:]]*$$|\1|p' $< >> $@
else
	echo "${NAME}" >> $@
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
	echo -n "Source: { " >> $@
ifdef SOURCE
	echo -n "\"Source\":\"${SOURCE}\", " >> $@
else ifdef SRC_IPKG
	echo -n "\"Source\":\"${SRC_IPKG}\", ">> $@
else ifdef SRC_TGZ
	echo -n "\"Source\":\"${SRC_TGZ}\", " >> $@
else ifdef SRC_ZIP
	echo -n "\"Source\":\"${SRC_ZIP}\", " >> $@
else ifdef SRC_GIT
	echo -n "\"Source\":\"${SRC_GIT}\", " >> $@
else ifdef SRC_OPTWARE
	echo -n "\"Source\":\"`sed -n -e 's|Source: \(.*\)|\1|p' build/$*.control`, http://trac.nslu2-linux.org/optware\", ">> $@
else
	true
endif
	echo -n "\"Feed\":\"WebOS Internals\"" >> $@
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
else ifdef SRC_TGZ
	echo -n ", \"LastUpdated\":\"" >> $@
	../../scripts/timestamp.py ${DL_DIR}/${NAME}-${VERSION}.tar.gz >> $@
	echo -n "\"" >> $@
else ifdef SRC_ZIP
	echo -n ", \"LastUpdated\":\"" >> $@
	../../scripts/timestamp.py ${DL_DIR}/${NAME}-${VERSION}.zip >> $@
	echo -n "\"" >> $@
else ifdef SRC_GIT
	echo -n ", \"LastUpdated\":\"" >> $@
	../../scripts/timestamp.py ${DL_DIR}/${NAME}-${VERSION}.tar.gz >> $@
	echo -n "\"" >> $@
else ifdef SRC_OPTWARE
	echo -n ", \"LastUpdated\":\"" >> $@
	../../scripts/timestamp.py ${DL_DIR}/${SRC_OPTWARE}_$*.ipk Makefile >> $@
	echo -n "\"" >> $@
endif
ifdef TITLE
	echo -n ", \"Title\":\"${TITLE}\"" >> $@
endif
	echo -n ", \"FullDescription\":\"" >> $@
ifdef DESCRIPTION
	echo -n "${DESCRIPTION}" >> $@
else ifdef SRC_OPTWARE
	echo -n "`sed -n -e 's|Description: \(.*\)|\1|p' build/$*.control`" >> $@
else ifdef TITLE
	echo -n "${TITLE}" >> $@
endif
ifdef CHANGELOG
	echo -n "<br>Changelog:<br>${CHANGELOG}" >> $@
endif
	echo -n "\"" >> $@
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

