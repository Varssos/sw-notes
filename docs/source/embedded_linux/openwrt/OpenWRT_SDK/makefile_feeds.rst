Creating package feed
=====================

There will be included how to create locally your own dev feed package. After development phase it should be stored in remote repository e.g. github/gitlab

There are some basic examples. More details are in `OpenWrt Creating packages <https://openwrt.org/docs/guide-developer/packages>`_ 



Example lib package makefile
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

libsnap7 feed
-------------

::

    libsnap7
    ├── Makefile                # feed Makefile for OpenWrt 
    └── Makefile.libsnap7       # makefile to generate shared library for mips and gather header files

Makefile

.. code-block:: makefile

    include $(TOPDIR)/rules.mk
    
    PKG_NAME:=libsnap7
    PKG_VERSION:=1.4.2
    PKG_RELEASE:=1
    
    PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
    PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
    PKG_SOURCE_URL:=https://github.com/sebastianwach/snap7.git
    PKG_SOURCE_PROTO:=git
    PKG_SOURCE_VERSION:=03766c2deff40365822e768d50265381e5934895

    
    include $(INCLUDE_DIR)/package.mk
    
    define Package/$(PKG_NAME)
        SECTION:=libraries
        CATEGORY:=Libraries
        TITLE:=Step7 Open Source Ethernet Communication Suite
        DEPENDS:=+libstdcpp
    endef

    define Package/$(PKG_NAME)/description
        libsnap7 - Step7 Open Source Ethernet Communication Suite
    endef

    define Build/Prepare
        $(PKG_UNPACK)
        $(CP) ./Makefile.$(PKG_NAME) $(PKG_BUILD_DIR)/Makefile
        $(INSTALL_DIR) $(PKG_BUILD_DIR)/dist/usr/include/snap7
        $(INSTALL_DIR) $(PKG_BUILD_DIR)/dist/usr/lib
    endef

    define Build/Compile
        export CXX="$(TARGET_CXX)"; \
        export CXXFLAGS="$(TARGET_CXXFLAGS)"; \
        export LDFLAGS="$(TARGET_LDFLAGS)"; \
        make -C $(PKG_BUILD_DIR)
    endef

    define Build/InstallDev
        $(INSTALL_DIR) $(1)/usr/include
        $(INSTALL_DIR) $(1)/usr/lib/
        $(CP) $(PKG_BUILD_DIR)/dist/usr/include/snap7 $(1)/usr/include/
        $(CP) $(PKG_BUILD_DIR)/dist/usr/lib/*.so $(1)/usr/lib/
    endef

    define Package/$(PKG_NAME)/install
        $(INSTALL_DIR) $(1)/usr/include
        $(INSTALL_DIR) $(1)/usr/lib/
        $(CP) $(PKG_BUILD_DIR)/dist/usr/include/snap7 $(1)/usr/include/
        $(CP) $(PKG_BUILD_DIR)/dist/usr/lib/*.so $(1)/usr/lib/
    endef
    
    $(eval $(call BuildPackage,$(PKG_NAME)))


Makefile.libsnap7

.. code-block:: makefile

    LIBSNAP7_FOLDER=snap7-full-1.4.2

    LIBSNAP7_INCLUDES=\
        -I./$(LIBSNAP7_FOLDER)/src/sys \
        -I./$(LIBSNAP7_FOLDER)/src/core \
        -I./$(LIBSNAP7_FOLDER)/src/lib 

    libsnap7.so: \
        ./$(LIBSNAP7_FOLDER)/src/sys/*.cpp ./$(LIBSNAP7_FOLDER)/src/sys/*.h \
        ./$(LIBSNAP7_FOLDER)/src/core/*.cpp ./$(LIBSNAP7_FOLDER)/src/core/*.h \
        ./$(LIBSNAP7_FOLDER)/src/lib/*.cpp ./$(LIBSNAP7_FOLDER)/src/lib/*.h
        $(CXX) $(CXXFLAGS) -fPIC -c ./$(LIBSNAP7_FOLDER)/src/sys/*.cpp $(LIBSNAP7_INCLUDES)
        $(CXX) $(CXXFLAGS) -fPIC -c ./$(LIBSNAP7_FOLDER)/src/core/*.cpp $(LIBSNAP7_INCLUDES)
        $(CXX) $(CXXFLAGS) -fPIC -c ./$(LIBSNAP7_FOLDER)/src/lib/*.cpp $(LIBSNAP7_INCLUDES)
        $(CXX) $(LDFLAGS) -shared -o $@ *.o -pthread -lrt
        cp -r ./$@ ./dist/usr/lib/
        cd ./$(LIBSNAP7_FOLDER)/src; find ./ -type f -name '*.h' -exec cp --parents '{}' ../../dist/usr/include/snap7 ';'

