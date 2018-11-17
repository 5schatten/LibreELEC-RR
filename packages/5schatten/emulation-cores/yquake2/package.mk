# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="yquake2"
PKG_VERSION="a6b85ea" # v.7.3
PKG_SHA256="40ba2a465fb196b866082c89c853b5ef7c946fe30e77c118eb6cc5c81e2c6405"
PKG_ARCH="x86_64"
PKG_LICENSE="GPLv2"
PKG_SITE="https://www.yamagi.org/quake2/"
PKG_URL="https://github.com/yquake2/yquake2/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain openal-soft SDL2-git"
PKG_LONGDESC="This is the Yamagi Quake II Client, an enhanced version of id Software's Quake II with focus on offline and coop gameplay."

PKG_CMAKE_OPTS_TARGET="-DSYSTEMWIDE_SUPPORT=yes"

makeinstall_target() {
 mkdir -p $INSTALL/usr/bin
 mkdir -p $INSTALL/usr/share/games/quake2
 mkdir -p $INSTALL/usr/config/games/yquake2/baseq2

 cp $PKG_DIR/scripts/* $INSTALL/usr/bin/
 cp -r release/* $INSTALL/usr/share/games/quake2/
 cp $PKG_BUILD/stuff/yq2.cfg $INSTALL/usr/config/games/yquake2/baseq2/yq2.cfg

 ln -sf /usr/share/games/quake2/quake2 $INSTALL/usr/bin/quake2
 ln -sf /usr/config/games/yquake2/baseq2/yq2.cfg $INSTALL/usr/share/games/quake2/baseq2/yq2.cfg

 ln -sf /storage/roms/games/yquake2/baseq2/pak0.pak $INSTALL/usr/share/games/quake2/baseq2/pak0.pak
 ln -sf /storage/roms/games/yquake2/baseq2/pak1.pak $INSTALL/usr/share/games/quake2/baseq2/pak1.pak
 ln -sf /storage/roms/games/yquake2/baseq2/pak2.pak $INSTALL/usr/share/games/quake2/baseq2/pak2.pak
 ln -sf /storage/roms/games/yquake2/baseq2/pak2.pak $INSTALL/usr/share/games/quake2/baseq2/pak2.pak

 ln -s /storage/roms/games/yquake2/baseq2/video $INSTALL/usr/share/games/quake2/baseq2/video
 ln -s /storage/roms/games/yquake2/baseq2/music $INSTALL/usr/share/games/quake2/baseq2/music
 ln -s /storage/roms/games/yquake2/ctf $INSTALL/usr/share/games/quake2/ctf
 ln -s /storage/roms/games/yquake2/rogue $INSTALL/usr/share/games/quake2/rogue
 ln -s /storage/roms/games/yquake2/xatrix $INSTALL/usr/share/games/quake2/xatrix
}

