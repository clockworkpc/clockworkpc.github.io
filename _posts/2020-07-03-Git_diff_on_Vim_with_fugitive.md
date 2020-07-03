---
layout: post
title:  "Git diff on Vim with fugitive"
date:   "Fri  3 Jul 15:31:48 AEST 2020"
tags: [vim, fugitive, git]
---
To compare a file across branches:

GIVEN:
- `my_file.rb` on branch `foo`
- `my_file.rb` on branch `bar`

1. Install the fugitive plugin by Tim Pope.
2. Open the `my_file.rb` in Neovim.
3. `:Gdiff bar:%` (branch is `bar`, file is current file[%])
