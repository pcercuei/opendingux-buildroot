#############################################################
#
# DinguxCommander
#
#############################################################
DINGUX_COMMANDER_VERSION = master
DINGUX_COMMANDER_SITE = git://github.com/gcwnow/DinguxCommander.git
DINGUX_COMMANDER_DEPENDENCIES = sdl sdl_image sdl_ttf

DINGUX_COMMANDER_RESDIR = /usr/share/DinguxCommander

define DINGUX_COMMANDER_BUILD_CMDS
	$(MAKE) CXX="$(TARGET_CXX)" RESDIR="$(DINGUX_COMMANDER_RESDIR)" SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config" LD="$(TARGET_LD)" CONFIG=opendingux -C $(@D)
endef

ifeq ($(BR2_PACKAGE_GMENU2X),y)
DINGUX_COMMANDER_DEPENDENCIES += gmenu2x
define DINGUX_COMMANDER_INSTALL_TARGET_GMENU2X
	$(INSTALL) -m 0644 -D package/dingux-commander/gmenu2x $(TARGET_DIR)/usr/share/gmenu2x/sections/applications/25_DinguxCommander
endef
endif

define DINGUX_COMMANDER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/output/opendingux/DinguxCommander $(TARGET_DIR)/usr/bin/DinguxCommander
	$(INSTALL) -m 0755 -d $(TARGET_DIR)/$(DINGUX_COMMANDER_RESDIR)/
	$(INSTALL) -m 0644 -t $(TARGET_DIR)/$(DINGUX_COMMANDER_RESDIR)/ $(@D)/res/*
	$(DINGUX_COMMANDER_INSTALL_TARGET_GMENU2X)
endef

$(eval $(generic-package))
