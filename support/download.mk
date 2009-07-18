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
