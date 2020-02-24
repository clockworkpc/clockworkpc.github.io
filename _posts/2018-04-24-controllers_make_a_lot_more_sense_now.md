---
layout: post
title: "Controllers make a lot more sense now"
date: "2018-04-24"
author: "Alexander Garber"
tags: []
---

<div dir="ltr" style="text-align: left;" trbidi="on">
          <div dir="ltr" style="text-align: left;" trbidi="on">
            <div class="separator" style="clear: both; text-align: center;"><a href="https://2.bp.blogspot.com/-q87LIW83PFM/Wt531gqxZGI/AAAAAAAAaCk/eQO3XJG2lnQJimo_91zBBxQNgWzuqCItACLcBGAs/s1600/Screenshot%2Bfrom%2B2018-04-24%2B10-18-09.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="390" data-original-width="571" height="218" src="https://2.bp.blogspot.com/-q87LIW83PFM/Wt531gqxZGI/AAAAAAAAaCk/eQO3XJG2lnQJimo_91zBBxQNgWzuqCItACLcBGAs/s320/Screenshot%2Bfrom%2B2018-04-24%2B10-18-09.png" width="320"></a></div>
<br><br>I'm working through Anthony Alicea's "Learn and Understand NodeJS" and Lecture 79 helped me to make sense of the problem that controllers are meant to solve.<br><br><br><br>
            <div>
              <script src="https://gist.github.com/clockworkpc/ab3ae9e9d8ea3da3157edac1560fb0b5.js"></script><noscript>
                <pre><br>var express = require('express');<br>var app = express();<br><br>var htmlController = require("/controllers/htmlController")<br>var apiController = require("/controllers/apiController")<br><br>var port = process.env.PORT || 1337;<br><br>app.use('/assets', express.static(__dirname + '/public'));<br><br>app.set('view engine', 'ejs');<br><br>htmlController(app);<br>apiController(app);<br><br>app.listen(port);<br></pre>
</noscript>
            </div>
          </div>
        </div>