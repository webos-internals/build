EXTRAID = appcat.
SSL=0
include ../wirc/Makefile

post-unpack: build/.unpacked-${VERSION}
	sed -i -e 's/org\.webosinternals\.wirc/org\.webosinternals\.appcat\.wirc/' build/src/appinfo.json
