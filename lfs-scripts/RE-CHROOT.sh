#!/bin/bash
LFS=/mnt/lfs

export LFS=/mnt/lfs

mount -v /dev/mapper/VolumeGroup-lvolroot $LFS
mount -v /dev/mapper/VolumeGroup-lvolhome $LFS/home
mount -v /dev/sdb2 $LFS/boot
mount -v /dev/sdb1 $LFS/boot/efi
swapon /dev/mapper/VolumeGroup-lvolswap

mount -v --bind /dev $LFS/dev
mount -v --bind /dev/pts $LFS/dev/pts
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run

if [ -h $LFS/dev/shm ]; then
  mkdir -pv $LFS/$(readlink $LFS/dev/shm)
fi

mount -t efivarfs efivarfs $LFS/sys/firmware/efi/efivars

chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1="\[\e[37;40m\][\[\e[31;40m\](lfs chroot) \[\e[32;40m\]\u:\[\e[36;40m\]\w \[\e[0m\]]\\$ "  \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    /bin/bash --login +h
