#!/bin/bash -e

SCRIPTDIR=$(dirname $0)/a-Building-the-LFS-System

PKG=(
    'Man-pages-5.07'
    'Iana-Etc-20200429'
    'Glibc-2.31'
    'Zlib-1.2.11'
    'Bzip2-1.0.8'
    'Xz-5.2.5'
    'Zstd-1.4.5'
    'File-5.39'
    'Readline-8.0'
    'M4-1.4.18'
    'Bc-2.7.2'
    'Flex-2.6.4'
    'Binutils-2.34'
    'GMP-6.2.0'
    'MPFR-4.0.2'
    'MPC-1.1.0'
    'Attr-2.4.48'
    'Acl-2.2.53'
    'Libcap-2.36'
    'Shadow-4.8.1'
    'GCC-10.1.0'
    'Pkg-config-0.29.2'
    'Ncurses-6.2'
    'Sed-4.8'
    'Psmisc-23.3'
    'Gettext-0.20.2'
    'Bison-3.6.4'
    'Grep-3.4'
    'Bash-5.0'

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
echo "***      Please run the following command to continue      ***"
echo "**************************************************************"
echo "***               exec /bin/bash --login +h                ***"
echo "**************************************************************"
