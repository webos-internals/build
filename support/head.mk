ifdef SRC_GIT

ifndef NAME
PREWARE_SANITY += $(error "Please define NAME in your Makefile")
endif

.PHONY: head
head:
	rm -f ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	$(call PREWARE_SANITY)
	$(MAKE) GIT_TAG=HEAD download
	$(MAKE) package
	rm -f ${DL_DIR}/${NAME}-${VERSION}.tar.gz
endif


