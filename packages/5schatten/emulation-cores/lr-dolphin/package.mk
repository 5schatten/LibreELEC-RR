# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-dolphin"
PKG_VERSION="a5bce7d"
PKG_SHA256="c21a31381759220095146c4e510161b6d290c8af9c7447540e5993df89fc5f8e"
PKG_ARCH="x86_64"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/dolphin"
PKG_URL="https://github.com/libretro/dolphin/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch enet bluez lzo alsa-lib ffmpeg curl libpng zlib"
PKG_LONGDESC="Dolphin is a GameCube / Wii emulator, allowing you to play games for these two platforms on PC with improvements. "
PKG_TOOLCHAIN="cmake-make"

PKG_LIBNAME="dolphin_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

PKG_CMAKE_OPTS_TARGET="-DENABLE_QT=OFF \
                       -DENABLE_LTO=OFF \
                       -DLIBRETRO=ON \
                       -DENABLE_ANALYTICS=OFF"

pre_make_target() {
  find . -name flags.make -exec sed -i "s:isystem :I:g" \{} \;
}

makeinstall_target() {
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
