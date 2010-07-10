build_apps/speechd: build_common/libdotconf build_media/libsndfile build_media/pulseaudio
	$(MAKE) -C packages/apps/speechd stage-local ARCH=$(ARCH)

clobber_apps/speechd: 
	$(MAKE) -C packages/apps/speechd clobber ARCH=$(ARCH)
