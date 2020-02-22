---
layout: post
title: "Opening a file with open(ARGV.first) vs declaring a variable"
date: "2016-12-07"
author: "Alexander Garber"
tags: []
---

I am working through Exercise 20 of Learn Ruby the Hard Way, and am trying to make sense of the difference in output between defining the variable "current_file" and simply using open(ARGV.first):Here is the input file test.txt:This is line 1This is line 2This is line 3Here is the beginning of the script:input_file = ARGV.firstdef print_a_line(f)  puts "#{f.gets}"endcurrent_file = open(input_file)When I call the print_a_line with the declared variable:print_a_line(current_file)print_a_line(current_file)print_a_line(current_file)Then f.gets tracks to the new line each time:This is line 1This in line 2This is line 3However, if I call the function with ARGV.first:print_a_line(open(ARGV.first))print_a_line(open(ARGV.first))print_a_line(open(ARGV.first))Then f.gets does not track to the new line and remains on line 1:This is line 1This is line 1This is line 1And the same even with input_file:print_a_line(open(input_file))print_a_line(open(input_file))print_a_line(open(input_file))f.get still doesn't track to the next line:This is line 1This is line 1This is line 1Obviously, I would declare and use variables -- I understand the basics of writing neat, readable code.My question is why does f.get track to the next line when the function is called with a declared variable and not track to the next line when called with the open(ARGV.first) or open(input_file)?Why do I have to declare the variable again?current_file = open(input_file)