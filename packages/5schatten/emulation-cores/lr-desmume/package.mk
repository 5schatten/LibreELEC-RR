# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-desmume"
PKG_VERSION="5f6f1ee44310cb7b84111fa86288fcb912da33a7"
PKG_SHA256="b231f187c2eee594bc48622cdf8486e3e135806f297bf34045897028cf4a4977"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/desmume"
PKG_URL="https://github.com/libretro/desmume/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_LONGDESC="DeSmuME is a Nintendo DS emulator"
PKG_TOOLCHAIN="manual"

PKG_LIBNAME="desmume_libretro.so"
PKG_LIBPATH="desmume/src/frontend/libretro/$PKG_LIBNAME"

# Disable OpenGL if not supported
if [ $OPENGL_SUPPORT = "no" ]; then
  PKG_PATCH_DIRS="no-opengl"
fi

make_target() {
  case $TARGET_CPU in
    arm1176jzf-s)
      make -C desmume/src/frontend/libretro -f Makefile.libretro platform=armv6-hardfloat-$TARGET_CPU GIT_VERSION=${PKG_VERSION:0:7}
      ;;
    cortex-a7|cortex-a9|cortex-a53)
      make -C desmume/src/frontend/libretro -f Makefile.libretro platform=armv7-neon-hardfloat-$TARGET_CPU GIT_VERSION=${PKG_VERSION:0:7}
      ;;
    *)
      make -C desmume/src/frontend/libretro -f Makefile.libretro GIT_VERSION=${PKG_VERSION:0:7}
      ;;
  esac
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
