---
layout: post
title: "JavaScript on both ends "
date: "2018-04-28"
author: "Alexander Garber"
tags: []
---

After 4 pomodoros on @AnthonyPAlicea's NodeJS course, Lecture 90, I think I understand how JavaScript code runs on both front and back-end.Looking at this code, I can see how the array of JavaScript objects is declared on the server (/app.js), then passed on to the view (/views/index.ejs), converted to a JSON string, is made available to the AngularJS controller, which then manipulates the JSON object in the client.As I go through the code line by line, I ask myself continually:Where does the program get this from?Where is the variable declared?How does this part of the program have access to it?In this way, I can always see, piece by piece, how it all fits together.Unless of course I'm using Rails, in which case one must have faith in its sugary magic.