---
layout: post
title:  Create Live USB from ISO on command line
date:   Sat 25 Apr 10:08:27 AEST 2020
tags: [linux,iso,cli]
---
## Identify the USB drive

```sh
> lsblk | grep sda
sda                   8:0    1  14.3G  0 disk
└─sda1                8:1    1   1.4G  0 part  /media/alexander/Linux Lite 4.8
```

## Dismount the USB stick

```sh
sudo umount /dev/sda1
```

## Create live USB from ISO

```sh
sudo dd bs=4M if=/home/alexander/ISO/elementaryos-5.1-stable.20200405.iso of=/dev/sda1 conv=fdatasync status=progress
```
