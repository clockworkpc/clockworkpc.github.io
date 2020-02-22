---
layout: post
title: "From Pastebin to Gist: Not So Fast!"
date: "2016-12-02"
author: "Alexander Garber"
tags: []
---

I published my first paste on Pastebin five years ago (at the time of writing), and Pastebin has been very good to me ever since, but it's time to migrate my data to Gist on Github.I looked around for an automated migration solution, but couldn't find any.Then I thought about copying and pasting all my pastes, but that's stupid, laborious work, and no self-respecting programmer would do something so repetitious.So what's the clever solution?The following headers are the skeleton of my plan.  I will update this post as I progress.Part One: Get the raw pastes from PastebinPastebin APIPastebin has a scraping API and a developer's API which costs a lifetime membership.  At the time of writing there is a big discount on lifetime membership, so I bit the bullet and got it.  The practice it gives me will be more than a decent ROI.Construct the Query, in RubyAll the sample scripts are given in PHP, but there must be a way to do it in Ruby, or failing that, in JavaScript.Execute the QueryPart Two: Upload the raw pastes as separate GistsGithub APIConstruct the Script, in Ruby Execute the Script