---
layout: post
title:  "Copying from Android to Linux"
date:   "Sun 12 Jul 11:26:53 AEST 2020"
tags: [android, linux, mtp, cp]
---
On Ubuntu, Android MTP is mounted to a folder like this:

```sh
/run/user/1000/gvfs/mtp:host=\%5Busb\%3A001\%2C011\%5D/
```

There is a slight lag when you `cd` to there, and you can feel that you're on a remote filesystem, but copying large amounts of data from the phone is orders of magnitude faster on the command line.
