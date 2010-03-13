NAME=change-user-agent
BSPATCH_FILE=/usr/lib/libWebKitLuna.so
PATCH=${BSPATCH_FILE}.bspatch
VERSIONS = 1.4.0-2
TITLE = Change User Agent
CATEGORY = WebKitLuna
DESCRIPTION = Spoof user agent
TYPE = Patch
APP_ID=org.webosinternals.patches.change-user-agent

include ../../autopatch/common.mk
DEPENDS=

build/.unpacked-${VERSION}:
	mkdir -p build/src-${VERSION}/usr/lib
	cp ./${PATCH} build/src-${VERSION}/${PATCH}
	touch $@

build/all/CONTROL/postinst:
	mkdir -p build/all/CONTROL
	sed -e 's|BSPATCH_FILE=|BSPATCH_FILE=${BSPATCH_FILE}|' \
			-e 's|APP_DIR=|APP_DIR=$$IPKG_OFFLINE_ROOT/usr/palm/applications/${APP_ID}|' \
			../../autopatch/postinst.testing > $@
	chmod ugo+x $@

build/all/CONTROL/prerm:
	mkdir -p build/all/CONTROL
	sed -e 's|BSPATCH_FILE=|BSPATCH_FILE=${BSPATCH_FILE}|' \
			-e 's|APP_DIR=|APP_DIR=$$IPKG_OFFLINE_ROOT/usr/palm/applications/${APP_ID}|' \
		../../autopatch/prerm.testing > $@
	chmod ugo+x $@

clobber::
	rm -rf build
