# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="emulationstation-theme-simple-dark"
PKG_VERSION="4c33193"
PKG_SHA256="8be86416f720bdce4449f67d83e4483f440c9c712f5901bb14256c3bce1d4c0b"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/RetroPie/es-theme-simple-dark.git"
PKG_URL="https://github.com/RetroPie/es-theme-simple-dark/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Simple dark theme for Emulationstation"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/kodi/addons/resource.uisounds.kodi/resources
  mkdir -p $INSTALL/usr/config/emulationstation/themes/es-theme-simple-dark
  cp -r * $INSTALL/usr/config/emulationstation/themes/es-theme-simple-dark

  #adding additional themes
  cp -a $PKG_DIR/files/2048 $INSTALL/usr/config/emulationstation/themes/es-theme-simple-dark/
  cp -a $PKG_DIR/files/chailove $INSTALL/usr/config/emulationstation/themes/es-theme-simple-dark/
  cp -a $PKG_DIR/files/mrboom $INSTALL/usr/config/emulationstation/themes/es-theme-simple-dark/
  cp -a $PKG_DIR/files/moonlight $INSTALL/usr/config/emulationstation/themes/es-theme-simple-dark/
  cp -a $PKG_DIR/files/prboom $INSTALL/usr/config/emulationstation/themes/es-theme-simple-dark/
  cp -a $PKG_DIR/files/tyrquake $INSTALL/usr/config/emulationstation/themes/es-theme-simple-dark/

  #adding additional themes for generic
  if [ "$PROJECT" == "Generic" ]; then
    cp -a $PKG_DIR/files/n3ds $INSTALL/usr/config/emulationstation/themes/es-theme-simple-dark/
  fi

  #adding click sounds
  cp $PKG_DIR/files/scroll.wav $INSTALL/usr/config/emulationstation/themes/es-theme-simple-dark/art/
  cp $PKG_DIR/files/scroll.wav $INSTALL/usr/share/kodi/addons/resource.uisounds.kodi/resources/back.wav
  cp $PKG_DIR/files/scroll.wav $INSTALL/usr/share/kodi/addons/resource.uisounds.kodi/resources/click.wav
  cp $PKG_DIR/files/scroll.wav $INSTALL/usr/share/kodi/addons/resource.uisounds.kodi/resources/cursor.wav
}
