#!/bin/bash
# Script to copy a kernel and initramfs to the /boot partition on Arch
# Assumes the working directory is the root of the linux kernel source code repo.

LOCALVERSION=$(head include/config/kernel.release)
KERNEL_NAME=vmlinuz-"${LOCALVERSION}"
INITRAMFS_NAME=initramfs-"${LOCALVERSION}"
SYSTEM_MAP_NAME=System.map-"${LOCALVERSION}"
cp arch/x86/boot/bzImage /boot/"${KERNEL_NAME}"
mkinitcpio -k "${LOCALVERSION}" -c /etc/mkinitcpio.conf -g /boot/"${INITRAMFS_NAME}"
cp System.map /boot/"${SYSTEM_MAP_NAME}"
cp System.map /boot/System.map

cat << EOF > /boot/loader/entries/linux-${LOCALVERSION}.conf
title linux-${LOCALVERSION}
linux /${KERNEL_NAME}
initrd /${INITRAMFS_NAME}
options root=PARTUUID=42724dca-9b89-447d-826d-67a79fe6b861 rw nomodeset nouveau.modeset=0
EOF

cat << EOF > /boot/loader/loader.conf
timeout 3
editor 1
default Arch
linux-${LOCALVERSION} linux-${LOCALVERSION}
EOF

