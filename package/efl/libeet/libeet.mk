#############################################################
#
# libeet
#
#############################################################

LIBEET_VERSION = 1.7.0-alpha
LIBEET_SOURCE = eet-$(LIBEET_VERSION).tar.bz2
LIBEET_SITE = http://download.enlightenment.org/releases/
LIBEET_INSTALL_STAGING = YES

LIBEET_DEPENDENCIES = host-pkg-config zlib jpeg libeina

$(eval $(call AUTOTARGETS))
$(eval $(call AUTOTARGETS,host))
