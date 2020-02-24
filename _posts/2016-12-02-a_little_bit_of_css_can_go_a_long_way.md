---
layout: post
title: "A Little Bit of CSS Can Go A Long Way"
date: "2016-12-02"
author: "Alexander Garber"
tags: []
---

<div dir="ltr" style="text-align: left;" trbidi="on">
      <div class="separator" style="clear: both; text-align: center;"><a href="https://4.bp.blogspot.com/-k0pYYCz26dc/WEEB0ac_sHI/AAAAAAAAKgw/fBoqVnfhKiw6ONVOmjCY_Dnk6PS9L06lQCLcB/s1600/PHOTO_20161129_093947.jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="180" src="https://4.bp.blogspot.com/-k0pYYCz26dc/WEEB0ac_sHI/AAAAAAAAKgw/fBoqVnfhKiw6ONVOmjCY_Dnk6PS9L06lQCLcB/s320/PHOTO_20161129_093947.jpg" width="320"></a></div>
<br><br>These days, I have the luxury to take
      myself off to the beach in the morning, and if the sun comes out it makes for a pretty photograph.<br><br>By default, the background image on Blogger will tile if you're on a bigger screen, but no self-respecting developer could allow such
      an allow state of affairs to persist.<br><br>Feel free to use the image linked: it's a photo from Mordialloc Beach in Melbourne.<br>
      <h2 style="text-align: left;">Templates &gt;&gt; Advanced &gt;&gt;  Add CSS</h2>
      <pre class="brush:css"><br>html, body {<br><br>background: url(//3.bp.blogspot.com/-eefhuf88EX0/WED_XTYrP2I/AAAAAAAAKgo/GVOL8FHxtT4NBvVMaUUNELXXBaWAkCQDACK4B/w1200/PHOTO_20161129_093947.jpg) no-repeat center center fixed;<br><br>-webkit-background-size: cover;<br><br>-moz-background-size: cover;<br><br>-o-background-size: cover;<br><br>background-size: cover;<br><br>}</pre>
    </div>