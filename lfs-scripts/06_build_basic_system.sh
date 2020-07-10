#!/bin/bash -e

SCRIPTDIR=$(dirname $0)/build_basic_system

PKG=(
    'Man-pages-5.07'
    'Tcl-8.6.10'
    'Expect-5.45.4'
    'DejaGNU-1.6.2'
    'Iana-Etc-20200429'
    'Glibc-2.31'
    'Zlib-1.2.11'
    'Bzip2-1.0.8'
    'Xz-5.2.5'
    'Zstd-1.4.5'
    'File-5.39'
    'Readline-8.0'
    'M4-1.4.18'
    'Bc-3.0.3'
    'Flex-2.6.4'
    'Binutils-2.34'
    'GMP-6.2.0'
    'MPFR-4.0.2'
    'MPC-1.1.0'
    'Attr-2.4.48'
    'Acl-2.2.53'
    'Libcap-2.38'
    'Shadow-4.8.1'
    'GCC-10.1.0'
    'Pkg-config-0.29.2'
    'Ncurses-6.2'
    'Sed-4.8'
    'Psmisc-23.3'
    'Gettext-0.20.2'
    'Bison-3.6.4'
    'Grep-3.4'
    'Libtool-2.4.6'
    'GDBM-1.18.1'
    'Gperf-3.1'
    'Expat-2.2.9'
    'Inetutils-1.9.4'
    'Perl-5.32.0'
    'XML-Parser-2.46'
    'Intltool-0.51.0'
    'Autoconf-2.69'
    'Automake-1.16.2'
    'Kmod-27'
    'Libelf-from-Elfutils-0.180'
    'Libffi-3.3'
    'OpenSSL-1.1.1g'
    'Python-3.8.3'
    'Ninja-1.10.0'
    'Meson-0.54.3'
    'Coreutils-8.32'
    'Check-0.15.0'
    'Diffutils-3.7'
    'Gawk-5.1.0'
    'Findutils-4.7.0'
    'Groff-1.22.4'
    'GRUB-2.04'
    'Less-551'
    'Gzip-1.10'
    'IPRoute2-5.7.0'
    'Kbd-2.2.0'
    'Libpipeline-1.5.2'
    'Make-4.3'
    'Patch-2.7.6'
    'Man-DB-2.9.3'
    'Tar-1.32'
    'Texinfo-6.7'
    'Vim-8.2.0814'
    'Systemd-245'
    'D-Bus-1.12.20'
    'Procps-ng-3.3.16'
    'Util-linux-2.35.2'
    'E2fsprogs-1.45.6'
)

for script in "${PKG[@]}"; do
    if [ -f "$SCRIPTDIR/build/$script" ]; then
        echo "--- $script skipped ---"
    else
        echo "*** $script ***"
        SRC=/home/sources/lfs $SCRIPTDIR/$script
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
