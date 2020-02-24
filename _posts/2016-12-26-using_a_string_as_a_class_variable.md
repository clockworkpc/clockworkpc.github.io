---
layout: post
title: "Using a string as a class variable"
date: "2016-12-26"
author: "Alexander Garber"
tags: []
---

<div dir="ltr" style="text-align: left;" trbidi="on">My script relies on a single argument in the form $stdin user input:<br><br>
        <pre class="brush:ruby">class Project<br>  def initialize()<br>    puts "What do you want to call this project?\n"<br>    print "&gt; "<br><br>    $user_input = $stdin.gets.chomp<br><br></pre>
<br>The script is organised into
        a single class that contains consecutive methods.<br><br>The simplest way I have found to utilise the user input is to declare it in each method.<br><br>
        <pre brush:ruby="" class="">  def define_folders()<br>    project_name = $user_input<br></pre>
<br><br>
        <pre class="brush:ruby">  def create_gemfile()<br>    project_name = $user_input<br></pre>
<br>However, this is repetitive.<br><br>What would be a better way?<br><br>
        <div class="separator" style="clear: both; text-align: center;"><a href="https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/WMF-Agora-Input_settings-question.svg/2000px-WMF-Agora-Input_settings-question.svg.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="294" src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/WMF-Agora-Input_settings-question.svg/2000px-WMF-Agora-Input_settings-question.svg.png" width="320"></a></div>
<br>
</div>