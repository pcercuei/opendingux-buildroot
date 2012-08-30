################################################################################
#
# libelementary
#
################################################################################

LIBELEMENTARY_VERSION = 1.7.0-alpha
LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.bz2
LIBELEMENTARY_SITE = http://download.enlightenment.org/releases/
LIBELEMENTARY_INSTALL_STAGING = YES

LIBELEMENTARY_DEPENDENCIES = libeina libevas libecore libedje host-libedje \
				host-libeet

LIBELEMENTARY_CONF_OPT = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
			 --with-eet-eet=$(HOST_DIR)/usr/bin/eet

$(eval $(call AUTOTARGETS))
