VERSION=0.0.1

STAGING_DIR=/srv/preware/build/staging/i686

CPPFLAGS := -DVERSION=\"${VERSION}\" -I${STAGING_DIR}/usr/include/glib-2.0 -I${STAGING_DIR}/usr/lib/glib-2.0/include -I${STAGING_DIR}/usr/include
LDFLAGS  := -L${STAGING_DIR}/usr/lib -llunaservice -lmjson -lglib-2.0

exampleservice: exampleservice.o luna_service.o luna_methods.o

clobber:
	rm -rf *.o exampleservice
