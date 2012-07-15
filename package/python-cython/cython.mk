#############################################################
#
# python-cython
#
#############################################################

PYTHON_CYTHON_VERSION = 0.16
PYTHON_CYTHON_SOURCE = Cython-$(CYTHON_VERSION).tar.gz
PYTHON_CYTHON_SITE = http://cython.org/release
PYTHON_CYTHON_HOST_DEPENDENCIES = host-python

PYTHON_CYTHON_INSTALL_PATH = $(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
PYTHON_CYTHON_BINARY = $(CYTHON_INSTALL_PATH)/cython.py

define HOST_PYTHON_CYTHON_INSTALL_CMDS
	cp -r $(@D)/cython.py $(@D)/Cython $(PYTHON_CYTHON_INSTALL_PATH)
endef

$(eval $(call GENTARGETS,host))
