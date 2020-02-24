---
layout: post
title: "Rails Study, Day 4: Docker and Vagrant"
date: "2017-03-29"
author: "Alexander Garber"
tags: []
---

<div dir="ltr" style="text-align: left;" trbidi="on">
          <div class="separator" style="clear: both; text-align: center;"><a href="https://4.bp.blogspot.com/-OCf7x2MoMkQ/WNm5VfYAYPI/AAAAAAAAQRU/uCDulouyiWMQAUWvYS1yR4pjnKX5jNyZACPcB/s1600/docker-100275159-orig.jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="282" src="https://4.bp.blogspot.com/-OCf7x2MoMkQ/WNm5VfYAYPI/AAAAAAAAQRU/uCDulouyiWMQAUWvYS1yR4pjnKX5jNyZACPcB/s320/docker-100275159-orig.jpg" width="320"></a></div>
<br>I came for Rails, I'm working on DevOps.<br><br>The
          purpose of this post is to give an account of setting up my development environment in order to study Ruby on Rails.<br><br>I am already familiar with Vagrant, and initially thought I would spin an Ubuntu 16.04 box and work in that.
           However, the obvious and numerous disadvantages of working in a virtual machine on a local hard drive demanded that I find something better.<br><br>So I decided to finally invest some time on Docker, and I have to say, once I
          wrapped my head around the concept of containers, getting started seems fairly straightforward.<br><br>
          <h2 style="text-align: left;">Initial Steps:</h2>
          <ol style="text-align: left;">
            <li>Install Vagrant on my host</li>
            <li>Install Docker on my host</li>
            <li>Spin up an Ubuntu box in Vagrant</li>
            <li>Install Docker on my VM</li>
            <li>Create an account on Docker Hub</li>
            <li>Download the Heroku Cedar 16 image</li>
            <li>Create a private docker repository on my host</li>
            <li>Run the Heroku Docker image</li>
            <li>Push a modified Docker image to my own repository</li>
            <li>Pull the modified Docker image to my VM</li>
          </ol>
          <div>And so forth.</div>
<br><br>As I want my development environment to mirror Heroku's settings as closely as possible, I decided to see what the Heroku website itself has to say on the matter.<br><br>My inclination was to keep it
          simple by using Vagrant, but Heroku's Cedar stack is available as a <a href="https://hub.docker.com/r/heroku/cedar/" target="_blank">Docker image</a>, so I will go with Docker instead.  I've been meaning to familiarise myself with
          Docker for a while, so this works for me.<br><br>Official <a href="https://gist.github.com/botchagalupe/53695f50eebbd3eaa9aa" target="_blank">Notes</a> for Docker are available from Gist.<br><br>This videos helps to
          demystify Docker.<br><br>
          <div class="separator" style="clear: both; text-align: center;"><iframe allowfullscreen="" class="YOUTUBE-iframe-video" data-thumbnail-src="https://i.ytimg.com/vi/pGYAg7TMmp0/0.jpg" frameborder="0" height="266" src="https://www.youtube.com/embed/pGYAg7TMmp0?feature=player_embedded" width="320"></iframe></div>
<br><br>
          <div>I'm now looking into simplifying it further and using a Droplet from Digital Ocean.</div>
        </div>