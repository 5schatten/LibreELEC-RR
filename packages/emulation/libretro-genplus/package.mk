# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libretro-genplus"
PKG_VERSION="1186577"
PKG_SHA256="0393d7a9fdb15d8fcd26d8449e0746cca44b1e05d6959257ef6b8a0c18c75826"
PKG_ARCH="any"
PKG_LICENSE="Modified BSD / LGPLv2.1"
PKG_SITE="https://github.com/libretro/Genesis-Plus-GX"
PKG_URL="https://github.com/libretro/Genesis-Plus-GX/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="Genesis-Plus-GX-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain kodi-platform"
PKG_SECTION="emulation"
PKG_SHORTDESC="game.libretro.genplus: Genesis Plus GX for Kodi"
PKG_LONGDESC="game.libretro.genplus: Genesis Plus GX for Kodi"
PKG_TOOLCHAIN="manual"

PKG_LIBNAME="genesis_plus_gx_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"
PKG_LIBVAR="GENPLUS_LIB"

pre_build_target() {
  export GIT_VERSION=$PKG_VERSION
}

make_target() {
  make -f Makefile.libretro
}

makeinstall_target() {
  if [ ! "$OEM_EMU" = "no" ]; then
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
  fi

  mkdir -p $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME
  cp $PKG_LIBPATH $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME
  echo "set($PKG_LIBVAR $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME)" > $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME/$PKG_NAME-config.cmake
}
