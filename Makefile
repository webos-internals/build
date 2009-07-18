.PHONY: index package toolchain clobber clean

index: package
	mkdir -p ipkgs
	TAR_OPTIONS=--wildcards \
	toolchain/ipkg-utils/build/ipkg-utils/ipkg-make-index \
		-v -l ipkgs/Packages.filelist -p ipkgs/Packages ipkgs
	gzip -c ipkgs/Packages > ipkgs/Packages.gz

package: toolchain
	mkdir -p ipkgs
	find apps mods plugins -type d -depth 1 -print | \
	xargs -I % ${MAKE} -C % package
	find apps mods plugins -type d -name ipkgs -print | \
	xargs -I % find % -name "*.ipk" -print | \
	xargs -I % rsync -i -a % ipkgs/

toolchain: toolchain/ipkg-utils/build/ipkg-utils/ipkg-make-index

toolchain/ipkg-utils/build/ipkg-utils/ipkg-make-index:
	${MAKE} -C toolchain/ipkg-utils build

clobber:
	find apps mods plugins toolchain -type d -depth 1 -print | \
	xargs -I % ${MAKE} -C % clobber
	rm -rf ipkgs

clean:
	find . -name "*~" -delete