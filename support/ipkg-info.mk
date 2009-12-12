
build/ipkg-info-%: ${DL_DIR}/ipkg-info-%
	rm -rf build/ipkg-info-$*
	mkdir -p build/ipkg-info-$*
	cp $</*.list $@/

.PRECIOUS: ${DL_DIR}/ipkg-info-%
${DL_DIR}/ipkg-info-%: ${DL_DIR}/webosdoctorp100ewwsprint-%.jar
	if [ -e $< ]; then \
		unzip -p $< resources/webOS.tar | \
		tar -O -x -f - ./nova-cust-image-castle.rootfs.tar.gz | \
		tar -C ${DL_DIR} -m -z -x -f - ./usr/lib/ipkg/info; \
		mv ${DL_DIR}/usr/lib/ipkg/info ${DL_DIR}/ipkg-info-$*; \
		rm -rf ${DL_DIR}/usr; \
	fi
	mkdir -p $@

${DL_DIR}/webosdoctorp100ewwsprint-1.2.1.jar:
	mkdir -p ${DL_DIR}
	curl -L -o $@ http://palm.cdnetworks.net/rom/p121r0d10092009/sr1ntp121rod/webosdoctorp100ewwsprint.jar

${DL_DIR}/webosdoctorp100ewwsprint-1.3.1.jar:
	mkdir -p ${DL_DIR}
	curl -L -o $@ http://palm.cdnetworks.net/rom/pre/p131r0d11172009/sr1ntp131rod/webosdoctorp100ewwsprint.jar

.PHONY: ${DL_DIR}/webosdoctorp100ewwsprint-1.3.5.jar
${DL_DIR}/ipkg-info-1.3.5: ${DL_DIR}/ipkg-info-1.3.1
	cp -r $< $@

