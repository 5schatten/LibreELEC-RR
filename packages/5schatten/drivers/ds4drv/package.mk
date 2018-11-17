# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="ds4drv"
PKG_VERSION="be7327f"
PKG_SHA256="d81566907f2fb071625ecb43fb63b0d1c12bde63187c1f9cb46706899c05adb1"
PKG_LICENSE="OSS"
PKG_SITE="https://github.com/chrippa/ds4drv"
PKG_URL="https://github.com/chrippa/ds4drv/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 distutilscross:host python-evdev pyudev setuptools"
PKG_LONGDESC="ds4drv is a Sony DualShock 4 userspace driver for Linux."
PKG_TOOLCHAIN="manual"

pre_make_target() {
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  export LDFLAGS="$LDFLAGS -L$SYSROOT_PREFIX/usr/lib -L$SYSROOT_PREFIX/lib"
  export LDSHARED="$CC -shared"
}

make_target() {
  python setup.py build --cross-compile
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
}

post_makeinstall_target() {
  find $INSTALL/usr/lib/python*/site-packages/  -name "*.py" -exec rm -rf {} ";"
  sed -i -e "s/^#\!.*/#\!\/usr\/bin\/python/" $INSTALL/usr/bin/ds4drv
  mkdir -p $INSTALL/usr/config
  cp ds4drv.conf $INSTALL/usr/config/
}
