---
layout: post
title: "From Pastebin to Gist: Not So Fast!"
date: "2016-12-02"
author: "Alexander Garber"
tags: [pastbin, gist]
---

<div dir="ltr" style="text-align: left;" trbidi="on">
  <div class="separator" style="clear: both; text-align: center;"><a href="https://3.bp.blogspot.com/-qsqGvxuiR8k/WEDzEsJzVzI/AAAAAAAAKfg/CQ9BSqyJpR4UVqr5yOB9r-8Mb4obnBQbwCPcB/s1600/gist_github.jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
        border="0" height="200" src="https://3.bp.blogspot.com/-qsqGvxuiR8k/WEDzEsJzVzI/AAAAAAAAKfg/CQ9BSqyJpR4UVqr5yOB9r-8Mb4obnBQbwCPcB/s320/gist_github.jpg" width="320" /></a></div><br />I published my <a href="http://pastebin.com/u/clockworkpc"
    target="_blank">first paste on Pastebin</a> five years ago (at the time of writing), and Pastebin has been very good to me ever since, but it's time to migrate my data to <a href="https://gist.github.com/clockworkpc" target="_blank">Gist on
    Github</a>.<br /><br />I looked around for an automated migration solution, but couldn't find any.<br /><br />Then I thought about copying and pasting all my pastes, but that's stupid, laborious work, and no self-respecting programmer would
  do something so repetitious.<br /><br />So what's the clever solution?<br /><br />The following headers are the skeleton of my plan. &nbsp;I will update this post as I progress.<br />
  <h2 style="text-align: left;">Part One: Get the raw pastes from Pastebin</h2>
  <h3 style="text-align: left;">Pastebin API</h3>
  <div>Pastebin has a <a href="http://pastebin.com/api_scraping_faq" target="_blank">scraping API</a>&nbsp;and a <a href="http://pastebin.com/api" target="_blank">developer's API</a>&nbsp;which costs a lifetime membership. &nbsp;At the time of
    writing there is a big discount on lifetime membership, so I bit the bullet and got it. &nbsp;The practice it gives me will be more than a decent ROI.</div>
  <h3 style="text-align: left;">Construct the Query, in Ruby</h3>
  <div>All the sample scripts are given in PHP, but there must be a way to do it in Ruby, or failing that, in JavaScript.</div>
  <h3 style="text-align: left;">Execute the Query</h3>
  <h2 style="text-align: left;">Part Two: Upload the raw pastes as separate Gists</h2>
  <h3 style="text-align: left;">Github API</h3>
  <h3 style="text-align: left;">Construct the Script, in Ruby&nbsp;</h3>
  <h3 style="text-align: left;">Execute the Script</h3>
  <div><br /></div>
</div>
