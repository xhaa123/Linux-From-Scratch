#!/bin/bash 
set -e

PKG=(
linux-firmware
dosfstools
popt
libtasn1
icu
libxml2
sgml-common
unzip
docbook-xml
docbook-xsl-nons
itstool
libxslt
Pygments
which
gtk-doc
nspr
sqlite
make-ca-pass1
p11-kit-pass1
nss
p11-kit-pass2
make-ca-pass2
curl
wget
lynx
rsync
pciutils
libpng
pcre
glib
libuv
lzo
libarchive
cmake
fonttools-python3
graphite2
harfbuzz
freetype
fontconfig
gnu-efi
lz4
efivar
efibootmgr
unifont
libaio
boost
thin-provisioning-tools
LVM2
libevent
asciidoc
links
xmlto
btrfs-progs
Linux-PAM
cracklib
libpwquality
shadow
pcre
glib
autoconf
six
#js
js-copy
polkit
json-c
libgpg-error
libgcrypt
cryptsetup
libunistring
git
libidn2
lxml-python3
systemd
dbus-glib
dbus
dbus-python3
pixman
cairo
gobject-introspection
pycairo-python3
pygobject-python3
ntfs-3g
gptfdisk
dejavu-fonts-ttf
grub-efi
openssh
cpio
dracut
sharutils
berkeley-db
openldap-pass1
cyrus-sasl
openldap-pass2
sudo
gpm
blfs-systemd-units
tree
neofetch
)

SCRIPTDIR=$(dirname $0)/blfs

for script in ${PKG[@]}; do
        if [ -f "$SCRIPTDIR/build/$script" ]; then
		echo "--- $script skipped ---"
	else
		echo "*** $script ***"
		SRC=/home/blfs-sources $SCRIPTDIR/$script
		echo; echo "*** $script done ***"; sleep 10; echo
	fi
done

echo
echo "**************************************************"
echo "*********    Toolchain build complete    *********"
echo "**************************************************"


# vim:fenc=utf-8:ci:pi:sts=0:sw=4:ts=4:
