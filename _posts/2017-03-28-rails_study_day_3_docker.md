---
layout: post
title: "Rails Study, Day 3: Docker"
date: "2017-03-28"
author: "Alexander Garber"
tags: []
---

<div dir="ltr" style="text-align: left;" trbidi="on">
          <div class="separator" style="clear: both; text-align: center;"><a href="https://4.bp.blogspot.com/-OCf7x2MoMkQ/WNm5VfYAYPI/AAAAAAAAQRU/uCDulouyiWMQAUWvYS1yR4pjnKX5jNyZACPcB/s1600/docker-100275159-orig.jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="282" src="https://4.bp.blogspot.com/-OCf7x2MoMkQ/WNm5VfYAYPI/AAAAAAAAQRU/uCDulouyiWMQAUWvYS1yR4pjnKX5jNyZACPcB/s320/docker-100275159-orig.jpg" width="320"></a></div>
<br><br>As I want my development
          environment to mirror Heroku's settings as closely as possible, I decided to see what the Heroku website itself has to say on the matter.<br><br>My inclination was to keep it simple by using Vagrant, but Heroku's Cedar stack is
          available as a <a href="https://hub.docker.com/r/heroku/cedar/" target="_blank">Docker image</a>, so I will go with Docker instead.  I've been meaning to familiarise myself with Docker for a while, so this works for me.<br><br>Official <a href="https://gist.github.com/botchagalupe/53695f50eebbd3eaa9aa" target="_blank">Notes</a> for Docker are available from Gist.<br><br>This videos helps to demystify Docker.<br><br>
          <div class="separator" style="clear: both; text-align: center;"><iframe allowfullscreen="" class="YOUTUBE-iframe-video" data-thumbnail-src="https://i.ytimg.com/vi/pGYAg7TMmp0/0.jpg" frameborder="0" height="266" src="https://www.youtube.com/embed/pGYAg7TMmp0?feature=player_embedded" width="320"></iframe></div>
<br><br><br>Steps followed:<br><br>
          <ol style="text-align: left;">
            <li>Install Docker on my host machine.</li>
            <li> Buy a Droplet</li>
            <li>Follow the <a href="https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04" target="_blank">Digital Ocean tutorial</a>
</li>
          </ol>
        </div>