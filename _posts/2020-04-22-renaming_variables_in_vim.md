---
layout: post
title:  Renaming variables in vim
date:   Wed 22 Apr 15:12:07 AEST 2020
tags: [vim, workflow]
---
If I have a method definition like this:

```ruby
def foo_bar(string)
  puts old_variable_name
end

foo_bar('hello')
foo_bar('goodbye')
foo_bar('au revoir)
foo_bar('auf Wiedersehen')
foo_bar('ciao')
```

To change all instances of `foo_bar`:

1. Put my cursor over the first instance
2. `gd` (or `gD` for global replacement)
3. `c` (change)
4. `gn` (new name)
5. `ESC` key
6. `.` to repeat the changes one by one.

Alternatively:

1. Put my cursor over the first instance
2. `gd` (or `gD` for global replacement)
3. `c` (change)
4. `gn` (new name)
5. `ESC` key
6. `:%norm.` to rename all occurences in the buffer.


Thus...

```ruby
def bar_foo(string)
  puts old_variable_name
end

bar_foo('hello')
bar_foo('goodbye')
bar_foo('au revoir)
bar_foo('auf Wiedersehen')
bar_foo('ciao')
```
