Creating package feed
=====================

There will be included how to create locally your own dev feed package. After development phase it should be stored in remote repository e.g. github/gitlab

There are some basic examples. More details are in `OpenWrt Creating packages <https://openwrt.org/docs/guide-developer/packages>`_ 



Example lib package makefile
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: makefile

    include $(TOPDIR)/rules.mk
    
    PKG_NAME:=libsnap7
    PKG_VERSION:=1.4.2
    PKG_RELEASE:=1
    
    PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
    PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
    PKG_SOURCE_URL:=https://ct-git.krakow.comarch/biblioteka/snap7.git
    PKG_SOURCE_PROTO:=git
    PKG_SOURCE_VERSION:=c3f011ad0443597be502bd897638ea78ce18537b

    
    include $(INCLUDE_DIR)/package.mk
    
    define Package/$(PKG_NAME)
        SECTION:=Libraries
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
