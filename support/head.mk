ifdef SRC_GIT

ifndef NAME
PREWARE_SANITY += $(error "Please define NAME in your Makefile")
endif

.PHONY: head
head:
	rm -f ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	$(call PREWARE_SANITY)
	rm -rf build/`basename ${SRC_GIT} .git`
	mkdir -p build
	( cd build ; git clone ${SRC_GIT} )
	mkdir -p ${DL_DIR}
	tar -C build/`basename ${SRC_GIT} .git` -zcf ${DL_DIR}/${NAME}-${VERSION}.tar.gz .
	$(MAKE) package
	rm -f ${DL_DIR}/${NAME}-${VERSION}.tar.gz
endif


