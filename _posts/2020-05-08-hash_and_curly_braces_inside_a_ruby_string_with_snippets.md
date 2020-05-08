---
layout: post
title:  Hash and Curly Braces inside a Ruby String with snippets
date:   Fri  8 May 11:19:38 AEST 2020
tags: [ruby,vim,workflow]
---
I was looking for a way to save myself an annoyance in Vim when interpolating a value inside a Ruby string.

## Problem

GIVEN that the cursor is inside a Ruby string

WHEN I type `#`

THEN Vim should insert into the text `#{}`

AND my cursor should be between the curly braces

AND after I finish typing inside the curly braces there should be a way to jump out of them.

## Solution

```
snippet #
	#{${1}} ${2}
```

Thus, when I type `#`-`TAB`:

1. Vim adds the curly braces
2. Places the cursor inside the braces
3. And when I finish typing, I can press tab to jump out.

I never used the original snippet anyway, because I use Tim Pope's excellent plugin, [Vim Commentary](https://github.com/tpope/vim-commentary).
