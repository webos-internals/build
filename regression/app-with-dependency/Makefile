NAME     = app-with-dependency
TITLE	 = Application With Dependency
APP_ID   = org.webosinternals.regression.${NAME}
DEPENDS  = org.webosinternals.regression.simple-service
VERSIONS  = 1.0.0 2.0.0
DESCRIPTION = Regression test for a webOS application with a dependency on a service.
TYPE	 = Application
CATEGORY = Regression Tests
FEED     = Regression Tests

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
