#!/bin/bash -e

SCRIPTDIR=$(dirname $0)/entering_chroot_building_additional_temporary_tools

PKG=(
    'libstdc++-gcc-pass2'
    'gettext'
    'bison'
    'perl'
    'python3'
    'texinfo'
    'util-linux'
)

for script in "${PKG[@]}"; do
    if [ -f "$SCRIPTDIR/log/$script.log" ]; then
        echo "--- $script skipped ---"
    else
        echo "*** $script ***"
        SRC=/sources $SCRIPTDIR/$script
        echo; echo "*** $script done ***"; sleep 10; echo
    fi
done


echo
echo "**************************************************************"
echo "*** Entering Chroot and Building Additional Tools complete ***"
echo "**************************************************************"
 
