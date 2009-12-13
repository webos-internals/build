NAME     = simple-webos
TITLE	 = Simple Application
APP_ID   = org.webosinternals.regression.${NAME}
VERSIONS  = 1.0.0 2.0.0
DESCRIPTION = Regression test for simple webOS application. No dependencies, no install scripts.
TYPE	 = Application
CATEGORY = Simple WebOS

.PHONY: package
ifneq ("${VERSIONS}", "")
package:
	for v in ${VERSIONS} ; do \
	  ${MAKE} VERSIONS= VERSION=$${v} package ; \
	done
else
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
endif
include ../../support/package.mk

build/.built-${VERSION}:
	rm -rf build/all
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	sed -e 's/%VERSION%/${VERSION}/' files/appinfo.json > build/all/usr/palm/applications/${APP_ID}/appinfo.json
	touch $@

clobber::
	rm -rf build
