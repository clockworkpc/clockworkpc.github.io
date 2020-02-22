---
layout: post
title: "Slow Ubuntu Bootup"
date: "2016-12-25"
author: "Alexander Garber"
tags: []
---

Bootup was being extended by 90 seconds with this message:A start job is running for disk... After consulting the help forums, I checked Gparted:And found an empty partition where I expected to find a swap partition.Then, I checked /etc/fstab and, yes, found that it expected a swap partition.So I created a swap partition.  We'll see how how we go.