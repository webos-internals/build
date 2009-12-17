.PHONY: jars
jars: ${JARFILES}

.PRECIOUS: ${JARFILES}
${JARFILES}: ${DOCTOR_DIR}/webosdoctorp100ewwsprint.jar
	rm -rf build/java
	mkdir -p build
	unzip -p $< resources/webOS.tar | \
	tar -O -x -f - ./nova-cust-image-castle.rootfs.tar.gz | \
	tar -C build --strip-components=4 -m -z -x -f - ./usr/lib/luna/java
	touch $@

${DOCTOR_DIR}/webosdoctorp100ewwsprint.jar :
	mkdir -p ${DOCTOR_DIR}
	curl -L -o $@ http://palm.cdnetworks.net/rom/pre_p100eww/webosdoctorp100ewwsprint.jar
