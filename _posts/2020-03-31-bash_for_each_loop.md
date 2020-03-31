---
layout: post
title:  BASH for-each loop
date:   Tue 31 Mar 11:52:01 AEDT 2020
tags: [bash, shell, scripting]
---
I always have to look this one up:

```sh
for i in *.tar.xz; do tar xfv $i; done
```

Or multiline:

```sh
for i in *.tar.xz
    do tar xfv $i
done
```

For `tar`:

| switch | function |
|--------|----------|
| -x     | extract  |
| -f     | file     |
| -v     | verbose  |


