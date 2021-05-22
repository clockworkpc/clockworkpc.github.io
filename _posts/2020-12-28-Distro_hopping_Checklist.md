---
layout: post
title:  "Distro-hopping Checklist"
date:   "Mon 28 Dec 10:39:53 AEDT 2020"
tags: [linux, arch, manjaro]
---
## Requirements
- Multi-monitor support
- Multiple desktop
- Easy to jump between previous and next windows
- Easy to switch between multiple languages

## Required Applications and Packages
- git
- yay
- FISH
- tilix
- zoom
- slack
- brave
- clickup
- some sort of world clock

## Steps

### 1. Initial setup on a new Arch system

```sh
mkdir ~/bin
cd ~/bin
wget https://gist.githubusercontent.com/clockworkpc/9bfe0777c55935c712b21ef8895a768a/raw/a1529d2747f1893cf7832616adf37609b0bc496c/arch_initial_setup.sh
chmod +x arch_initial_setup.sh
./arch_initial_setup.sh
```

### 2. Dotfiles

- Sync Brave Profile
- ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
- git clone dotfiles
- `~/.dotfiles/pre_install.sh`
- `~/.dotfiles/install.sh`
- `~/..dotfiles/config/nvim/generate_neovim_init.sh`
- `nvim` and then `:checkhealth provider`
- `~/.dotfiles/post_install.sh`
- `~/.dotfiles/post_fish_install.sh`
