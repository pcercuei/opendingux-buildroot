#############################################################
#
# SDL_mixer
#
#############################################################
SDL_MIXER_VERSION:=1.2.11
SDL_MIXER_SOURCE:=SDL_mixer-$(SDL_MIXER_VERSION).tar.gz
SDL_MIXER_SITE:=http://www.libsdl.org/projects/SDL_mixer/release/

SDL_MIXER_INSTALL_STAGING = YES
SDL_MIXER_DEPENDENCIES = sdl timidity-instruments
SDL_MIXER_CONF_OPT = \
	--without-x \
	--with-sdl-prefix=$(STAGING_DIR)/usr \
	--disable-music-mp3 \
	--disable-music-flac # configure script fails when cross compiling

ifeq ($(BR2_PACKAGE_TIMIDITY_INSTRUMENTS),y)
SDL_MIXER_CONF_OPT += \
	--enable-music-midi \
	--enable-music-timidity-midi \
	--disable-music-native-midi \
	--disable-music-native-midi-gpl
else
SDL_MIXER_CONF_OPT += --disable-music-midi
endif

ifeq ($(BR2_PACKAGE_LIBMIKMOD),y)
SDL_MIXER_CONF_OPT += \
	--enable-music-mod \
	LIBMIKMOD_CONFIG=$(STAGING_DIR)/usr/bin/libmikmod-config
SDL_MIXER_DEPENDENCIES += libmikmod
else
SDL_MIXER_CONF_OPT += --disable-music-mod
endif

ifeq ($(BR2_PACKAGE_LIBMAD),y)
SDL_MIXER_CONF_OPT += --enable-music-mp3-mad-gpl
SDL_MIXER_DEPENDENCIES += libmad
else
SDL_MIXER_CONF_OPT += --disable-music-mp3-mad-gpl
endif

# prefer tremor over libvorbis
ifeq ($(BR2_PACKAGE_TREMOR),y)
SDL_MIXER_CONF_OPT += --enable-music-ogg-tremor
SDL_MIXER_DEPENDENCIES += tremor
else
ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
SDL_MIXER_CONF_OPT += --enable-music-ogg
SDL_MIXER_DEPENDENCIES += libvorbis
else
SDL_MIXER_CONF_OPT += --disable-music-ogg
endif
endif

define SDL_MIXER_INSTALL_TARGET_CMDS
	cp -dpf $(STAGING_DIR)/usr/lib/libSDL_mixer*.so* $(TARGET_DIR)/usr/lib/
endef

define SDL_MIXER_CLEAN_CMDS
	rm -f $(TARGET_DIR)/usr/lib/libSDL_mixer*.so*
	-$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) uninstall
	-$(MAKE) -C $(@D) clean
endef

$(eval $(call AUTOTARGETS))
