lfs_dirs()
{
	mkdir -pv $LFS/dev

	mknod -m 600 $LFS/dev/console c 5 1 || true
	mknod -m 666 $LFS/dev/null c 1 3 || true

	mkdir -pv $LFS/bin || true
	mkdir -pv $LFS/usr/{lib{,32},bin} || true
	mkdir -pv $LFS/etc || true

	ln -sv /tools/bin/{bash,cat,chmod,dd,echo,ln,mkdir,pwd,rm,stty,touch} $LFS/bin
	ln -sv /tools/bin/{env,install,perl,printf}         $LFS/usr/bin
	for lib in lib{,32}; do
	  ln -sv /tools/$lib/libgcc_s.so{,.1}               $LFS/usr/$lib
	  ln -sv /tools/$lib/libstdc++.{a,so{,.6}}          $LFS/usr/$lib
	done

	install -vdm755 $LFS/usr/lib{,32}/pkgconfig

	ln -svf bash $LFS/bin/sh

	ln -sv /proc/self/mounts $LFS/etc/mtab

	cat > $LFS/etc/passwd << "EOF"
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/dev/null:/bin/false
daemon:x:6:6:Daemon User:/dev/null:/bin/false
messagebus:x:18:18:D-Bus Message Daemon User:/var/run/dbus:/bin/false
systemd-bus-proxy:x:72:72:systemd Bus Proxy:/:/bin/false
systemd-journal-gateway:x:73:73:systemd Journal Gateway:/:/bin/false
systemd-journal-remote:x:74:74:systemd Journal Remote:/:/bin/false
systemd-journal-upload:x:75:75:systemd Journal Upload:/:/bin/false
systemd-network:x:76:76:systemd Network Management:/:/bin/false
systemd-resolve:x:77:77:systemd Resolver:/:/bin/false
systemd-timesync:x:78:78:systemd Time Synchronization:/:/bin/false
systemd-coredump:x:79:79:systemd Core Dumper:/:/bin/false
nobody:x:99:99:Unprivileged User:/dev/null:/bin/false
EOF

	cat > $LFS/etc/group << "EOF"
root:x:0:
bin:x:1:daemon
sys:x:2:
kmem:x:3:
tape:x:4:
tty:x:5:
daemon:x:6:
floppy:x:7:
disk:x:8:
lp:x:9:
dialout:x:10:
audio:x:11:
video:x:12:
utmp:x:13:
usb:x:14:
cdrom:x:15:
adm:x:16:
messagebus:x:18:
systemd-journal:x:23:
input:x:24:
mail:x:34:
kvm:x:61:
systemd-bus-proxy:x:72:
systemd-journal-gateway:x:73:
systemd-journal-remote:x:74:
systemd-journal-upload:x:75:
systemd-network:x:76:
systemd-resolve:x:77:
systemd-timesync:x:78:
systemd-coredump:x:79:
nogroup:x:99:
users:x:999:
EOF

mkdir -pv $LFS/var/lib/pkg/{pkg,src,work}
touch $LFS/var/lib/pkg/db
}

mount_pseudo()
{
	mkdir -p $LFS/{dev,run,proc,sys}

	mount -v --bind /dev $LFS/dev

	mount -vt devpts devpts $LFS/dev/pts -o gid=5,mode=620
	mount -vt proc proc $LFS/proc
	mount -vt sysfs sysfs $LFS/sys
	mount -vt tmpfs tmpfs $LFS/run

	if [ -h $LFS/dev/shm ]; then
	  mkdir -pv $LFS/$(readlink $LFS/dev/shm)
	fi
}

umount_pseudo() {
	unmount $LFS/dev/pts
	unmount $LFS/dev
	unmount $LFS/run
	unmount $LFS/proc
	unmount $LFS/sys
}

mountbind_srcpkg()
{
	mount --bind $SRCDIR $LFS/var/lib/pkg/src
	mount --bind $PKGDIR $LFS/var/lib/pkg/pkg
	mount --bind $WORKDIR $LFS/var/lib/pkg/work
}

unmountbind_srcpkg()
{
	unmount $LFS/var/lib/pkg/src
	unmount $LFS/var/lib/pkg/pkg
	unmount $LFS/var/lib/pkg/work
}

unmount()
{
	while true; do
		mountpoint -q $1 || break
		umount $1 2>/dev/null
	done
}

runinchroot() {
	pushd $LFS &>/dev/null
	mount_pseudo
	mountbind_srcpkg
	cp -L /etc/resolv.conf $LFS/etc/
	chroot "$LFS" $ENVLFS -i \
	    HOME=/root                  \
	    TERM="$TERM"                \
	    PS1='(lfs chroot) \u:\w\$ ' \
	    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin $@
	retval=$?
	unmountbind_srcpkg
	umount_pseudo
	popd &>/dev/null
	return $retval
}

interrupted() {
	die "script $(basename $0) aborted!"
}

die() {
	[ "$@" ] && printerror $@
	unmountbind_srcpkg
	umount_pseudo
	exit 1
}

printerror() {
	echo -e "ERROR: $@"
}

trap "interrupted" SIGHUP SIGINT SIGQUIT SIGTERM

if [ $(id -u) != 0 ]; then
	echo "$0 script need to run as root!"
	exit 1
fi

if [ -x $LFS/usr/bin/env ]; then
	ENVLFS=/usr/bin/env
else
	ENVLFS=/tools/bin/env
fi

if [ ! -f $LFS/var/lib/pkg/db ]; then
	lfs_dirs
fi
