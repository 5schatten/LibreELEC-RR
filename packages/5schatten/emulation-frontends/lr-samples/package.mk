# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-samples"
PKG_VERSION="8452cd9"
PKG_SHA256="c0ebe09b71589fdfc39943a6e065d0acd076f9ffab6ea3839adca6d4f3b5e423"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/libretro/libretro-samples"
PKG_URL="https://github.com/libretro/libretro-samples/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A set of samples to illustrate libretro API."
PKG_TOOLCHAIN="manual"

make_target() {
 make -C input/button_test
 make -C midi/midi_test
 make -C tests/test

 if [ "$ARCH" == "x86_64" ]; then
   make -C tests/test_advanced
   make -C video/opengl/libretro_test_gl_fixedfunction
   make -C video/opengl/libretro_test_gl_shaders
   make -C video/vulkan/vk_rendering
   make -C video/vulkan/vk_async_compute
 fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro

  cp input/button_test/*.so $INSTALL/usr/lib/libretro/
  cp midi/midi_test/*.so $INSTALL/usr/lib/libretro/
  cp tests/test/*.so $INSTALL/usr/lib/libretro/

  if [ "$ARCH" == "x86_64" ]; then
    cp tests/test_advanced/*.so $INSTALL/usr/lib/libretro/
    cp video/opengl/libretro_test_gl_fixedfunction/*.so $INSTALL/usr/lib/libretro/
    cp video/opengl/libretro_test_gl_shaders/*.so $INSTALL/usr/lib/libretro/
    cp video/vulkan/vk_rendering/*.so $INSTALL/usr/lib/libretro/
    cp video/vulkan/vk_async_compute/*.so $INSTALL/usr/lib/libretro/
  fi
}
