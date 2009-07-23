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

package: ipkgs/${APP_ID}_${VERSION}_${PLATFORM}.ipk

ipkgs/${APP_ID}_${VERSION}_${PLATFORM}.ipk: build/.built
	rm -f build/${NAME}/CONTROL/control
	${MAKE} build/${NAME}/CONTROL/control
	rm -f $@
	mkdir -p ipkgs
	( cd build ; \
	  TAR_OPTIONS=--wildcards \
	  ../../../toolchain/ipkg-utils/build/ipkg-utils/ipkg-build -o 0 -g 0 ${NAME} )
	mv build/${APP_ID}_${VERSION}_${PLATFORM}.ipk $@

build/${NAME}/CONTROL/control: build/${NAME}/usr/palm/applications/${APP_ID}/appinfo.json
	rm -f $@
	echo "Package: ${APP_ID}" > $@
	echo -n "Version: " >> $@
ifdef VERSION
	echo "${VERSION}" >> $@
else
	sed -nre 's|^\s*"version":\s*"(.*)",\s*$$|\1|p' $< >> $@
endif
	echo "Architecture: all" >> $@
	echo -n "Maintainer: " >> $@
ifdef MAINTAINER
	echo "${MAINTAINER}" >> $@
else
	sed -nre 's|^\s*"vendor":\s*"(.*)",\s*|\1|p' $< | tr -d '\n' >> $@
	echo -n " <" >> $@
	sed -nre 's|^\s*"vendor_email":\s*"(.*)",\s*|\1|p' $< | tr -d '\n' >> $@
	echo ">" >> $@
endif
	echo -n "Description: " >> $@
ifdef DESCRIPTION
	echo "${DESCRIPTION}" >> $@
else
	sed -nre 's|^\s*"title":\s*"(.*)",\s*$$|\1|p' $< >> $@
endif
	echo -n "Section: " >> $@
ifdef SECTION
	echo "${SECTION}" >> $@
else
	sed -nre 's|^\s*"type":\s*"(.*)",\s*$$|\1|p' $< >> $@
endif
ifdef PRIORITY
	echo "${PRIORITY}" >> $@
else
	echo "Priority: optional" >> $@
endif
	echo -n "Source: " >> $@
ifdef SOURCE
	echo "${SOURCE}" >> $@
else
ifdef SRC_IPKG
	echo "${SRC_IPKG}" >> $@
endif
endif
	touch $@

clobber::
	$(call PREWARE_SANITY)
	rm -rf ipkgs

