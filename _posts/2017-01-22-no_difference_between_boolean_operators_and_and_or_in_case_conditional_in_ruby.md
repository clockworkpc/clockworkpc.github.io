---
layout: post
title: "No Difference Between Boolean Operators AND and OR in Case Conditional in Ruby"
date: "2017-01-22"
author: "Alexander Garber"
tags: []
---

<div dir="ltr" style="text-align: left;" trbidi="on">I can't see a practical difference between the boolean operators AND and OR in a Ruby case conditional.<div><br></div>
        <div>For example, I want to get the user to input the sentence:</div>
        <div><br></div>
        <div>
          <pre class="brush:plain">sudo make me a sandwich</pre>
        </div>
        <div><br></div>
        <div>And the case conditional starts as follows:</div>
        <div><br></div>
        <div>
          <pre class="brush:ruby">case user_selection<br>when /sudo/ &amp;&amp; /sandwich/</pre>
        </div>
        <div><br></div>
        <div>However, if the user enters:</div>
        <div><br></div>
        <div>
          <pre class="brush:ruby">make me a sandwich</pre>
        </div>
        <div><br></div>
        <div>The condition will be a satisfied.</div>
        <div><br></div>
        <div>My way around it in this instance is to re-order the conditions:</div>
        <div><br></div>
        <div>
          <pre class="brush:ruby">case user_selection<br>when /sandwich/ &amp;&amp; /sudo/</pre>
          <div><br></div>
          <div>But that pre-supposes that every time a user thinks to use "sudo" he will include the string "sandwich" in his response.  However, this is functionally no different from this:</div>
          <div><br></div>
          <div>
            <pre class="brush:ruby">case user_selection<br>when /sudo/</pre>
          </div>
<br>
          <div>I looked up boolean operators for Ruby conditionals, but have not found a satisfactory answer.</div>
          <div><br></div>
        </div>
      </div>