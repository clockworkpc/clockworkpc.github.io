---
layout: post
title: "Ruby Project Skeleton Generator on Gist!"
date: "2016-12-26"
author: "Alexander Garber"
tags: []
---

<div dir="ltr" style="text-align: left;" trbidi="on">
        <div dir="ltr" style="text-align: left;" trbidi="on">Exercise 46 of Learn Ruby the Hard Way gives instructions for manually creating a project skeleton.  So I decided to do what I have done many times before in BASH and Python, and
          automate this task with a pretty Ruby script.<br><br>A few thoughts:<br>
          <ol style="text-align: left;">
            <li>Ruby's handling of files and folders is delightfully straightforward.</li>
            <li>Ruby handles strings elegantly.</li>
            <li>This was originally written as a straight script, but then I refactored it with object-oriented programming in mind:</li>
            <ol>
              <li>One Class (Project)</li>
              <li>The main components of the class broken down into methods.</li>
              <li>Names of folders and files are stored in an array and a hash.</li>
              <li>Blocks of text are stored using Squiggly HEREDOC</li>
            </ol>
          </ol>
          <div><a href="https://gist.github.com/clockworkpc/dcd21faab1221600888e13079db0e96e/edit" target="_blank">Enjoy the code!</a></div>
        </div>
      </div>