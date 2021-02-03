#!/bin/bash -e

SCRIPTDIR=$(dirname $0)/stage3

PKG=(
    'man-pages'
    'iana-etc'
    'glibc'
    'zlib'
    'bzip2'
    'xz'
    'zstd'
    'file'
    'readline'
    'm4'
    'bc'
    'flex'
    'tcl'
    'expect'
    'dejagnu'
    'binutils'
    'gmp'
    'mpfr'
    'mpc'
    'attr'
    'acl'
    'libcap'
    'shadow'
    'gcc'
    'pkg-config'
    'ncurses'
    'sed'
    'psmisc'
    'gettext'
    'bison'
    'grep'
    'bash'
    'libtool'
    'gdbm'
    'gperf'
    'expat'
    'inetutils'
    'perl'
    'perl-xml-parser'
    'intltool'
    'autoconf'
    'automake'
    'kmod'
    'elfutils'
    'libffi'
    'openssl'
    'python3'
    'ninja'
    'meson'
    'coreutils'
    'check'
    'diffutils'
    'gawk'
    'findutils'
    'groff'
    'grub'
    'less'
    'gzip'
    'iproute2'
    'kbd'
    'libpipeline'
    'make'
    'patch'
    'man-db'
    'tar'
    'texinfo'
    'vim'
    'systemd'
    'dbus'
    'procps-ng'
    'util-linux'
    'e2fsprogs'
    'strippingagain'
)

for script in "${PKG[@]}"; do
    if [ -f "$HOME/logs/stage3/$script.log" ]; then
        echo "--- $script skipped ---"
    else
        echo "*** $script ***"
        SRC=/sources $SCRIPTDIR/$script
        echo; echo "*** $script done ***"; sleep 10; echo
    fi
done


echo
echo "**************************************************************"
echo "***           Building-the-LFS-System complete             ***"
echo "**************************************************************"
echo "***      Please run the following command to continue      ***"
echo "**************************************************************"
echo "***           Set Root Password <passwd root>              ***"
echo "**************************************************************"
