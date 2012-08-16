################################################################################
#
# python-ecore -- Python bindings for Ecore
#
################################################################################

PYTHON_ECORE_VERSION = HEAD
PYTHON_ECORE_SITE_METHOD = svn
PYTHON_ECORE_SITE = http://svn.enlightenment.org/svn/e/trunk/BINDINGS/python/python-ecore
PYTHON_ECORE_DEPENDENCIES = python libecore host-python-cython
PYTHON_ECORE_AUTORECONF = YES
PYTHON_ECORE_CONF_ENV = PYTHON_INCLUDES="$(HOST_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)"
PYTHON_ECORE_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_PYTHON_EVAS),y)
PYTHON_ECORE_DEPENDENCIES += python-evas
endif

$(eval $(call AUTOTARGETS))
