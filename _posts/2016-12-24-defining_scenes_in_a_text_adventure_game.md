---
layout: post
title: "Defining Scenes in a Text Adventure Game"
date: "2016-12-24"
author: "Alexander Garber"
tags: []
---

In my text adventure game, the user starts outside in meadow, and eventually gets inside a six-storey tree castle with a staircase that runs from the ground floor to the fifth.Here is a map of the world:The scene of greatest interest here is the Staircase, for it is actually not a scene at all, but rather a method within the HouseScene subclass of Scene.  That is, the user can leave any room and go back to the landing of the staircase on the floor of that room.For example, the bedroom is on the fourth floor, and if the user elects to leave the bedroom, she will return to the fourth floor landing of the staircase.