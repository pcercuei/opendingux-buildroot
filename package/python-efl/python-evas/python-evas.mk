################################################################################
#
# python-evas -- Python bindings for Evas
#
################################################################################

PYTHON_EVAS_VERSION = HEAD
PYTHON_EVAS_SITE_METHOD = svn
PYTHON_EVAS_SITE = http://svn.enlightenment.org/svn/e/trunk/BINDINGS/python/python-evas
PYTHON_EVAS_DEPENDENCIES = python libevas host-python-cython
PYTHON_EVAS_AUTORECONF = YES
PYTHON_EVAS_CONF_ENV = PYTHON_INCLUDES="$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)"
PYTHON_EVAS_INSTALL_STAGING = YES

$(eval $(call AUTOTARGETS))
