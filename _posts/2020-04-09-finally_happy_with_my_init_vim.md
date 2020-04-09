---
layout: post
title:  Finally happy with my init.vim
date:   Thu  9 Apr 08:58:08 AEST 2020
tags: [vim, workflow, configuration]
---
I've been tinkering with my `init.vim` (`.vimrc` for Neovim) for a while, and I'm finally happy with it.

Initially I started with vanilla Neovim and added plugins and tweaks bit by bit.

However, before long, I realised that I probably wanted a combination of plugins that someone had already put together before.

## Ultimate Vim Configuration

At first, I went with the modestly titled [Ultimate Vim configuration](https://github.com/amix/vimrc), but I didn't like some of the keybindings.

## Vim Bootstrap

Next, I tried Vim Bootstrap, which is well documented.
Of course, I immediately added plugins to `local_bundles.vim` and some of my own tweaks to `local_init.vim`, which worked well, but it still left me with some problems:

1. I had to jump between Vim Bootstrap's default files and my custom files in order to work out where a configuration was defined.
1. My primary configuration file, `init.vim` contained a lot of plugins and behaviours that I either didn't use or, worse, had to override in my local files.

What I wanted was something in which all my plugins were in the same place, clearly documented, and in which all the keybindings and tweaks were organised.

For example, if I wanted to look at my ALE linters and fixers, I wanted them all in one place, not scattered across two 500-line files; rather, I wanted everything to do with ALE configuration to be in a file called `ale.vim`.

## A Combined Approach

I created two folders for **core** and **custom** Vim configurations, and a shell script to merge them into a single `init.vim`.

Each `.vim` file contains only the configurations that pertain to its subject, i.e. `plugins.vim` contains all the plugins, `ale.vim` everything to do with ALE, etc.

Most of the core configurations are nothing more than the disassembled Vim Bootstrap `init.vim`, and the custom configarations are also mostly from Vim Bootstrap, but organised into individual files that I can easily navigate and modify.

### Core and Custom Vimrcs

- `~/.config/nvim/vimrcs_core/`
- `~/.config/nvim/vimrcs_custom/`

#### Core Vimrcs

```sh
$ ls vimrcs_core
header.vim  keybindings.vim  plugins.vim

```

#### Custom Vimrcs

```sh

$ ls vimrcs_custom/
abbreviations.vim         indentations_tabs_whitespaces.vim  session_management.vim
ale.vim                   javascript.vim                     silver_searcher.vim
autocomd_functions.vim    jedi-vim.vim                       tagbar.vim
buffers_tabs_windows.vim  markdown.vim                       terminal.vim
copy_paste_cut.vim        nerdtree.vim                       textobj-rubyblock.vim
emmet.vim                 polyglot.vim                       typescript.vim
encoding.vim              python.vim                         ultisnips.vim
fzf.vim                   ripgrep.vim                        vim-airline.vim
general_settings.vim      rspec.vim                          visualbell.vim
git.vim                   ruby_doc_command.vim               visual_mode.vim
grep.vim                  ruby.vim                           visual_settings.vim
html.vim                  search.vim

```

#### Shell Script

`~/.config/nvim/generate_neovim_init.sh`

---

```sh
#!/usr/bin/env bash

nvimDir="${HOME}/.config/nvim"
vimrcCoreDir="${nvimDir}/vimrcs_core"
vimrcCustomDir="${nvimDir}/vimrcs_custom"
initFile="${nvimDir}/init.vim"

function appendToInit() {
  myDir=$1
  vimFiles=`ls ${myDir}`

  for f in "${myDir}/*"
  do
    cat ${f} >> ${initFile}
  done

  for f in ${vimFiles}
  do
    echo ${f}
  done

  echo
  echo "Files added from ${myDir}"
  echo
}

mv ${initFile} "${initFile}.bak"
touch ${initFile}

appendToInit ${vimrcCoreDir}
appendToInit ${vimrcCustomDir}

```
