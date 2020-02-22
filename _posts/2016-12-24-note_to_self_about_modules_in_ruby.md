---
layout: post
title: "Note to Self about Modules in Ruby"
date: "2016-12-24"
author: "Alexander Garber"
tags: []
---

Make sure to include the name of the module in the method:module GameDictionary  def GameDictionary.scene_enter()    puts "This scene is not yet configured. Subclass it and implement enter()."    exit(1)  endEverything else is rather straightforward, but for some reason I keep on missing that detail.  I'll just keep on drilling it until it sinks in.In other words, I'll keep on crashing until I learn how to fly this damn aeroplane :)