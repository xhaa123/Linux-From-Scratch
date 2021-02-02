#!/bin/bash 
set -e

PKG=(
    terminus-font
    linux-firmware
    cracklib
    libpwquality
    linux-pam
    shadow
    sudo
    openssh
    icu
    libxml2
    sgml-common
    unzip
    docbook-xml
    docbook-xsl
    itstool
    libxslt
    sqlite
    python
    python3-pygments
    gtk-doc
    libtasn1
    nspr
    nss
    p11-kit
    make-ca
    wget
    curl
    xmlto
    asciidoc
    git
    lzo
    libaio
    which
    boost
    thin-provisioning-tools
    lvm2
    btrfs-progs
    dosfstools
    pcre
    libuv
    libarchive
    nghttp2
    cmake
    gobject-introspection
    glib
    autoconf213
    libssh2
    python3-packaging
    python3-requests
    python3-imagesize
    python3-alabaster
    python3-babel
    python3-snowballstemmer
    python3-docutils
    python3-sphinxcontrib-qthelp
    python3-sphinxcontrib-serializinghtml
    python3-sphinx
    python3-recommonmark
    llvm
    rustc
    js78
    polkit
    json-c
    popt
    cryptsetup
    nettle
    libunistring
    gnutls
    iptables
    libgpg-error
    libgcrypt
    libidn2
    libseccomp
    gnu-efi
    lz4
    systemd
    efivar
    efibootmgr
    libspiro
    libuninameslist
    fontforge
    dejavu-fonts-ttf
    unifont
    grub-efi
    cpio
    dracut
)

SCRIPTDIR=$(dirname $0)/Applications

for script in ${PKG[@]}; do
        if [ -f "$HOME/logs/Applications/$script.log" ]; then
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

