#!/usr/bin/env bash

set -x
umount -l /mnt/ramdisk
rm -rf /mnt/ramdisk
set -e
mkdir -p /mnt/ramdisk
/home/cmccabe/tachyon//bin/tachyon-mount.sh SudoMount
