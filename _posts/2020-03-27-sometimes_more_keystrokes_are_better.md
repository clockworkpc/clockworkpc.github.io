---
layout: post
title:  Sometimes more keystrokes are better
date:   Fri 27 Mar 11:06:09 AEDT 2020
tags: [workflow, bash, rails]
---
I thought I'd be clever with my `bundle exec` aliases:

```sh

# Ruby and Rails
alias be='bundle exec'
alias ber='bundle exec rails'
alias bers='bundle exec rails s'
alias berc='bundle exec rails c'
alias berr='bundle exec rails spec'

```

But what I found is that anything beyond `be` for `bundle exec` actually disrupts my flow.

So I got rid of everything else and will stick to this:


```sh

# Ruby and Rails
alias be='bundle exec'

```
