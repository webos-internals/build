SRC_GIT = git://gitorious.org/webos-internals/modifications.git
DL_DIR = ../../downloads

build/.unpacked-${VERSION}: ${DL_DIR}/modifications-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src-${VERSION}
	tar -C build/src-${VERSION} -xf ${DL_DIR}/modifications-${VERSION}.tar.gz
	touch $@

${DL_DIR}/modifications-${VERSION}.tar.gz:
	$(call PREWARE_SANITY)
	rm -rf build
	mkdir build
	( cd build ; git clone -n ${SRC_GIT} ; cd `basename ${SRC_GIT} .git`; git checkout v${VERSION} )
	mkdir -p ${DL_DIR}
	tar -C build/`basename ${SRC_GIT} .git` -zcf $@ .
	( cd build/`basename ${SRC_GIT} .git` ; git log --pretty="format:%ct" -n 1 ) | \
	python -c 'import os,sys; time = int(sys.stdin.read()); os.utime("$@",(time,time));'
