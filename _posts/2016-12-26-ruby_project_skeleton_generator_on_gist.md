---
layout: post
title: "Ruby Project Skeleton Generator on Gist!"
date: "2016-12-26"
author: "Alexander Garber"
tags: []
---

Exercise 46 of Learn Ruby the Hard Way gives instructions for manually creating a project skeleton.  So I decided to do what I have done many times before in BASH and Python, and automate this task with a pretty Ruby script.A few thoughts:Ruby's handling of files and folders is delightfully straightforward.Ruby handles strings elegantly.This was originally written as a straight script, but then I refactored it with object-oriented programming in mind:One Class (Project)The main components of the class broken down into methods.Names of folders and files are stored in an array and a hash.Blocks of text are stored using Squiggly HEREDOCEnjoy the code!