.PHONY: jars
jars: ${JARFILES}

.PRECIOUS: ${JARFILES}
${JARFILES}: ${DOCTOR_DIR}/webosdoctor-1.4.0.jar
	rm -rf build/java
	mkdir -p build
	unzip -p $< resources/webOS.tar | \
	tar -O -x -f - ./nova-cust-image-castle.rootfs.tar.gz | \
	tar -C build --strip-components=4 -m -z -x -f - ./usr/lib/luna/java
	touch $@

${DOCTOR_DIR}/webosdoctor-1.4.0.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp100ewwsprint-1.4.0.jar ] ; then \
	  ln -s webosdoctorp100ewwsprint-1.4.0.jar $@ ; \
	else \
	  curl -L -o $@ http://downloads.help.palm.com/rom/pre/p14r0d02252010/sr1ntp140rod/webosdoctorp100ewwsprint.jar; \
	fi
