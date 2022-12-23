---
layout: post
title:  "Arrays in Javascript vs Ruby"
date:   "Thu Dec 22 09:42:02 PM EST 2022"
tags: [js,array,map,filter,reduce]
---
# Setup in Javascript

```js
const array = [1, 2, 10, 16];
const double = [];
const newArray = array.forEach((num) => {
double.push(num * 2);
});
```

# Setup in Ruby

```ruby
ary = [1, 2, 10, 16]
new_array = []
ary.each { |num| double << num * 2 }
```
# map in Javascript
