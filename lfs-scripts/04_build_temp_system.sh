#!/bin/bash -e

SCRIPTDIR=$(dirname $0)/compiling_cross_toolchain

PKG=(
    'binutils-pass1'
    'gcc-pass1'
    'linux-headers'
    'glibc'
    'libstdc++-gcc-pass1'
    'm4'
    'ncurses'
    'bash'
    'coreutils'
    'diffutils'
    'file'
    'findutils'
    'gawk'
    'grep'
    'gzip'
    'make'
    'patch'
    'sed'
    'tar'
    'xz'
    'binutils-pass2'
    'gcc-pass2'
)

for script in "${PKG[@]}"; do
    if [ -f "$SCRIPTDIR/log/$script.log" ]; then
        echo "--- $script skipped ---"
    else
        echo "*** $script ***"
        SRC=$LFS/sources $SCRIPTDIR/$script
        echo; echo "*** $script done ***"; sleep 10; echo
    fi
done


echo
echo "**************************************************"
echo "******  Compiling-Cross-Toolchain complete  ******"
echo "**************************************************"

