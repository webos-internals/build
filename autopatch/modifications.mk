GIT_TREE = git://gitorious.org/webos-internals/modifications.git

include ../../support/download.mk

build/.unpacked: ${DL_DIR}/modifications.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/modifications.tar.gz
	touch $@

${DL_DIR}/modifications.tar.gz:
		$(call PREWARE_SANITY)
	rm -rf build
	mkdir build
	( cd build ; git clone -n ${GIT_TREE} ; cd `basename ${GIT_TREE} .git`; git checkout HEAD )
	mkdir -p ${DL_DIR}
	tar -C build/`basename ${GIT_TREE} .git` -zcf $@ .
	( cd build/`basename ${GIT_TREE} .git` ; git log --pretty="format:%ct" -n 1 ) | \
	python -c 'import os,sys; time = int(sys.stdin.read()); os.utime("$@",(time,time));'
