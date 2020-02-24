---
layout: post
title: "Using 'relative_require' to separate functions, classes, instantiation"
date: "2016-12-24"
author: "Alexander Garber"
tags: []
---

<div dir="ltr" style="text-align: left;" trbidi="on">My goal is to create a main.rb file that does nothing but instantiate the classes and execute their methods.  As you can see below, this is possible, at least in a simple application,
        but is this good practice?<br><br>It feels neater to separate classes, functions, etc; but then again, this might be akin to separating vocabulary sheets by parts of speech -- tidy, but impracticable.<br><br>It might be better
        practice to group blocks of code that work on the same portion of the program.  Please let me know what works in your experience. <br><br>A simple function:<br><br>
        <pre class="brush:ruby">## demo_function.rb<br><br>def hello_world()<br>  puts "Hello world!"<br>end<br></pre>
<br>A class that uses this function as a method:<br><br>
        <pre class="brush:ruby">## demo_class.rb<br><br>require_relative 'demo_function.rb'<br><br>class Demo<br>  def enter()<br>    hello_world()<br>  end<br>end<br></pre>
<br>Finally, an instance of the class that executes its
        method:<br><br>
        <pre class="brush:ruby">## demo_main.rb<br>require_relative 'demo_class'<br><br>a_class = Demo.new()<br>a_class.enter()<br></pre>
<br>Output:<br><br>
        <pre class="brush:plain">Hello World! </pre>
        <div dir="ltr" style="text-align: left;" trbidi="on">
<br>
          <div class="separator" style="clear: both; text-align: center;"><a href="https://3.bp.blogspot.com/-KZDDiTuWL-A/WF3-70mJZSI/AAAAAAAALoQ/4OH-GgwwzF4TWRnGclbs87OB4Xh3QrvTQCPcB/s1600/relative_require.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="149" src="https://3.bp.blogspot.com/-KZDDiTuWL-A/WF3-70mJZSI/AAAAAAAALoQ/4OH-GgwwzF4TWRnGclbs87OB4Xh3QrvTQCPcB/s320/relative_require.png" width="320"></a></div>
<br>
        </div>
      </div>