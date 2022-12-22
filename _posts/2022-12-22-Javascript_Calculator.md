---
layout: post
title:  "Javascript Calculator"
date:   "Thu Dec 22 12:40:40 AM EST 2022"
tags: [js,study]
---
I decided to go a little further with the calculator exercise in Lecture 122.  The obvious, defective solution is IF ELSE, but I prefer to take advantage of the fact that the parameter (string or symbol) that describe the arithmetic function.  So calc1 is the beginner's way of doing things, whereas calc2 is the kind of code that I look for:

```js
function add(a, b) {
  return a + b;
}

function subtract(a, b) {
  return a - b;
}

function multiply(a, b) {
  return a * b;
}

function divide(a, b) {
  return a / b;
}

function invokeMe(string, array) {
  if (typeof window[string] === "function") {
    return window[string].apply(null, array);
  }
}

function calc1(action, a, b) {
  if (action == "add") {
    return add(a, b);
  } else if (action == "subtract") {
    return subtract(a, b);
  } else if (action == "multiply") {
    return multiply(a, b);
  } else if (action == "divide") {
    return divide(a, b);
  } else {
    return "Something went wrong";
  }
}

function calc2(string, array) {
  var actions = ["add", "subtract", "multiply", "divide"];

  if (actions.includes(string)) {
    return invokeMe(string, array);
  } else {
    console.log("not a valid action");
    return null;
  }
}
```
The key is the function invokeMe which uses a string to call a function (or invoke a method) WITHOUT USING eval.
