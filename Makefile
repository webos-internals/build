.PHONY: index package toolchain upload clobber clean

index: package
	mkdir -p ipkgs/all
	TAR_OPTIONS=--wildcards \
	toolchain/ipkg-utils/build/ipkg-utils/ipkg-make-index \
		-v -l ipkgs/all/Packages.filelist -p ipkgs/all/Packages ipkgs/all
	gzip -c ipkgs/all/Packages > ipkgs/all/Packages.gz

package: toolchain
	mkdir -p ipkgs/all
	find apps mods plugins -type d -depth 1 -print | \
	xargs -I % ${MAKE} -C % package
	find apps mods plugins -type d -name ipkgs -print | \
	xargs -I % find % -name "*_all.ipk" -print | \
	xargs -I % rsync -i -a % ipkgs/all

toolchain: toolchain/ipkg-utils/build/ipkg-utils/ipkg-make-index

toolchain/ipkg-utils/build/ipkg-utils/ipkg-make-index:
	${MAKE} -C toolchain/ipkg-utils build

upload:
	rsync -avr ipkgs/ ipkg.preware.org:htdocs/ipkg/feeds/preware/

clobber:
	find apps mods plugins toolchain -type d -depth 1 -print | \
	xargs -I % ${MAKE} -C % clobber
	rm -rf ipkgs

clean:
	find . -name "*~" -delete