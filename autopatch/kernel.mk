SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_VERSION = 2.6.24
KERNEL_SOURCE = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}.tgz
KERNEL_PATCH  = http://palm.cdnetworks.net/opensource/${WEBOS_VERSION}/linuxkernel-${KERNEL_VERSION}-patch\(pre\).gz
DL_DIR = ../../downloads

build/.unpacked-${VERSION}: ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}.tgz \
			    ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-patch-pre.gz \
			    ${DL_DIR}/patches-${VERSION}.tar.gz
	rm -rf build/src-${VERSION}
	mkdir -p build/src-${VERSION}/patches
	tar -C build/src-${VERSION} -xf ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}.tgz
	zcat ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-patch-pre.gz | \
		patch -d build/src-${VERSION}/linux-${KERNEL_VERSION} -p1 
	tar -C build/src-${VERSION}/patches -xf ${DL_DIR}/patches-${VERSION}.tar.gz
	if [ -n "${KERNEL_PATCHES}" ] ; then
	  ( cd build/src-${VERSION}/patches ; cat ${KERNEL_PATCHES} ) | \
		patch -d build/src-${VERSION}/linux-${KERNEL_VERSION} -p1
	fi
	touch $@

${DL_DIR}/patches-${VERSION}.tar.gz:
	$(call PREWARE_SANITY)
	mkdir -p build
	( cd build ; rm -rf `basename ${SRC_GIT} .git` )
	( cd build ; git clone -n ${SRC_GIT} ; cd `basename ${SRC_GIT} .git`; git checkout v${VERSION} )
	mkdir -p ${DL_DIR}
	tar -C build/`basename ${SRC_GIT} .git` -zcf $@ .
	( cd build/`basename ${SRC_GIT} .git` ; git log --pretty="format:%ct" -n 1 ) | \
	python -c 'import os,sys; time = int(sys.stdin.read()); os.utime("$@",(time,time));'

${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}.tgz:
	rm -f $@ $@.tmp
	mkdir -p ${DL_DIR}
	curl -f -R -L -o $@.tmp ${KERNEL_SOURCE}
	mv $@.tmp $@

${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${WEBOS_VERSION}-patch-pre.gz:
	rm -f $@ $@.tmp
	mkdir -p ${DL_DIR}
	curl -f -R -L -o $@.tmp ${KERNEL_PATCH}
	mv $@.tmp $@

