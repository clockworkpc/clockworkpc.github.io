---
layout: post
title:  Copy a file's contents in one line
date:   Thu 26 Mar 11:50:24 AEDT 2020
tags: [bash, workflow]
---
If you ever wanted a quick and easy to get the contents of a file:

### Shell Script

```sh
#!/usr/bin/env sh
cat $1 | xclip -selection c
```


Directly on the commandline, for a file called `hello_world.txt`

```sh
cat hello_world.txt | xclip -selection c
```
