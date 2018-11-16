# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="dosbox-sdl2"
PKG_VERSION="8f8d0c579ca889a64dac32128d3b18129631b0bd"
PKG_SHA256="8afd7946cedda8a2ca719fd5e70897b44153bb03a721d394bbfdca28a63d582d"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/duganchen/dosbox"
PKG_URL="https://github.com/duganchen/dosbox/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain alsa-lib SDL2-git SDL2_net SDL_sound libpng munt"
PKG_LONGDESC="This is an enhanced SDL2 fork of DOSBox emulator by duganchen. It is currently in sync with revision 4006."
PKG_TOOLCHAIN="autotools"

if [ "$OPENGL_SUPPORT" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET dosbox-sdl2-shaders glew"
fi

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr \
                           --enable-core-inline \
                           --enable-dynrec \
                           --enable-unaligned_memory \
                           --with-sdl-prefix=$SYSROOT_PREFIX/usr"

pre_configure_target () {
  cd ..
  rm -rf .$TARGET_NAME
}

pre_make_target() {
  # Enable DynaRec for ARMv7 cpus
  if [ "$TARGET_CPU" = "cortex-a7" ] || [ "$TARGET_CPU" = "cortex-a53" ] && [ ! $TARGET_CPU = "arm1176jzf-s" ]; then
    sed -i 's|/\* #undef C_DYNREC \*/|#define C_DYNREC 1|' config.h
    sed -i s/C_TARGETCPU.*/C_TARGETCPU\ ARMV7LE/g config.h
    sed -i 's|/\* #undef C_UNALIGNED_MEMORY \*/|#define C_UNALIGNED_MEMORY 1|' config.h
  fi
  # Change version SVN to SDL2
  sed -i s/SVN/SDL2/g config.h
}

post_makeinstall_target() {
  # Create config directory & install config
  mkdir -p $INSTALL/usr/config/dosbox
  cp $PKG_DIR/scripts/* $INSTALL/usr/bin/
  cp $PKG_DIR/config/* $INSTALL/usr/config/dosbox/

  # Enable OpenGL output if supported
  if [ "$OPENGL_SUPPORT" = "yes" ]; then
    sed -i s/output=texture/output=opengl/g $INSTALL/usr/config/dosbox/dosbox-SDL2.conf
  fi
}
