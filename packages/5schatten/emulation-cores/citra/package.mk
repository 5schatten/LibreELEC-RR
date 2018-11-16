# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="citra"
PKG_VERSION="b1f55c9cabcb66305969e9007c68e79a1119b76b"
PKG_ARCH="x86_64"
PKG_LICENSE="GPLv2+"
PKG_SITE="https://github.com/citra-emu/citra"
PKG_URL="https://github.com/citra-emu/citra.git"
PKG_DEPENDS_TARGET="toolchain boost qt-everywhere SDL2-git"
PKG_LONGDESC="A Nintendo 3DS Emulator"
GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="cmake-make"

PKG_CMAKE_OPTS_TARGET="-DENABLE_SDL2=1 \
                       -DENABLE_QT=1 \
                       -DENABLE_CUBEB=0 \
                       -DCMAKE_BUILD_TYPE=\"Release\" \
                       -DENABLE_WEB_SERVICE=0 \
                       -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 \
                       -DCMAKE_VERBOSE_MAKEFILE=1"

pre_make_target() {
  find . -name flags.make -exec sed -i "s:isystem :I:g" \{} \;
}

post_makeinstall_target() {
  # copy scripts & config files
  mkdir -p $INSTALL/usr/config/citra-emu

  cp $PKG_DIR/scripts/* $INSTALL/usr/bin/
  cp -PR $PKG_DIR/config/* $INSTALL/usr/config/citra-emu/
  cp -PR $PKG_DIR/files/* $INSTALL/usr/config/citra-emu/
  
  # clean up
  rm -rf $INSTALL/usr/share/
  rm -rf $INSTALL/usr/bin/citra
}
