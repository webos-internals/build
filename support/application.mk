.PHONY: sanity download package

PREWARE_SANITY =
ifndef NAME
PREWARE_SANITY += $(error "Please define APP_ID in your Makefile")
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

build/${APP_ID}_${VERSION}_all.ipk:
	$(call PREWARE_SANITY)
	mkdir -p build
	curl -o build/${APP_ID}_${VERSION}_${PLATFORM}.ipk ${SRC_IPKG}

package: build/${APP_ID}_${VERSION}_all.ipk

download: build/${APP_ID}_${VERSION}_all.ipk

endif

clobber:
	$(call PREWARE_SANITY)
	rm -rf build

