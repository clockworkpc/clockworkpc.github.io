---
layout: post
title:  "open multiple tabs in vim from string input"
date:   "Mon 19 Apr 19:08:48 PDT 2021"
tags: [vim]
---
If you have the paths of a few files, copy them and then use them in place of `*.html`

`:args *.html | argdo tabe | tabdo syntax on`
