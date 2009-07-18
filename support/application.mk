.PHONY: package clobber

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

package: ipkgs/${APP_ID}_${VERSION}_${PLATFORM}.ipk

ipkgs/${APP_ID}_${VERSION}_${PLATFORM}.ipk: ${DL_DIR}/${APP_ID}_${VERSION}_${PLATFORM}.ipk
	$(call PREWARE_SANITY)
	mkdir -p ipkgs
	rsync -ai ${DL_DIR}/${APP_ID}_${VERSION}_${PLATFORM}.ipk ipkgs/

endif

clobber::
	$(call PREWARE_SANITY)
	rm -rf ipkgs

