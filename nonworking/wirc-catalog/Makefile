EXTRAID = catalog.
SSL=0
include ../../apps/wirc/Makefile

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	sed -i -e 's/org\.webosinternals\.wirc/org\.webosinternals\.catalog\.wirc/' build/src/appinfo.json
	touch $@
