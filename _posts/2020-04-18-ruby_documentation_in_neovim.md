---
layout: post
title:  Ruby Documentation in Neovim
date:   Sat 18 Apr 15:08:07 AEST 2020
tags: [neovim,workflow]
---
I was enjoying this lovely plugin, but it stopped working.

After wasting some time on it, I decided to write the same functionality on my own.

```vimrc

"*****************************************************************************
"" vim-ruby-doc
"*****************************************************************************

" For some reason this plugin doesn't work anymore,
" so I hacked together the same functionality, using its example.
" Replace 'firefox' with whatever command you need instead.

let g:ruby_doc_url_template="http://rubydoc.info/search/stdlib/core?q=%"
let g:rails_doc_url_template="http://api.rubyonrails.org/?q=%"
let g:rspec_doc_url_template='https://www.relishapp.com/rspec/search?query=%'


function! AnyRDoc(url_template)
  if &ft =~ "ruby"
  else
    return
  endif

  let s:wordUnderCursor = expand("<cword>")
  let s:url = substitute(a:url_template, "%", s:wordUnderCursor, "g")
  let s:cmd = "!firefox \"" . s:url . "\""
  execute s:cmd
endfunction

map RB :call AnyRDoc(ruby_doc_url_template)<CR>
map RR :call AnyRDoc(rails_doc_url_template)<CR>
map RS :call AnyRDoc(rspec_doc_url_template)<CR>

```
