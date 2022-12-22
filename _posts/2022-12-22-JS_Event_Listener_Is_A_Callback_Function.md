---
layout: post
title:  "JS Event Listener Is A Callback Function"
date:   "Thu Dec 22 08:09:58 AM EST 2022"
tags: [js,study,callback]
---
Event listener syntax :

```js
button.addEventListener("click", addListAfterClick);
input.addEventListener("keypress", addListAfterKeypress);
```

Rather than:

```js
button.addEventListener("click", addListAfterClick());
input.addEventListener("keypress", addListAfterKeypress(event));
```
