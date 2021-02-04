#!/bin/bash 
set -e

PKG=(
    shell-startup
    terminus-font
    linux-firmware
    icu
    libxml2
    sgml-common
    unzip
    docbook-xml
    docbook-xsl
    itstool
    libxslt
    python3-pygments
    gtk-doc
    libtasn1
    nspr
    sqlite
    nss
    p11-kit
    make-ca
    wget
    lynx
    db
    cracklib
    linux-pam
    shadow
    libpwquality
    libuv
    curl
    lzo
    nettle
    libarchive
    nghttp2
    cmake
    json-c
    libaio
    lvm2
    popt
    cryptsetup
    pcre
    glib
    autoconf2
    libgpg-error
    libgcrypt
    libksba
    npth
    libassuan
    pinentry
    gnupg
    openssh
    libssh2
    python3-sphinxcontrib-applehelp
    python3-sphinxcontrib-devhelp
    python3-sphinxcontrib-jsmath
    python3-sphinxcontrib-htmlhelp
    python3-sphinxcontrib-serializinghtml
    python3-sphinxcontrib-qthelp
    python3-Jinja2
    python3-pygments
    python3-docutils
    python3-snowballstemmer
    python3-babe
    python3-alabaste
    python3-imagesize
    python3-requests
    python3-commonmark
    python3-docutils
    python3-sphinx
    python3-recommonmark
    llvm
    rustc
    which
    js78
    polkit
    asciidoc
    xmlto
    btrfs-progs
    git
    libunistring
    libidn2
    libseccomp
    gnu-efi
    lz4
    python3-lxml
    systemd
    dosfstools
    sudo
    pciutils
    freetype
    libpng
    efivar
    efibootmgr
    fuse2
    grub-efi
    cpio
    dracut
    linux
)

SCRIPTDIR=$(dirname $0)/stage4

for script in ${PKG[@]}; do
    if [ -f "$HOME/logs/stage4/$script.log" ]; then
		echo "--- $script skipped ---"
	else
		echo "*** $script ***"
		ldconfig && SRC=/home/sources $SCRIPTDIR/$script
		echo; echo "*** $script done ***"; sleep 10; echo
	fi
done

echo
echo "*****************************************************"
echo "*********    Applications build complete    *********"
echo "*****************************************************"

