################################################################################
#
# python-elementary -- Python bindings for Elementary
#
################################################################################

PYTHON_ELEMENTARY_VERSION = HEAD
PYTHON_ELEMENTARY_SITE_METHOD = svn
PYTHON_ELEMENTARY_SITE = http://svn.enlightenment.org/svn/e/trunk/BINDINGS/python/python-elementary
PYTHON_ELEMENTARY_DEPENDENCIES = python libelementary host-python-cython
PYTHON_ELEMENTARY_AUTORECONF = YES
PYTHON_ELEMENTARY_CONF_ENV = PYTHON_INCLUDES="$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)"
PYTHON_ELEMENTARY_INSTALL_STAGING = YES

$(eval $(call AUTOTARGETS))
