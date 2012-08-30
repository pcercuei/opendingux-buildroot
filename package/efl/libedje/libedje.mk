#############################################################
#
# libedje
#
#############################################################

LIBEDJE_VERSION = 1.2.1
LIBEDJE_SOURCE = edje-$(LIBEDJE_VERSION).tar.bz2
LIBEDJE_SITE =  http://download.enlightenment.org/releases/
LIBEDJE_INSTALL_STAGING = YES

LIBEDJE_DEPENDENCIES = host-pkg-config lua libeina libeet libecore libevas \
			libembryo

ifeq ($(BR2_PREFER_SOFT_FLOAT),y)
LIBEDJE_CONF_OPT += --enable-fixed-point
endif

HOST_LIBEDJE_CONF_OPT += --enable-edje-cc \
					--enable-edje-decc \
					--enable-edje-recc \
					--enable-ejde-player \
					--enable-ejde-inspector \
					--enable-edje-external-inspector \
					--enable-edje-watch

ifeq ($(BR2_PACKAGE_LIBEDJE_TOOLS),y)
LIBEDJE_CONF_OPT += --enable-edje-cc \
					--enable-edje-decc \
					--enable-edje-recc \
					--enable-ejde-player \
					--enable-ejde-inspector \
					--enable-edje-external-inspector \
					--enable-edje-watch
else
LIBEDJE_CONF_OPT += --disable-edje-cc \
					--disable-edje-decc \
					--disable-edje-recc \
					--disable-edje-player \
					--disable-edje-inspector \
					--disable-edje-external-inspector \
					--disable-edje-watch
endif

$(eval $(call AUTOTARGETS))
$(eval $(call AUTOTARGETS,host))
