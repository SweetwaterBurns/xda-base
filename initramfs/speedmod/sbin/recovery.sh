#!/sbin/busybox sh

# use default recovery from rom if we have an update to process, so things like CSC updates work
# Use CWM if we simply entered recovery mode by hand, to be able to use it's features
if /sbin/busybox [ -f "/cache/recovery/command" ];
then
  /sbin/busybox ln -s /system/etc /etc
  /sbin/rec3e &
else
  /sbin/busybox ln -s /misc /etc
  /sbin/busybox umount /cache
  /sbin/busybox umount /system
#link busybox shell for adb
/sbin/busybox mkdir /system/bin
/sbin/busybox ln -s /sbin/busybox /system/bin/sh
#busybox links
cd /sbin
/sbin/busybox ln -s busybox [
/sbin/busybox ln -s busybox [[
/sbin/busybox ln -s busybox ash
/sbin/busybox ln -s busybox awk
/sbin/busybox ln -s busybox basename
/sbin/busybox ln -s busybox bbconfig
/sbin/busybox ln -s busybox bunzip2
/sbin/busybox ln -s busybox busybox
/sbin/busybox ln -s busybox bzcat
/sbin/busybox ln -s busybox bzip2
/sbin/busybox ln -s busybox cal
/sbin/busybox ln -s busybox cat
/sbin/busybox ln -s busybox catv
/sbin/busybox ln -s busybox chgrp
/sbin/busybox ln -s busybox chmod
/sbin/busybox ln -s busybox chown
/sbin/busybox ln -s busybox chroot
/sbin/busybox ln -s busybox cksum
/sbin/busybox ln -s busybox clear
/sbin/busybox ln -s busybox cmp
/sbin/busybox ln -s busybox cp
/sbin/busybox ln -s busybox cpio
/sbin/busybox ln -s busybox cut
/sbin/busybox ln -s busybox date
/sbin/busybox ln -s busybox dc
/sbin/busybox ln -s busybox dd
/sbin/busybox ln -s busybox depmod
/sbin/busybox ln -s busybox devmem
/sbin/busybox ln -s busybox df
/sbin/busybox ln -s busybox diff
/sbin/busybox ln -s busybox dirname
/sbin/busybox ln -s busybox dmesg
/sbin/busybox ln -s busybox dos2unix
/sbin/busybox ln -s busybox du
/sbin/busybox ln -s busybox echo
/sbin/busybox ln -s busybox egrep
/sbin/busybox ln -s busybox env
/sbin/busybox ln -s busybox expr
/sbin/busybox ln -s busybox fdisk
/sbin/busybox ln -s busybox fgrep
/sbin/busybox ln -s busybox find
/sbin/busybox ln -s busybox fold
/sbin/busybox ln -s busybox free
/sbin/busybox ln -s busybox freeramdisk
/sbin/busybox ln -s busybox fuser
/sbin/busybox ln -s busybox getopt
/sbin/busybox ln -s busybox grep
/sbin/busybox ln -s busybox gunzip
/sbin/busybox ln -s busybox gzip
/sbin/busybox ln -s busybox head
/sbin/busybox ln -s busybox hexdump
/sbin/busybox ln -s busybox id
/sbin/busybox ln -s busybox insmod
/sbin/busybox ln -s busybox install
/sbin/busybox ln -s busybox kill
/sbin/busybox ln -s busybox killall
/sbin/busybox ln -s busybox killall5
/sbin/busybox ln -s busybox length
/sbin/busybox ln -s busybox less
/sbin/busybox ln -s busybox ln
/sbin/busybox ln -s busybox losetup
/sbin/busybox ln -s busybox ls
/sbin/busybox ln -s busybox lsmod
/sbin/busybox ln -s busybox lspci
/sbin/busybox ln -s busybox lsusb
/sbin/busybox ln -s busybox lzop
/sbin/busybox ln -s busybox lzopcat
/sbin/busybox ln -s busybox md5sum
/sbin/busybox ln -s busybox mkdir
/sbin/busybox ln -s busybox mke2fs
/sbin/busybox ln -s busybox mkfifo
/sbin/busybox ln -s busybox mkfs.ext2
/sbin/busybox ln -s busybox mknod
/sbin/busybox ln -s busybox mkswap
/sbin/busybox ln -s busybox mktemp
/sbin/busybox ln -s busybox modprobe
/sbin/busybox ln -s busybox more
/sbin/busybox ln -s busybox mount
/sbin/busybox ln -s busybox mountpoint
/sbin/busybox ln -s busybox mv
/sbin/busybox ln -s busybox nice
/sbin/busybox ln -s busybox nohup
/sbin/busybox ln -s busybox od
/sbin/busybox ln -s busybox patch
/sbin/busybox ln -s busybox pgrep
/sbin/busybox ln -s busybox pidof
/sbin/busybox ln -s busybox pkill
/sbin/busybox ln -s busybox printenv
/sbin/busybox ln -s busybox printf
/sbin/busybox ln -s busybox ps
/sbin/busybox ln -s busybox pwd
/sbin/busybox ln -s busybox rdev
/sbin/busybox ln -s busybox readlink
/sbin/busybox ln -s busybox realpath
/sbin/busybox ln -s busybox renice
/sbin/busybox ln -s busybox reset
/sbin/busybox ln -s busybox rm
/sbin/busybox ln -s busybox rmdir
/sbin/busybox ln -s busybox rmmod
/sbin/busybox ln -s busybox run-parts
/sbin/busybox ln -s busybox sed
/sbin/busybox ln -s busybox seq
/sbin/busybox ln -s busybox setsid
/sbin/busybox ln -s busybox sh
/sbin/busybox ln -s busybox sha1sum
/sbin/busybox ln -s busybox sha256sum
/sbin/busybox ln -s busybox sha512sum
/sbin/busybox ln -s busybox sleep
/sbin/busybox ln -s busybox sort
/sbin/busybox ln -s busybox split
/sbin/busybox ln -s busybox stat
/sbin/busybox ln -s busybox strings
/sbin/busybox ln -s busybox stty
/sbin/busybox ln -s busybox swapoff
/sbin/busybox ln -s busybox swapon
/sbin/busybox ln -s busybox sync
/sbin/busybox ln -s busybox sysctl
/sbin/busybox ln -s busybox tac
/sbin/busybox ln -s busybox tail
/sbin/busybox ln -s busybox tar
/sbin/busybox ln -s busybox tee
/sbin/busybox ln -s busybox test
/sbin/busybox ln -s busybox time
/sbin/busybox ln -s busybox top
/sbin/busybox ln -s busybox touch
/sbin/busybox ln -s busybox tr
/sbin/busybox ln -s busybox tty
/sbin/busybox ln -s busybox umount
/sbin/busybox ln -s busybox uname
/sbin/busybox ln -s busybox uniq
/sbin/busybox ln -s busybox unix2dos
/sbin/busybox ln -s busybox unlzop
/sbin/busybox ln -s busybox unzip
/sbin/busybox ln -s busybox uptime
/sbin/busybox ln -s busybox usleep
/sbin/busybox ln -s busybox uudecode
/sbin/busybox ln -s busybox uuencode
/sbin/busybox ln -s busybox watch
/sbin/busybox ln -s busybox wc
/sbin/busybox ln -s busybox which
/sbin/busybox ln -s busybox whoami
/sbin/busybox ln -s busybox xargs
/sbin/busybox ln -s busybox yes
/sbin/busybox ln -s busybox zcat
#end of busybox links
  /sbin/recovery &
fi;
