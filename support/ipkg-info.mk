
build/ipkg-info-%: ${DOCTOR_DIR}/ipkg-info-%
	rm -rf build/ipkg-info-$*
	mkdir -p build/ipkg-info-$*
	cp $</*.list $@/

.PRECIOUS: ${DOCTOR_DIR}/ipkg-info-%
${DOCTOR_DIR}/ipkg-info-%: ${DOCTOR_DIR}/webosdoctor-%.jar
	if [ -e $< ]; then \
		unzip -p $< resources/webOS.tar | \
		tar -O -x -f - ./nova-cust-image-castle.rootfs.tar.gz | \
		tar -C ${DOCTOR_DIR} -m -z -x -f - ./usr/lib/ipkg/info; \
		mv ${DOCTOR_DIR}/usr/lib/ipkg/info ${DOCTOR_DIR}/ipkg-info-$*; \
		rm -rf ${DOCTOR_DIR}/usr; \
	fi
	mkdir -p $@

${DOCTOR_DIR}/webosdoctor-1.1.3.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp100eww-wr-1.1.3.jar ] ; then \
	  ln -s webosdoctorp100eww-wr-1.1.3.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/p113r0d10122009/wr640xdfgy12z/webosdoctorp100eww-wr.jar ; \
	fi

${DOCTOR_DIR}/webosdoctor-1.2.1.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp100ewwsprint-1.2.1.jar ] ; then \
	  ln -s webosdoctorp100ewwsprint-1.2.1.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/p121r0d10092009/sr1ntp121rod/webosdoctorp100ewwsprint.jar ; \
	fi

${DOCTOR_DIR}/webosdoctor-1.3.1.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp100ewwsprint-1.3.1.jar ] ; then \
	  ln -s webosdoctorp100ewwsprint-1.3.1.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/pre/p131r0d11172009/sr1ntp131rod/webosdoctorp100ewwsprint.jar ; \
	fi

${DOCTOR_DIR}/webosdoctor-1.3.5.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp100ewwsprint-1.3.5.jar ] ; then \
	  ln -s webosdoctorp100ewwsprint-1.3.5.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/pre/p135r0d12302009/sr1ntp135rod/webosdoctorp100ewwsprint.jar ; \
	fi

${DOCTOR_DIR}/webosdoctor-1.4.0.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp100ewwsprint-1.4.0.jar ] ; then \
	  ln -s webosdoctorp100ewwsprint-1.4.0.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/pre/p14r0d02252010/sr1ntp140rod/webosdoctorp100ewwsprint.jar; \
	fi
