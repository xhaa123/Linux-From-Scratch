cat > ~/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF

cat > ~/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/usr/bin
if [ ! -L /bin ]; then PATH=/bin:$PATH; fi
PATH=$LFS/tools/bin:$PATH
CONFIG_SITE=$LFS/usr/share/config.site
export LFS LC_ALL LFS_TGT PATH CONFIG_SITE

export CFLAGS="-march=haswell -O2 -pipe"
export CXXFLAGS="${CFLAGS}"
export MAKEFLAGS="-j$(nproc)"

alias ls='ls --color=auto'
alias ll='ls -F -b -T 0 --group-directories-first --color=auto --format=long --time-style="+%F %T" --human-readable'

EOF

cat > ~/.vimrc << "EOF"
let skip_defaults_vim=1
set nocompatible
syntax on
set background=dark
set number
set backspace=indent,eol,start
set nobackup
set noswapfile
set noundofile
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
EOF

source ~/.bash_profile
