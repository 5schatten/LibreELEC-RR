# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="vlc"
PKG_VERSION="3.0.4"
PKG_SHA256="01f3db3790714038c01f5e23c709e31ecd6f1c046ac93d19e1dde38b3fc05a9e"
PKG_LICENSE="GPL"
PKG_SITE="http://www.videolan.org"
PKG_URL="http://get.videolan.org/vlc/$PKG_VERSION/vlc-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain dbus gnutls ffmpeg libmpeg2 zlib flac libvorbis libxml2"
PKG_LONGDESC="VideoLAN multimedia player and streamer"

if [ "$TARGET_ARCH" = "arm" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET lua" 
fi 

PKG_CONFIGURE_OPTS_TARGET="--enable-silent-rules \
                           --disable-dependency-tracking \
                           --disable-nls \
                           --disable-rpath \
                           --disable-sout \
                           --disable-lua \
                           --disable-vlm \
                           --disable-taglib \
                           --disable-live555 \
                           --disable-dc1394 \
                           --disable-dvdread \
                           --disable-dvdnav \
                           --disable-opencv \
                           --disable-decklink \
                           --disable-sftp \
                           --disable-v4l2 \
                           --disable-vcd \
                           --disable-libcddb \
                           --disable-dvbpsi \
                           --disable-screen \
                           --enable-ogg \
                           --disable-shout\
                           --disable-mod \
                           --enable-mpc \
                           --disable-gme \
                           --disable-wma-fixed \
                           --disable-shine \
                           --disable-omxil \
                           --disable-mad \
                           --disable-merge-ffmpeg \
                           --enable-avcodec \
                           --enable-avformat \
                           --enable-swscale \
                           --enable-postproc \
                           --disable-faad \
                           --enable-flac \
                           --enable-aa \
                           --disable-twolame \
                           --disable-realrtsp \
                           --disable-libtar \
                           --disable-a52 \
                           --disable-dca \
                           --enable-libmpeg2 \
                           --enable-vorbis \
                           --disable-tremor \
                           --disable-speex \
                           --disable-theora \
                           --disable-schroedinger \
                           --disable-png \
                           --disable-x264 \
                           --disable-fluidsynth \
                           --disable-zvbi \
                           --disable-telx \
                           --disable-libass \
                           --disable-kate \
                           --disable-tiger \
                           --disable-libva \
                           --disable-vdpau \
                           --without-x \
                           --disable-xcb \
                           --disable-xvideo \
                           --disable-sdl-image \
                           --disable-freetype \
                           --disable-fribidi \
                           --disable-fontconfig \
                           --enable-libxml2 \
                           --disable-svg \
                           --disable-directx \
                           --disable-caca \
                           --disable-oss \
                           --disable-pulse \
                           --enable-alsa \
                           --disable-jack \
                           --disable-upnp \
                           --disable-skins2 \
                           --disable-kai \
                           --disable-qt \
                           --disable-macosx \
                           --disable-macosx-qtkit \
                           --disable-ncurses \
                           --disable-goom \
                           --disable-projectm \
                           --enable-udev \
                           --disable-mtp \
                           --disable-lirc \
                           --disable-libgcrypt \
                           --enable-gnutls \
                           --disable-update-check \
                           --disable-kva \
                           --disable-bluray \
                           --disable-samplerate \
                           --disable-sid \
                           --disable-crystalhd \
                           --disable-dxva2 \
                           --disable-vlc \
                           LUAC=$ROOT/$TOOLCHAIN/bin/luac"

pre_configure_target() {
  export LDFLAGS="$LDFLAGS -lresolv"

  if [ "$TARGET_ARCH" = "arm" ]; then
    export LUA_LIBS="-L$SYSROOT_PREFIX/usr/lib -llua -lm"
  fi
}

post_makeinstall_target() {
  rm -fr $INSTALL/usr/share/applications
  rm -fr $INSTALL/usr/share/icons
  rm -fr $INSTALL/usr/share/kde4
  rm -f $INSTALL/usr/bin/rvlc
  rm -f $INSTALL/usr/bin/vlc-wrapper

  mkdir -p $INSTALL/usr/config
    mv -f $INSTALL/usr/lib/vlc $INSTALL/usr/config
    ln -sf /storage/.config/vlc $INSTALL/usr/lib/vlc
}
