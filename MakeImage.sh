#!/bin/bash
dd if=/dev/zero of=debian.ext3 bs=1M count=1024
mkfs.ext3 debian.ext3
tune2fs -i 0 -c 0 debian.ext3
mkdir /mnt/debian
mount -o loop -t ext3 debian.ext3 /mnt/debian
debootstrap --arch=armel --foreign --no-check-gpg wheezy /mnt/debian http://archive.debian.org/debian/
umount /mnt/debian
rmdir /mnt/debian
