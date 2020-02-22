---
layout: post
title: "Controllers make a lot more sense now"
date: "2018-04-24"
author: "Alexander Garber"
tags: []
---

I'm working through Anthony Alicea's "Learn and Understand NodeJS" and Lecture 79 helped me to make sense of the problem that controllers are meant to solve.var express = require('express');var app = express();var htmlController = require("/controllers/htmlController")var apiController = require("/controllers/apiController")var port = process.env.PORT || 1337;app.use('/assets', express.static(__dirname + '/public'));app.set('view engine', 'ejs');htmlController(app);apiController(app);app.listen(port);