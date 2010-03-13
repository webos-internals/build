NAME     = remove-all-packages
TITLE	 = Remove All Regression Testing Packages
APP_ID   = org.webosinternals.regression.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSIONS  = 1.0.0 2.0.0
DESCRIPTION = Maintenance package to remove any other packages which intentionally prevent themselves being removed normally.  It does this whenever it is removed (but not when it is updated).
TYPE	 = Service
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
	mkdir -p build/all
	touch $@

clobber::
	rm -rf build
