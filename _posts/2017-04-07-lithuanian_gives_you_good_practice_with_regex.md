---
layout: post
title: "Lithuanian gives you good practice with regex"
date: "2017-04-07"
author: "Alexander Garber"
tags: []
---

<div dir="ltr" style="text-align: left;" trbidi="on">I'm parsing Lithuanian verbs, and in tidying up the raw HTML, I'm compelled to come up with little beauties like this:<br><br>&lt;a href="\/[a-z]*\/[a-z]*\W*[a-z]*\W*[a-z]*"&gt;<br><br>...in
          order to to clear away the HTML formatting.<br><br>The problem lies in the fact that Lithuanian diacritics (č, ž, ė, ę and so on) are not recognised as letters [a-z] but rather as non-word characters \W.<br><br>
          <div class="separator" style="clear: both; text-align: center;"><a href="https://3.bp.blogspot.com/-UQB1qeOxINg/WOba4UGag_I/AAAAAAAAQuw/VIOqJjIy1zMipw1zXZU8uIr9qORyuDLAwCPcB/s1600/hack-like-pro-introduction-regular-expressions-regex.1280x600.jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="150" src="https://3.bp.blogspot.com/-UQB1qeOxINg/WOba4UGag_I/AAAAAAAAQuw/VIOqJjIy1zMipw1zXZU8uIr9qORyuDLAwCPcB/s320/hack-like-pro-introduction-regular-expressions-regex.1280x600.jpg" width="320"></a></div>
<br>
        </div>