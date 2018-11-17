# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="retroarch-common-overlays"
PKG_VERSION="779c2a5"
PKG_SHA256="d23b79083496ec72ce87bb6c81ebc6010f52a6e47f1ea4b2cd78cbf8a0d91ca1"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/common-overlays"
PKG_URL="https://github.com/libretro/common-overlays/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Collection of overlay files for use with libretro frontends, such as RetroArch."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/retroarch/overlay
  cp -r $PKG_BUILD/borders $INSTALL/usr/share/retroarch/overlay
}
