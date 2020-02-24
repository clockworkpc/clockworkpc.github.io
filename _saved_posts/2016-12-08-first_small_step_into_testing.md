---
layout: post
title: "First Small Step Into Testing"
date: "2016-12-08"
author: "Alexander Garber"
tags: [testing, ruby, code, study]
---

<div dir="ltr" style="text-align: left;" trbidi="on">I am working on Exercise 28 of Learn Ruby the Hard Way and this is my first concrete example of using testing in the course of coding.<br /><br />The exercise is a test of boolean logic: I
  am given a statement e.g.<br /><br />
  <pre class="brush:ruby">true == true<br /></pre><br />And must work out whether it is "true" or "false".<br /><br />As you can see, I have organised the statements in a two-dimensional array in which each sub-array is composed of three
  elements: a string denoting the statement, the statement itself, and my prediction.<br /><br />
  <pre class="brush:ruby"># List of boolean statements to test my knowledge thereof, organised in a two-dimensional array<br />booleanTest = [<br />  ["true &amp;&amp; true", true &amp;&amp; true, true],<br />  ["false &amp;&amp; true", false &amp;&amp; true, false],<br />  ["1 == 1 &amp;&amp; 2 == 1", 1 == 1 &amp;&amp; 2 == 1, false],<br />  ['"test" == "test"', "test" == "test", true],<br />  ["1 == 1 || 2 != 1", 1 == 1 || 2 != 1, true],<br />  ["true &amp;&amp; 1 == 1", true &amp;&amp; 1 == 1, true],<br />  ["false &amp;&amp; 0 != 0", false &amp;&amp; 0 != 0, false],<br />  ["true || 1 == 1", true || 1 == 1, true],<br />  ['"test" == "testing"', "test" == "testing", false],<br />  ["1 != 0 &amp;&amp; 2 == 1", 1 != 0 &amp;&amp; 2 == 1, false],<br />  ['"test" != "testing"', "test" != "testing", true],<br />  ['"test" == 1', "test" == 1, false],<br />  ["!(true &amp;&amp; false)", !(true &amp;&amp; false), true],<br />  ["!(1 == 1 &amp;&amp; 0 != 1)", !(1 == 1 &amp;&amp; 0 != 1), false],<br />  ["!(10 == 1 || 1000 == 1000)", !(10 == 1 || 1000 == 1000), false],<br />  ["!(1 != 10 || 3 == 4)", !(1 != 10 || 3 == 4), true]<br />]<br /></pre>I
  test my prediction by running the following testing loop, and in keeping with the practice of "green" for good and "red" for error, I installed the colorize gem and applied it to the output of the testing loop.<br />
  <pre class="brush:ruby"># Required in order to highlight the text in the testing loop green or red.<br /><br /># Colorize gem to mark the result green or red.<br />require 'colorize'<br /><br /># Testing loop<br />puts "Here are the results of my test:\n\n"<br />booleanTest.each do|description,result,prediction|<br />  puts "PREDICTION: #{description} GIVES #{prediction}, RESULT: #{result}"<br />  if prediction == result<br />    puts "Correct!".colorize(:green)<br />  else<br />    puts "Incorrect!".colorize(:red)<br />  end<br />end<br /><br /></pre>And
  here are the results:<br /><br />
  <div class="separator" style="clear: both; text-align: center;"><a href="https://2.bp.blogspot.com/-Gs-Vus5X8AU/WEipvXJGqUI/AAAAAAAAKs4/OYNnOKXvbLI8wQj01yfYiRoEcVFFdwSCwCLcB/s1600/Screenshot%2Bfrom%2B2016-12-08%2B11-30-20.png" imageanchor="1"
      style="margin-left: 1em; margin-right: 1em;"><img border="0" height="283" src="https://2.bp.blogspot.com/-Gs-Vus5X8AU/WEipvXJGqUI/AAAAAAAAKs4/OYNnOKXvbLI8wQj01yfYiRoEcVFFdwSCwCLcB/s320/Screenshot%2Bfrom%2B2016-12-08%2B11-30-20.png" width="320" /></a></div><br /><br /></div>
