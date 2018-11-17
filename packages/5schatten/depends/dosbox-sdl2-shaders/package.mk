# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="dosbox-sdl2-shaders"
PKG_VERSION="af99e21"
PKG_SHA256="8a32f157e531971ba987866f10c1a3deb674a30efa0c11e87c94c3880d6530ea"
PKG_LICENSE="OSS"
PKG_SITE="https://github.com/duganchen/dosbox_shaders"
PKG_URL="https://github.com/duganchen/dosbox_shaders/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A collection of shaders for Dugan's DosBox Fork. Each shader is licensed under the same terms as the one it was ported from."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/usr/config/dosbox/shaders
  cp *.vert $INSTALL/usr/config/dosbox/shaders/
  cp *.frag $INSTALL/usr/config/dosbox/shaders/
}
