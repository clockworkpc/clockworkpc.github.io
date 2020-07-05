---
layout: post
title:  "String reversal one-liner"
date:   "Sun  5 Jul 12:34:39 AEST 2020"
tags: [ruby]
---
```rb
reverse = ->(str) {Array.new(str.length) {|i| str[(i + 1) * -1]}.join}

reverse["Hello World"]
=> "dlroW olleH"
```

## Steps

| Code                    | Explanation                                                          | Return Value             |
|-------------------------|----------------------------------------------------------------------|--------------------------|
| `Array.new`             | Create an empty Array                                                | `[]`                     |
| `str.length`            | The number of characters in a String, including whitespace           | `11`                     |
| `Array.new(str.length)` | Create an Array with 'n' `nil` elements                              | `[nil, nil, nil... ]`    |
| `str[(i + 1) * -1]`     | Replace `nil` with the 'nth-from-the-end' character of the String    | When `i = 0`, `str[-1]`  |
| `[...].join`            | Convert elements to Strings and concatenate them without a delimiter | `[d,l,r,o,W] => 'dlroW'` |
