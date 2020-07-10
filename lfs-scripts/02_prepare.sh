#!/bin/bash
LFS=/mnt/lfs

export LFS=/mnt/lfs

mkdir -v $LFS/home/sources/lfs
chmod -v a+wt $LFS/home/sources/lfs


mkdir -pv $LFS/{usr,lib,var,etc,bin,sbin}
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

chown -v lfs $LFS/home/sources/lfs
echo "Now switch to the lfs user"

