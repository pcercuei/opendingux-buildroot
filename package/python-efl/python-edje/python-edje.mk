################################################################################
#
# python-edje -- Python bindings for Edje
#
################################################################################

PYTHON_EDJE_VERSION = HEAD
PYTHON_EDJE_SITE_METHOD = svn
PYTHON_EDJE_SITE = http://svn.enlightenment.org/svn/e/trunk/BINDINGS/python/python-edje
PYTHON_EDJE_DEPENDENCIES = python libedje host-python-cython
PYTHON_EDJE_AUTORECONF = YES
PYTHON_EDJE_CONF_ENV = PYTHON_INCLUDES="$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)"
PYTHON_EDJE_INSTALL_STAGING = YES

$(eval $(call AUTOTARGETS))
