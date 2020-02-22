---
layout: post
title: "User Testing Update"
date: "2017-01-17"
author: "Alexander Garber"
tags: []
---

I've had to hit the books again to improve my understanding of variables, classes, and methods.I've been re-writing my text adventure game so that every aspect of it is tested by the Rakefile.  This means that I have had to extrapolate the logic of the enter() method in each class, so that a test can be written for it.The most interesting parts of the game involve somewhat complex conditionals, written as case conditionals, and for some reason it took me a while to understand how to pass on a variable to the method containing a case conditional.  Now that I look at it again, it's very simple, but c'est la vie.Anyway, the re-written game is nearing completion and the latest code is up on Github.