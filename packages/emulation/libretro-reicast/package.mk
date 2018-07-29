# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libretro-reicast"
PKG_VERSION="59d721c"
PKG_SHA256="17fa8ee75a25789e8fa408dfdbae100b52619a6ab5cde7581c79edc6ec3b89b3"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/reicast-emulator"
PKG_URL="https://github.com/libretro/reicast-emulator/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="reicast-emulator-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain kodi-platform"
PKG_SECTION="emulation"
PKG_SHORTDESC="Reicast is a multiplatform Sega Dreamcast emulator"
PKG_LONGDESC="Reicast is a multiplatform Sega Dreamcast emulator"
PKG_TOOLCHAIN="manual"
PKG_BUILD_FLAGS="-gold"

PKG_LIBNAME="reicast_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"
PKG_LIBVAR="REICAST_LIB"

make_target() {
  case $DEVICE in
    RPi)
      make GIT_VERSION=$PKG_VERSION WITH_DYNAREC=$ARCH FORCE_GLES=1 platform=rpi
      ;;
    RPi2)
      make GIT_VERSION=$PKG_VERSION WITH_DYNAREC=$ARCH FORCE_GLES=1 platform=rpi2
      ;;
  esac

  if [ "$ARCH" = "x86_64" ]; then
      rm -rf tmp/*.so
      mkdir -p tmp
      make AS=${AS} CC_AS=${AS} GIT_VERSION=$PKG_VERSION
      mv *.so tmp
      make clean
      make AS=${AS} CC_AS=${AS} HAVE_OIT=1 GIT_VERSION=$PKG_VERSION WITH_DYNAREC=$ARCH
      mv tmp/*.so .
  fi
}

makeinstall_target() {
  if [ ! "$OEM_EMU" = "no" ]; then
    mkdir -p $INSTALL/usr/lib/libretro
    cp reicast*.so $INSTALL/usr/lib/libretro/
  fi

  mkdir -p $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME
  cp $PKG_LIBPATH $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME
  echo "set($PKG_LIBVAR $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME)" > $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME/$PKG_NAME-config.cmake
}
