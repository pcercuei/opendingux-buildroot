#############################################################
#
# libeina
#
#############################################################

LIBEINA_VERSION = 1.2.1
LIBEINA_SOURCE = eina-$(LIBEINA_VERSION).tar.bz2
LIBEINA_SITE = http://download.enlightenment.org/releases/
LIBEINA_INSTALL_STAGING = YES

LIBEINA_DEPENDENCIES = host-pkg-config

$(eval $(call AUTOTARGETS))
$(eval $(call AUTOTARGETS,host))
