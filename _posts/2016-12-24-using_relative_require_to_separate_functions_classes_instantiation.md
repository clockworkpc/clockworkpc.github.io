---
layout: post
title: "Using 'relative_require' to separate functions, classes, instantiation"
date: "2016-12-24"
author: "Alexander Garber"
tags: []
---

My goal is to create a main.rb file that does nothing but instantiate the classes and execute their methods.  As you can see below, this is possible, at least in a simple application, but is this good practice?It feels neater to separate classes, functions, etc; but then again, this might be akin to separating vocabulary sheets by parts of speech -- tidy, but impracticable.It might be better practice to group blocks of code that work on the same portion of the program.  Please let me know what works in your experience. A simple function:## demo_function.rbdef hello_world()  puts "Hello world!"endA class that uses this function as a method:## demo_class.rbrequire_relative 'demo_function.rb'class Demo  def enter()    hello_world()  endendFinally, an instance of the class that executes its method:## demo_main.rbrequire_relative 'demo_class'a_class = Demo.new()a_class.enter()Output:Hello World!