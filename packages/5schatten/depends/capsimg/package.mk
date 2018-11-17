# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="capsimg"
PKG_VERSION="067db4c"
PKG_SHA256="cfa9acf876254426781925366af67d70d392542d90d6367288d1ab162fc1a7e8"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/FrodeSolheim/capsimg"
PKG_URL="https://github.com/FrodeSolheim/capsimg/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="SPS Decoder Library 5.1 (formerly IPF Decoder Lib)"
PKG_TOOLCHAIN="manual"

make_target() {
 ./bootstrap
 ./configure $options --host=$TARGET_NAME
  make -j 4
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib
  mv capsimg.so libcapsimage.so.5.1
  cp -f libcapsimage.so.5.1 $INSTALL/usr/lib/
  ln -sf libcapsimage.so.5.1 $INSTALL/usr/lib/libcapsimage.so.5
}
