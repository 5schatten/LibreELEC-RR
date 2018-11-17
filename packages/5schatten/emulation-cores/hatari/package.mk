# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="hatari"
PKG_VERSION="31028b8" #v2.1.0
PKG_SHA256="bdf6d6fba33c047edf2f54b8257d4fba25177267770aa44008e84d9bcffa3ba4"
PKG_LICENSE="GPL"
PKG_SITE="https://hatari.tuxfamily.org/"
PKG_URL="https://github.com/hatari/hatari/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain SDL2-git portaudio zlib capsimg"
PKG_LONGDESC="Hatari is an Atari ST/STE/TT/Falcon emulator"

PKG_CMAKE_OPTS_TARGET="-DCMAKE_SKIP_RPATH=ON \
                       -DDATADIR="/usr/config/hatari" \
                       -DBIN2DATADIR="../../storage/.config/hatari" \
                       -DCAPSIMAGE_INCLUDE_DIR=$PKG_BUILD/src/include \
                       -DCAPSIMAGE_LIBRARY=$PKG_BUILD/libcapsimage.so.5.1"

pre_configure_target() {
  # copy IPF Support Library include files
  mkdir -p $PKG_BUILD/src/includes/caps5/
  cp -R $(get_build_dir capsimg)/LibIPF/* $PKG_BUILD/src/includes/caps5/
  cp -R $(get_build_dir capsimg)/Core/CommonTypes.h $PKG_BUILD/src/includes/caps5/
  cp -R $(get_build_dir capsimg)/libcapsimage.so.5.1 $PKG_BUILD/
 
  # libcapsimage 5.1 misses these types that were defined in 4.2
  sed -i "s/CapsLong/Sint32/g" $PKG_BUILD/src/floppy_ipf.c
  sed -i "s/CapsULong/Uint32/g" $PKG_BUILD/src/floppy_ipf.c

  # fix headers includes contain __cdecl
  CFLAGS="$CFLAGS -D__cdecl=''" 

  # add library search path for loading libcapsimage library
  LDFLAGS="$LDFLAGS -Wl,-rpath='$PKG_BUILD'"
}

makeinstall_target() {
  # create directories
  mkdir -p $INSTALL/usr/bin
  mkdir -p $INSTALL/usr/config/hatari

  # copy config files  
  touch $INSTALL/usr/config/hatari/hatari.nvram
  cp -R $PKG_DIR/config/* $INSTALL/usr/config/hatari

  # copy binary & start script
  cp src/hatari $INSTALL/usr/bin
  cp -R $PKG_DIR/scripts/* $INSTALL/usr/bin/
}
