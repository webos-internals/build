#!/bin/sh

CHROOT=/media/ext3fs/ubuntu-oneiric-chroot

cp /etc/resolv.conf ${CHROOT}/etc/resolv.conf

cp /etc/hosts ${CHROOT}/etc/hosts

mount --bind /dev ${CHROOT}/dev
mount --bind /dev/pts ${CHROOT}/dev/pts
mount --bind /proc ${CHROOT}/proc
mount --bind /sys ${CHROOT}/sys
mount --bind /tmp ${CHROOT}/tmp

chroot ${CHROOT} /bin/bash

umount ${CHROOT}/tmp
umount ${CHROOT}/sys
umount ${CHROOT}/proc
umount ${CHROOT}/dev/pts
umount ${CHROOT}/dev

