# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="spectre-meltdown-checker"
PKG_VERSION="c705afe" # v0.40
PKG_SHA256="d96cb7926031dc83ca3676c42c920c44f5c9a8a943a023c0ae052f8c5176d40b"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/speed47/spectre-meltdown-checker"
PKG_URL="https://github.com/speed47/spectre-meltdown-checker/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A shell script to tell if your system is vulnerable against the several speculative execution CVEs that were made public in 2018."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
 mkdir -p $INSTALL/usr/bin
 chmod +x $PKG_BUILD/spectre-meltdown-checker.sh
 cp $PKG_BUILD/spectre-meltdown-checker.sh $INSTALL/usr/bin/sm-checker
}
