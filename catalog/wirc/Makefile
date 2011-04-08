EXTRAID = catalog.
SSL=0
include ../../testing/wirc/Makefile

post-unpack: build/.unpacked-${VERSION}
	sed -i -e 's/org\.webosinternals\.wirc/org\.webosinternals\.catalog\.wirc/' build/src/appinfo.json
