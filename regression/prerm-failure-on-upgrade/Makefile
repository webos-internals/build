NAME     = prerm-failure-on-upgrade
TITLE	 = Pre-Remove Script Failure On Upgrade
APP_ID   = org.webosinternals.regression.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSIONS  = 1.0.0 2.0.0
DESCRIPTION = Regression test for a pre-remove script failure on upgrade.
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

build/all/CONTROL/prerm:
ifeq ("${VERSION}","2.0.0")
	sed -e 's/%RETVAL%/1/' control/prerm > $@
else
	sed -e 's/%RETVAL%/0/' control/prerm > $@
endif
	chmod ugo+x $@

clobber::
	rm -rf build
