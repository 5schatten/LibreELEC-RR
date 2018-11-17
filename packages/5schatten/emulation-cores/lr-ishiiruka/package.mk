# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-ishiiruka"
PKG_VERSION="ede0713"
PKG_SHA256="0c15e1faf0bd34425c4ff34ef8a279633c6bd404bb54740985c39391505d2e4f"
PKG_ARCH="x86_64"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/Ishiiruka"
PKG_URL="https://github.com/libretro/Ishiiruka/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch enet bluez lzo alsa-lib ffmpeg curl libpng zlib"
PKG_LONGDESC="Dolphin is a GameCube / Wii emulator, allowing you to play games for these two platforms on PC"
PKG_TOOLCHAIN="cmake-make"

PKG_LIBNAME="ishiiruka_libretro.so"
PKG_LIBPATH="Binaries/$PKG_LIBNAME"

PKG_CMAKE_OPTS_TARGET="-DENABLE_QT2=OFF \
                       -DENABLE_WX=OFF \
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
