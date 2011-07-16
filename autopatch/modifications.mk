SRC_GIT = git://github.com/webos-internals/patches.git

build/.unpacked-${VERSION}: ${DL_DIR}/modifications-${VERSION}.tar.gz
	rm -rf build/src-${VERSION}
	mkdir -p build/src-${VERSION}
	tar -C build/src-${VERSION} -xf ${DL_DIR}/modifications-${VERSION}.tar.gz
	touch $@

ifeq (${NAME},modifications)
include ../../support/download.mk
else
${DL_DIR}/modifications-${VERSION}.tar.gz:
	rm -f $@
	$(MAKE) NAME=modifications VERSION=${VERSION} VERSIONS= download
endif
