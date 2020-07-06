#!/bin/bash -e

SCRIPTDIR=$(dirname $0)/Entering-Chroot-and-Building-Additional-Tools

PKG=(
    'Libstdc++-from-GCC-10.1.0-Pass2'
    'Bison-3.6.4'
    'Gettext-0.20.2'
    'Perl-5.30.3'
    'Python-3.8.3'
    'Texinfo-6.7'
    'Util-linux-2.35.2'
    'Tcl-8.6.10'
    'Expect-5.45.4'
    'DejaGNU-1.6.2'
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
echo "*** Entering Chroot and Building Additional Tools complete ***"
echo "**************************************************************"
 
