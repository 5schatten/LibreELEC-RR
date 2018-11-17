# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="retroarch-overlay-borders"
PKG_VERSION="9aceca2"
PKG_SHA256="2bf45cc27c17063ae04764bf5931d53a60892f99f8209669e801753356fb5286"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/overlay-borders"
PKG_URL="https://github.com/libretro/overlay-borders/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A place for collecting decorative/cosmetic overlays for use with RetroArch."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/retroarch/overlay
  mkdir -p $INSTALL/usr/share/retroarch/overlay/borders
  mkdir -p $INSTALL/usr/share/retroarch/overlay/borders/systems

  #Nintendo NES
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/NintendoEntertainmentSystem-nyny77.cfg" $INSTALL/usr/share/retroarch/overlay/borders/systems
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/NintendoEntertainmentSystem-nyny77.png" $INSTALL/usr/share/retroarch/overlay/borders/systems

  #Nintendo SNES
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/NintendoSuperNintendo-nyny77.cfg" $INSTALL/usr/share/retroarch/overlay/borders/systems
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/NintendoSuperNintendo-nyny77.png" $INSTALL/usr/share/retroarch/overlay/borders/systems

  #Nintendo SNES
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/NintendoSNES-nyny77.cfg" $INSTALL/usr/share/retroarch/overlay/borders/systems
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/NintendoSNES-nyny77.png" $INSTALL/usr/share/retroarch/overlay/borders/systems

  #Nintendo N64
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/NintendoN64-nyny77.cfg" $INSTALL/usr/share/retroarch/overlay/borders/systems
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/NintendoN64-nyny77.png" $INSTALL/usr/share/retroarch/overlay/borders/systems

  #Nintendo GameCube
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/NintendoGameCube-nyny77.cfg" $INSTALL/usr/share/retroarch/overlay/borders/systems
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/NintendoGameCube-nyny77.png" $INSTALL/usr/share/retroarch/overlay/borders/systems

  #Nintendo GameBoy Color
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/NintendoGameBoyColorNoir-nyny77.cfg" $INSTALL/usr/share/retroarch/overlay/borders/systems
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/NintendoGameBoyColorNoir-nyny77.png" $INSTALL/usr/share/retroarch/overlay/borders/systems

  #Sega Genesis/Megadrive
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/SegaMegadrive-nyny77.cfg" $INSTALL/usr/share/retroarch/overlay/borders/systems
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/SegaMegadrive-nyny77.png" $INSTALL/usr/share/retroarch/overlay/borders/systems

  #Sega Saturn
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/SegaSaturnEU-nyny77.cfg" $INSTALL/usr/share/retroarch/overlay/borders/systems
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/SegaSaturnEU-nyny77.png" $INSTALL/usr/share/retroarch/overlay/borders/systems

  #Sega Dreamcast
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/SegaDreamcast-nyny77.cfg" $INSTALL/usr/share/retroarch/overlay/borders/systems
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/SegaDreamcast-nyny77.png" $INSTALL/usr/share/retroarch/overlay/borders/systems

  #Sony Playstation
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/SonyPlaystation-nyny77.cfg" $INSTALL/usr/share/retroarch/overlay/borders/systems
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/SonyPlaystation-nyny77.png" $INSTALL/usr/share/retroarch/overlay/borders/systems

  #MAME
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/Mame-nyny77.cfg" $INSTALL/usr/share/retroarch/overlay/borders/systems
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/Mame-nyny77.png" $INSTALL/usr/share/retroarch/overlay/borders/systems

  #Bandai Wonderswan
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/BandaiWonderSwanColor-nyny77.cfg" $INSTALL/usr/share/retroarch/overlay/borders/systems
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/BandaiWonderSwanColor-nyny77.png" $INSTALL/usr/share/retroarch/overlay/borders/systems

  #IBM
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/IBM-nyny77.cfg" $INSTALL/usr/share/retroarch/overlay/borders/systems
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/IBM-nyny77.png" $INSTALL/usr/share/retroarch/overlay/borders/systems

  #Sinclair ZXSpectrum
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/SinclairZXSpectrum-nyny77.cfg" $INSTALL/usr/share/retroarch/overlay/borders/systems
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/SinclairZXSpectrum-nyny77.png" $INSTALL/usr/share/retroarch/overlay/borders/systems

  #Amiga
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/Amiga-nyny77.png" $INSTALL/usr/share/retroarch/overlay/borders/systems
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/Amiga-nyny77.png" $INSTALL/usr/share/retroarch/overlay/borders/systems

  #ScummVM
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/ScummVM-nyny77.cfg" $INSTALL/usr/share/retroarch/overlay/borders/systems
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/ScummVM-nyny77.png" $INSTALL/usr/share/retroarch/overlay/borders/systems

  #Commodore64
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/Commodore64-nyny77.cfg" $INSTALL/usr/share/retroarch/overlay/borders/systems
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/Commodore64-nyny77.png" $INSTALL/usr/share/retroarch/overlay/borders/systems

  #Vierge
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/Vierge-nyny77.cfg" $INSTALL/usr/share/retroarch/overlay/borders/systems
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/Vierge-nyny77.png" $INSTALL/usr/share/retroarch/overlay/borders/systems

  #Vierge Vertical
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/ViergeVertical-nyny77.cfg" $INSTALL/usr/share/retroarch/overlay/borders/systems
  cp "$PKG_BUILD/16x9 Collections/NyNy77 1080 Bezel/ViergeVertical-nyny77.png" $INSTALL/usr/share/retroarch/overlay/borders/systems
}
