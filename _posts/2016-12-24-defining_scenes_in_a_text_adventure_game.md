---
layout: post
title: "Defining Scenes in a Text Adventure Game"
date: "2016-12-24"
author: "Alexander Garber"
tags: []
---

<div dir="ltr" style="text-align: left;" trbidi="on">In my text adventure game, the user starts outside in meadow, and eventually gets inside a six-storey tree castle with a staircase that runs from the ground floor to the fifth.<br><br>Here
        is a map of the world:<br><br>
        <div class="separator" style="clear: both; text-align: center;"><a href="https://4.bp.blogspot.com/-1OAlkDNepEs/WF478vPEY5I/AAAAAAAALo0/hxnxJ5eJPKMBI3Wn7uE_I8bwpy3pE1LfgCLcB/s1600/Scenes_Diagram.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="320" src="https://4.bp.blogspot.com/-1OAlkDNepEs/WF478vPEY5I/AAAAAAAALo0/hxnxJ5eJPKMBI3Wn7uE_I8bwpy3pE1LfgCLcB/s320/Scenes_Diagram.png" width="270"></a></div>
<br>
        <div class="separator" style="clear: both; text-align: center;"></div>The scene of greatest interest here is the Staircase, for it is actually not a scene at all, but rather a method within the HouseScene subclass of Scene.  That is,
        the user can leave any room and go back to the landing of the staircase on the floor of that room.<br><br>For example, the bedroom is on the fourth floor, and if the user elects to leave the bedroom, she will return to the fourth floor
        landing of the staircase.
      </div>