# This file is part of MXE.
# See index.html for further information.

PKG             := qtactiveqt
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(qtbase_VERSION)
$(PKG)_CHECKSUM := 9b78055dbd3c59e6cc312cd88ffb8503a34cfc397f26114039b38c5894913c91
$(PKG)_SUBDIR    = $(subst qtbase,qtactiveqt,$(qtbase_SUBDIR))
$(PKG)_FILE      = $(subst qtbase,qtactiveqt,$(qtbase_FILE))
$(PKG)_URL       = $(subst qtbase,qtactiveqt,$(qtbase_URL))
$(PKG)_DEPS     := gcc qtbase

define $(PKG)_UPDATE
    echo $(qtbase_VERSION)
endef

define $(PKG)_BUILD
    cd '$(1)' && '$(PREFIX)/$(TARGET)/qt5/bin/qmake'
    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 install
endef
