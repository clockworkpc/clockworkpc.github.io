---
layout: post
title:  VIM Text Substitution trick
date:   Wed 15 Apr 11:07:35 AEST 2020
tags: [vim,string_replacement]
---

## Starting string

```sh
mv app/controllers/teams_controller.rb
```

## VIM String Substitution

```
:%s/\(app.*\)team\(.*$\)/\1team\2 \1organisation\2/gc
```

## Result

```sh
mv app/controllers/teams_controller.rb app/controllers/organisations_controller.rb
```
