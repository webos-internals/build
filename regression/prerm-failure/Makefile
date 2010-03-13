NAME     = prerm-failure
TITLE	 = Pre-Remove Script Failure
APP_ID   = org.webosinternals.regression.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSIONS  = 1.0.0 2.0.0
DESCRIPTION = Regression test for a pre-remove script failure.
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
