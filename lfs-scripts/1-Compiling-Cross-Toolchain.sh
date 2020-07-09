#!/bin/bash -e

SCRIPTDIR=$(dirname $0)/Compiling-Cross-Toolchain

PKG=(
    'Binutils-2.34-Pass1'
    'GCC-10.1.0-Pass1'
    'Linux-5.7.7-API-Headers'
    'Glibc-2.31'
    'Libstdc++-from-GCC-10.1.0-Pass1'
    'M4-1.4.18'
    'Ncurses-6.2'
    'Bash-5.0'
    'Coreutils-8.32'
    'Diffutils-3.7'
    'File-5.39'
    'Findutils-4.7.0'
    'Gawk-5.1.0'
    'Grep-3.4'
    'Gzip-1.10'
    'Make-4.3'
    'Patch-2.7.6'
    'Sed-4.8'
    'Tar-1.32'
    'Xz-5.2.5'
    'Binutils-2.34-Pass2'
    'GCC-10.1.0-Pass2'
)

for script in "${PKG[@]}"; do
    if [ -f "$SCRIPTDIR/build/$script" ]; then
        echo "--- $script skipped ---"
    else
        echo "*** $script ***"
        SRC=$LFS/home/sources $SCRIPTDIR/$script
        echo; echo "*** $script done ***"; sleep 10; echo
    fi
done


echo
echo "**************************************************"
echo "******  Compiling-Cross-Toolchain complete  ******"
echo "**************************************************"

