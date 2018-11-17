# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="enet"
PKG_VERSION="39a72ab"
PKG_SHA256="cdeec4d447266d93dbd56564b260c57e411dc681caba6887a7e3f152009e6be1"
PKG_ARCH="any"
PKG_LICENSE=""
PKG_SITE="https://github.com/lsalzman/enet"
PKG_URL="https://github.com/lsalzman/enet/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="network"
PKG_SHORTDESC="ENet's purpose is to provide a relatively thin, simple and robust network communication layer on top of UDP (User Datagram Protocol)"
PKG_LONGDESC="ENet's purpose is to provide a relatively thin, simple and robust network communication layer on top of UDP (User Datagram Protocol)"
PKG_TOOLCHAIN="autotools"
PKG_BUILD_FLAGS="+pic"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared"

post_makeinstall_target() {
  rm -r $INSTALL
}
