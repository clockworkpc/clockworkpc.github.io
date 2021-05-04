---
layout: post
title:  "Check Method Definition in Ruby"
date:   "Tue  4 May 06:04:28 PDT 2021"
tags: [ruby,rails]
---
This works for a method defined in a gem too.

```ruby
m = User.method(:invite!)
m.source_location
```
