# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libretro-mgba"
PKG_VERSION="f04e3a7"
PKG_SHA256="1dffcc06cb145e084dc56f3704402aadcd37a922febce0ec046636acbd18c20d"
PKG_ARCH="any"
PKG_LICENSE="MPL 2.0"
PKG_SITE="https://github.com/libretro/mgba"
PKG_URL="https://github.com/libretro/mgba/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="mgba-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain kodi-platform"
PKG_SECTION="emulation"
PKG_SHORTDESC="game.libretro.mgba: mGBA for Kodi"
PKG_LONGDESC="game.libretro.mgba: mGBA for Kodi"
PKG_TOOLCHAIN="manual"

PKG_LIBNAME="mgba_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"
PKG_LIBVAR="MGBA_LIB"

pre_configure_target() {
  # fails to build in subdirs
  cd $PKG_BUILD
  rm -rf .$TARGET_NAME
}

make_target() {
  if [ "$PROJECT" == "Amlogic" ]; then
      make -f Makefile.libretro platform=unix-armv HAVE_NEON=1 GIT_VERSION=$PKG_VERSION
  fi

  if [ "$PROJECT" == "Generic" ]; then
      make -f Makefile.libretro GIT_VERSION=$PKG_VERSION
  fi

  if [ "$PROJECT" == "RPi" ]; then
    case $DEVICE in
      RPi)
      make -f Makefile.libretro platform=unix-armv HAVE_NEON=1 GIT_VERSION=$PKG_VERSION
        ;;
      RPi2)
      make -f Makefile.libretro platform=unix-armv CC=$CC CXX=$CXX GIT_VERSION=$PKG_VERSION
        ;;
    esac
  fi
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
