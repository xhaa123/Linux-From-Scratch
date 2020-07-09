#!/bin/bash -e

SCRIPTDIR=$(dirname $0)/b-Building-the-LFS-System

PKG=(
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
        SRC=/home/sources $SCRIPTDIR/$script
        echo; echo "*** $script done ***"; sleep 10; echo
    fi
done


echo
echo "**************************************************************"
echo "***           Building-the-LFS-System complete             ***"
echo "**************************************************************"
