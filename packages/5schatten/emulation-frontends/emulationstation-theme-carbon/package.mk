# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="emulationstation-theme-carbon"
PKG_VERSION="488ce79"
PKG_SHA256="84f4fdc3b4c2d77c52d540f8ab01d5a1a51bf132158f7e830ac525051ca3c823"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/RetroPie/es-theme-carbon"
PKG_URL="https://github.com/RetroPie/es-theme-carbon/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Theme 'carbon' v2.4 - 08-16-2016 by Rookervik"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/kodi/addons/resource.uisounds.kodi/resources
  mkdir -p $INSTALL/usr/config/emulationstation/themes/es-theme-carbon
  cp -r * $INSTALL/usr/config/emulationstation/themes/es-theme-carbon

  #adding additional themes
  cp -a $PKG_DIR/files/2048 $INSTALL/usr/config/emulationstation/themes/es-theme-carbon/
  cp -a $PKG_DIR/files/chailove $INSTALL/usr/config/emulationstation/themes/es-theme-carbon/
  cp -a $PKG_DIR/files/mrboom $INSTALL/usr/config/emulationstation/themes/es-theme-carbon/
  cp -a $PKG_DIR/files/moonlight $INSTALL/usr/config/emulationstation/themes/es-theme-carbon/
  cp -a $PKG_DIR/files/prboom $INSTALL/usr/config/emulationstation/themes/es-theme-carbon/
  cp -a $PKG_DIR/files/tyrquake $INSTALL/usr/config/emulationstation/themes/es-theme-carbon/

  #adding additional themes for generic
  if [ "$PROJECT" = "Generic" ]; then
    cp -a $PKG_DIR/files/n3ds $INSTALL/usr/config/emulationstation/themes/es-theme-carbon/
  fi

  #adding click sounds
  cp art/scroll.wav $INSTALL/usr/share/kodi/addons/resource.uisounds.kodi/resources/back.wav
  cp art/scroll.wav $INSTALL/usr/share/kodi/addons/resource.uisounds.kodi/resources/click.wav
  cp art/scroll.wav $INSTALL/usr/share/kodi/addons/resource.uisounds.kodi/resources/cursor.wav
}
