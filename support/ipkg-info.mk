build/ipkg-info-%: ${DOCTOR_DIR}/ipkg-info-%
	rm -rf build/ipkg-info-$*
	mkdir -p build/ipkg-info-$*
	if [ "`ls $</*.list`" != "" ]; then \
		cp $</*.list $@/; \
	fi

.PRECIOUS: ${DOCTOR_DIR}/ipkg-info-%
${DOCTOR_DIR}/ipkg-info-%: ${DOCTOR_DIR}/webosdoctor-%.jar
	if [ -e $< ]; then \
		unzip -p $< resources/webOS.tar | \
		tar --wildcards -O -x -f - './nova-cust-image-*.rootfs.tar.gz' | \
		tar -C ${DOCTOR_DIR} -m -z -x -f - ./usr/lib/ipkg/info; \
		mv ${DOCTOR_DIR}/usr/lib/ipkg/info ${DOCTOR_DIR}/ipkg-info-$*; \
		rm -rf ${DOCTOR_DIR}/usr; \
	fi
	mkdir -p $@

${DOCTOR_DIR}/webosdoctor-1.4.5.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp100ueu-wr-1.4.5.jar ] ; then \
	  ln -s webosdoctorp100ueu-wr-1.4.5.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/pre/p145r0d06302010/eudep145rod/webosdoctorp100ueu-wr.jar; \
	fi

${DOCTOR_DIR}/webosdoctor-2.0.0.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp103ueu-wr-2.0.0.jar ] ; then \
	  ln -s webosdoctorp103ueu-wr-2.0.0.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/pre2/p20r0d11182010/wrep20rod/webosdoctorp103ueu-wr.jar; \
	fi

${DOCTOR_DIR}/webosdoctor-2.0.1.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp102ueuna-wr-2.0.1.jar ] ; then \
	  ln -s webosdoctorp102ueuna-wr-2.0.1.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/pre2/p201r0d11242010/wrep201rod/webosdoctorp102ueuna-wr.jar; \
	fi
