---
layout: post
title: "Note to Self about Modules in Ruby"
date: "2016-12-24"
author: "Alexander Garber"
tags: []
---

<div dir="ltr" style="text-align: left;" trbidi="on">Make sure to include the name of the module in the method:<br><br>
        <pre class="brush:ruby">module GameDictionary<br><br>  def <u>GameDictionary</u>.scene_enter()<br>    puts "This scene is not yet configured. Subclass it and implement enter()."<br>    exit(1)<br>  end<br></pre>
<br>Everything
        else is rather straightforward, but for some reason I keep on missing that detail.  I'll just keep on drilling it until it sinks in.<br><br>In other words, I'll keep on crashing until I learn how to fly this damn aeroplane :)<br><br>
        <div class="separator" style="clear: both; text-align: center;"><a href="https://upload.wikimedia.org/wikipedia/en/c/c0/DC10Checklist.jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="216" src="https://upload.wikimedia.org/wikipedia/en/c/c0/DC10Checklist.jpg" width="320"></a></div>
<br>
</div>