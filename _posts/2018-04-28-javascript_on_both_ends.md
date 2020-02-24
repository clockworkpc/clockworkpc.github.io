---
layout: post
title: "JavaScript on both ends "
date: "2018-04-28"
author: "Alexander Garber"
tags: []
---

<div dir="ltr" style="text-align: left;" trbidi="on">
          <div xmlns="http://www.w3.org/1999/xhtml">
<a href="https://lh3.googleusercontent.com/-5B6bg56C_js/WuPvmlyg3oI/AAAAAAAAaFM/aFRTgYhFFrkLYgC-oyfvIFFveaRvLIlOQCHMYCw/s2560/%255BUNSET%255D" onblur="try {parent.deselectBloggerImageGracefully();} catch(e) {}"><img border="0" src="https://lh3.googleusercontent.com/-5B6bg56C_js/WuPvmlyg3oI/AAAAAAAAaFM/aFRTgYhFFrkLYgC-oyfvIFFveaRvLIlOQCHMYCw/s640/%255BUNSET%255D" style="cursor: hand; cursor: pointer; display: block; margin: 0px auto 10px; text-align: center;"></a><br><br>After
            4 pomodoros on @AnthonyPAlicea's NodeJS course, Lecture 90, I think I understand how JavaScript code runs on both front and back-end.<br><br>Looking at this code, I can see how the array of JavaScript objects is declared on the
            server (/app.js), then passed on to the view (/views/index.ejs), converted to a JSON string, is made available to the AngularJS controller, which then manipulates the JSON object in the client.<br><br>As I go through the code line by
            line, I ask myself continually:<br><br><i>Where does the program get this from?</i><br><i>Where is the variable declared?</i><br><i>How does this part of the program have access to it?</i><br><br>In this way, I can always
            see, piece by piece, how it all fits together.<br><br>Unless of course I'm using Rails, in which case one must have faith in its sugary magic.</div>
        </div>