#!/bin/bash -e

cat > ~/.bashrc << "EOF"
export MAKEFLAGS="-j$(nproc)"
alias ls='ls --color=auto'
alias ll='ls -F -b -T 0 --group-directories-first --color=auto --format=long --time-style="+%y-%m-%d %H:%M:%S" --human-readable'
EOF

. ~/.bashrc

SCRIPTDIR=$(dirname $0)/stage2

PKG=(
    'libstdc++-gcc-pass2'
    'gettext'
    'bison'
    'perl'
    'python'
    'texinfo'
    'util-linux'
)

for script in "${PKG[@]}"; do
    if [ -f "$HOME/logs/stage2/$script.log" ]; then
        echo "--- $script skipped ---"
    else
        echo "*** $script ***"
        SRC=/sources $SCRIPTDIR/$script
        echo; echo "*** $script done ***"; sleep 10; echo
    fi
done

find /usr/{lib,libexec} -name \*.la -delete

rm -rf /usr/share/{info,man,doc}/*

echo
echo "**************************************************************"
echo "*** Entering Chroot and Building Additional Tools complete ***"
echo "**************************************************************"
 
