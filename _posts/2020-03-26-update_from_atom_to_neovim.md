---
layout: post
title: From Atom to Neovim
date:   Thu 26 Mar 10:53:52 AEDT 2020
tags: [atom, ide, workflow, vim]
---
I enjoy using Neovim more with every passing day.

I availed myself of [VIM Bootstrap](https://vim-bootstrap.com/) and have so far added the following customisations:

### local_bundles.vim
```vim
"*****************************************************************************
"" Plug install packages (extra)
"*****************************************************************************

Plug 'amix/vim-zenroom2'
Plug 'christoomey/vim-sort-motion'
Plug 'dhruvasagar/vim-table-mode'
Plug 'felipec/notmuch-vim'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/goyo.vim'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'tpope/vim-surround'

```

### local_init.vim

```vim
"*****************************************************************************
"" Custom Bindings
"*****************************************************************************

"Fix indentation for the whole file
map <F7> gg=G<C-o><C-o>

" Bind F8 to fixing problems with ALE
nmap <F8> <Plug>(ale_fix)

"Force filetype 'yaml' for yml files
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=manual
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" autocmd BufNewFile,BufRead *.yml set ft=yaml

"Vimroom
let g:goyo_width=80
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>

"Stop line wrap from breaking words
set linebreak

"Move text up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"Skip out of brackets
inoremap <C-e> <C-o>A

"*****************************************************************************
"" NERDTree
"*****************************************************************************

"Close NERDTree when you open a file
let NERDTreeQuitOnOpen = 1

"Prettify NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"*****************************************************************************
"" General Settings
"*****************************************************************************

"Use `onedark` colour scheme
colorscheme onedark

"Syntax highlighting from start unless 1000 lines (instead of 200)
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=1000
augroup END

"Assign ALE fixers

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['eslint'],
      \   'ruby': ['rubocop']
      \}


"*****************************************************************************
"" Markdown
"*****************************************************************************

"Markdown plugin
filetype plugin on

"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1

  ```
