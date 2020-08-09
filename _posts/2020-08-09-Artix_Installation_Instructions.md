---
layout: post
title:  "Artix Installation Instructions"
date:   "Sun  9 Aug 20:04:47 AEST 2020"
tags: [artix, arch, linux]
---
```sh
$ sudo su
$ ip a # list network devices
$ ip link set wlan0 up # wlan0 is the wifi device
$ rfkill unblock wifi # if wlan0 is blocked
$ ip link set wlan0 up
  > connmanctl
  > scan wifi
  > services
  > agent on
  > connect $ WIFI_ID # see the list given by `services`
  # enter the passphrase
  > quit
$ ping artixlinux.com
$ cfdisk /dev/sda
$ Delete partitions
$ New EXT4 partition
$ Write
$ Quit
$ lsblk # if the new partition is not listed, use fdisk to partition the disk instead
$ mkfs.ext4 /dev/sda1
$ mount /dev/sda1 /mnt
$ basestrap /mnt # whichever packages are required for basestrap, inc. `neovim`
$ fstabgen -U /mnt >> /mnt/etc/fstab
$ artools-chroot /mnt
$ dd if=/dev/zero of=/swapfile bs=1G count=2 status=progress
$ chmod 600 /swapfile
$ mkswap /swapfile
$ swapon /swapfile
$ nvim /etc/fstab
```
`/swapfile   none  swap  defaults 0 0`

```
$ ln -sf /usr/share/zoneinfo/Australia/Melbourne /etc/localtime
$ hwclock --systohc
$ nvim /etc/locale.gen
```

`en_us.UTF-8 UTF-8`

```
$ locale-gen
$ nvim /etc/locale.conf
```

`LANG=en_US.UTF-8`

```
$ nvim /etc/hostname
```

`artix`

```
$ nvim /etc/hosts
```

`127.0.0.1 localhost`
`::1       localhost`
`127.0.1.1 artix.localdomain  artix`

```
passwd # set password for root
pacman -S grub networkmanager networkmanager-runit network-manager-applet dosfstools linux-headers bluez bluez-runit bluez-utils cups cups-runit xdg-utils xdg-user-dirs
grub-install --target=i386-pc /dev/sda
# DOS partition table automatically places the Master Boot Record at the
# beginning of the disk, so boot partition not specified
grub-mkconfig -o /boot/grub/grub.cfg
cd /etc/runit/sv
ls # should see the installed utilities
useradd -mG wheel $USERNAME
EDITOR=nvim visudo
#uncomment `%wheel ALL=(ALL) ALL`
exit
umount -R /mnt
reboot
sudo su
ln -s /etc/runit/NetworkManager /run/runit/service/NetworkManager
ip a # expect that wifi should be down
nmtui # connect to local wifi network
ip a # wifi should be up now
ln -s /etc/runit/bluetoothd /run/runit/service/bluetoothd
ln -s /etc/runit/cupsd /run/runit/service/cupsd
pacman -S xf86-video-intel xorg --ignore xorg-server-xdmx sddm sddm-runit # and DE/WM
ln -s /etc/runit/sddm /run/runit/service/sddm
```
