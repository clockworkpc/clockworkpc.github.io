---
layout: post
title:  "To Do List JS"
date:   "Thu Dec 22 08:05:39 AM EST 2022"
tags: [js,study]
---
`index.html`:

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>Javascript Holder</title>
  </head>
  <body>
    <h1>Shopping List</h1>
    <h2>Get it done today</h2>
    <h2>No excuses</h2>
    <input type="text" value="" name="user_input" id="user_input"/>
    <button id="button1">Add to list</button>
    <ul>
      <li>Notebook</li>
      <li>Pencil</li>
      <li>Highlighter</li>
    </ul>
    <script type="text/javascript" src="script.js"></script>
  </body>
</html>
```

`script.js`:

```js
var buttons = document.querySelectorAll("button");
var button = buttons[0];
var input = document.getElementById("user_input");
var ul = document.querySelector("ul");
var lis = document.querySelectorAll("li");
var listItems = [];

lis.forEach(function (li) {
  listItems.push(li.textContent);
});

function isNotBlank() {
  return input.value.length > 0;
}

function keyPressEnter() {
  return event.keyCode === 13;
}

function elementType() {
  return event.path[0].tagName.toLowerCase();
}

function isButtonEvent() {
  return elementType() === "button";
}

function isInputEvent() {
  return elementType() === "input";
}

function isNewListItem() {
  var included = listItems.includes(input.value);
  if (included) {
    alert(input.value + " is already on the list!");
    input.focus();
    return false;
  } else {
    return true;
  }
  return !listItems.includes(input.value);
}

function isValidlyEntered() {
  return isNotBlank() && isNewListItem();
}

function isValidButtonInput() {
  return isButtonEvent() && isValidlyEntered();
}

function isValidKeyboardInput() {
  return isInputEvent() && keyPressEnter() && isValidlyEntered();
}

function isValidInput() {
  return isValidButtonInput() || isValidKeyboardInput();
}

function createListElement() {
  var li = document.createElement("li");
  li.appendChild(document.createTextNode(input.value));
  ul.appendChild(li);
  input.value = "";
}

function addToList() {
  if (isValidInput()) {
    createListElement();
    input.focus();
  }
}

button.addEventListener("click", addToList);
input.addEventListener("keypress", addToList);
input.focus();
```
