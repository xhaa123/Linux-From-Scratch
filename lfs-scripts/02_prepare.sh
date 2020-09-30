#!/bin/bash
LFS=/mnt/lfs

export LFS=/mnt/lfs

mkdir -v $LFS/sources
chmod -v a+wt $LFS/sources

wget --input-file=wget-list --continue --directory-prefix=$LFS/sources

pushd $LFS/sources
  md5sum -c md5sums
popd

mkdir -pv $LFS/{bin,etc,lib,sbin,usr,var}
case $(uname -m) in
  x86_64) mkdir -pv $LFS/lib64 ;;
esac

mkdir -pv $LFS/tools

groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs

chown -v lfs $LFS/{usr,lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) chown -v lfs $LFS/lib64 ;;
esac

chown -v lfs $LFS/sources
echo "Now switch to the lfs user"

