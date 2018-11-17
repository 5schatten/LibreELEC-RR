# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="munt"
PKG_VERSION="939cc98"
PKG_SHA256="0d73b8dd2c9543b9fddb17ce9c6ca6729b4ef124009704a9891ef030fbfd9c35"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/munt/munt"
PKG_URL="https://github.com/munt/munt/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A multi-platform software synthesiser emulating (currently inaccurately) pre-GM MIDI devices such as the Roland MT-32, CM-32L, CM-64 and LAPC-I. In no way endorsed by or affiliated with Roland Corp."

PKG_CMAKE_OPTS_TARGET="-Dmunt_WITH_MT32EMU_QT=0 \
                       -Dmunt_WITH_MT32EMU_SMF2WAV=0 \
                       -Dlibmt32emu_SHARED=1"
