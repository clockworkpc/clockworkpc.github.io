---
layout: post
title: "Using a string as a class variable"
date: "2016-12-26"
author: "Alexander Garber"
tags: []
---

My script relies on a single argument in the form $stdin user input:class Project  def initialize()    puts "What do you want to call this project?\n"    print "> "    $user_input = $stdin.gets.chompThe script is organised into a single class that contains consecutive methods.The simplest way I have found to utilise the user input is to declare it in each method.  def define_folders()    project_name = $user_input  def create_gemfile()    project_name = $user_inputHowever, this is repetitive.What would be a better way?