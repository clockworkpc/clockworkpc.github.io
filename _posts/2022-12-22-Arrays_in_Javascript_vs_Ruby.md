---
layout: post
title:  "Arrays in Javascript vs Ruby"
date:   "Thu Dec 22 09:42:02 PM EST 2022"
tags: [js,array,map,filter,reduce]
---
## Setup in Javascript

```js
const array = [1, 2, 10, 16];
const double = [];
const newArray = array.forEach((num) => {
double.push(num * 2);
});
```

## Setup in Ruby

```ruby
ary = [1, 2, 10, 16]
new_array = []
ary.each { |num| double << num * 2 }
```
## map in Javascript

```js
const array = [1, 2, 10, 16];
const mapArray = array.map(num => num * 2);
```

## map in Ruby

```ruby
array = [1, 2, 10, 16]
map_array = array.map { |num| num * 2 }
```

## filter in Javascript

```js
const array = [1, 2, 10, 16];
const filterArray = array.filter(num => num > 5);
```

## filter/select in Ruby

```ruby
array = [1, 2, 10, 16]
select_array = array.select { |num| num > 5 }
```

## reduce in Javascript

```js
const array = [1, 2, 10, 16];
const reduceArray = array.reduce((accumulator, num) => {
  return accumulator + num
}, 0);
// 1 + 2 + 10 + 16
// 29
```

## reduce in Ruby

```ruby
array = [1, 2, 10, 16]
reduce_array = array.reduce(0) { |accumulator, num| accumulator + num }
reduce_array = array.reduce(:+)
```
