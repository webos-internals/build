NAME     = terminal
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.2.0
DEPENDS = org.webosinternals.termplugin

SRC_GIT = git://git.webos-internals.org/applications/terminal.git
include ../../support/download.mk

build/.built build/.unpack: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/${NAME}/usr/palm/applications/${APP_ID}
	tar -C build/${NAME}/usr/palm/applications/${APP_ID} -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build/${NAME}/usr/palm/applications/${APP_ID}/.git
	touch $@

include ../../support/application-package.mk

clobber::
	rm -rf build
