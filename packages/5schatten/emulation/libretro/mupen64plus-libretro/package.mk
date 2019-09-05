# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="mupen64plus-libretro"
PKG_VERSION="e64ef9d9f214e32341fb7cd9633260fbb44b2326"
PKG_SHA256="947abfb1d5ff34d6b22fecfb2df02bd3759fde3f4a0e5d238f65ec7e97d964d4"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/mupen64plus-libretro"
PKG_URL="https://github.com/libretro/mupen64plus-libretro/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc zlib"
PKG_LONGDESC="Mupen64Plus is mupen64plus + GLideN64 + libretro"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="mupen64plus_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

configure_package() {
  # Apply project specific patches
  if [ "${OPENGLES}" = "libmali" ]; then
    PKG_PATCH_DIRS="${OPENGLES}"
  fi

  # Apply RPi4 specific patches
  if [ "${DEVICE}" = "RPi4" ]; then
    PKG_PATCH_DIRS="${DEVICE}"
  fi

  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xorg-server"
  fi

  # OpenGL Support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGL}"
  fi

  # OpenGLES Support
  if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGLES}"
  fi
}

pre_configure_target() {
  # Set project specific platform flags
  if [ "${PROJECT}" = "RPi" ]; then
    case ${DEVICE} in
      RPi)
        PKG_MAKE_OPTS_TARGET+=" platform=rpi"
        ;;
      RPi2)
        PKG_MAKE_OPTS_TARGET+=" platform=rpi2"
        ;;
      RPi3)
        PKG_MAKE_OPTS_TARGET+=" platform=rpi3"
        ;;
      RPi4)
        PKG_MAKE_OPTS_TARGET+=" FORCE_GLES=1 WITH_DYNAREC=arm HAVE_NEON=1"
        ;;
    esac
  else
    # OpenGLES 2.0/3.0 Support
    if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
      if [ "${OPENGLES}" = "libmali" ]; then
        if listcontains "${MALI_FAMILY}" "4[0-9]+"; then
          PKG_MAKE_OPTS_TARGET+=" FORCE_GLES=1"
        else
          PKG_MAKE_OPTS_TARGET+=" FORCE_GLES3=1"
        fi
      else
        PKG_MAKE_OPTS_TARGET+=" FORCE_GLES=1"
      fi
    fi
    # Dynarec
    if [ "${ARCH}" = "arm" ]; then
      PKG_MAKE_OPTS_TARGET+=" WITH_DYNAREC=arm"
    elif [ "${ARCH}" = "x86_64" ]; then
      PKG_MAKE_OPTS_TARGET+=" WITH_DYNAREC=x86_64"
    fi
    # NEON Support
    if target_has_feature neon; then
      PKG_MAKE_OPTS_TARGET+=" HAVE_NEON=1"
    fi
  fi
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
