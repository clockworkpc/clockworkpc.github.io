---
layout: post
title: "Rails Study, Day 2: Rails Install Fest"
date: "2017-03-27"
author: "Alexander Garber"
tags: []
---

I have started a demonstration blog on Rails according to the instructions on the Ruby on Rails Install Fest, my first proper attempt at building something substantial on Rails.  My goal is to build a website that showcases my solutions to Advent of Code, but the first step is to have a site running on Rails, and in my case, hosted on Heroku.Wish me luck!Update:Update:Had to solve problems with installing the following gems:jsonpgThe json gem was set to 1.8.3, but I solved it by forcing the version to 1.8.5.The pg gem was able to install after I properly re-installed Postgres on my machine.Update:Now running into problems with Postgresql.