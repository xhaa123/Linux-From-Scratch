# Linux-From-Scratch

**lvm + btrfs + efi**


> 打包文件home、boot目录没有内容

> 需要重新编译内核 删除/lib/modules/5.7.2目录

> fstab文件要修改

> root密码在chroot下修改

    mount /dev/mapper/VolumeGroup-lvolroot $LFS
    mount /dev/mapper/VolumeGroup-lvolhome $LFS/home
    mount /dev/sda1 $LFS/boot
    mount /dev/sda2 $LFS/boot/efi
    swapon /dev/mapper/VolumeGroup-lvolswap

    mount -v --bind /dev $LFS/dev
    mount -v --bind /dev/pts $LFS/dev/pts
    mount -vt proc proc $LFS/proc
    mount -vt sysfs sysfs $LFS/sys
    mount -vt tmpfs tmpfs $LFS/run

    if [ -h $LFS/dev/shm ]; then
    mkdir -pv $LFS/$(readlink $LFS/dev/shm)
    fi

    mount -vt efivarfs efivarfs $LFS/sys/firmware/efi/efivars 

    chroot "$LFS" /usr/bin/env -i          \
        HOME=/root TERM="$TERM"            \
        PS1='\[\e[37;40m\][\[\e[31;40m\](lfs chroot) \[\e[32;40m\]\u:\[\e[36;40m\]\w \[\e[0m\]] \$ ' \
        PATH=/bin:/usr/bin:/sbin:/usr/sbin \
        /bin/bash --login

    dracut /boot/initrd-5.6.15-lfs-20200531-systemd.img 5.7.2
    grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id="Linux From Scratch"
    grub-mkconfig -o /boot/grub/grub.cfg




### LFS Version 
**lfs: 20200619-systemd**
**blfs 20200701**
