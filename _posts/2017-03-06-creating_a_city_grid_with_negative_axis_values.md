---
layout: post
title: "Creating a City Grid with Negative Axis Values"
date: "2017-03-06"
author: "Alexander Garber"
tags: []
---

<div dir="ltr" style="text-align: left;" trbidi="on">
          <div class="separator" style="clear: both; text-align: center;"><a href="https://4.bp.blogspot.com/-ushE9SvmfqM/WLzGcJ1va4I/AAAAAAAAPTA/8pyRuy0wwIgOXOOhhupzFeAn3Esdvm-qgCPcB/s1600/ISS-35_Phoenix%252C_Arizona_area.jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="213" src="https://4.bp.blogspot.com/-ushE9SvmfqM/WLzGcJ1va4I/AAAAAAAAPTA/8pyRuy0wwIgOXOOhhupzFeAn3Esdvm-qgCPcB/s320/ISS-35_Phoenix%252C_Arizona_area.jpg" width="320"></a></div>
<br><br>From the <a href="https://leanpub.com/toyrobot/" target="_blank">Toy Robot solution by Ryan Bigg</a>, I learned how to create a table starting at 0,0 in the bottom left corner, which has valid positive coördinates only:<br><br>
          <script src="//gistfy-app.herokuapp.com/github/gist/ff1b9721b4b3c3f34195ad0d0a69fee4?lang=ruby&amp;style=monokai_sublime" type="text/javascript"></script> <br>However, for the solution of Day 1 of <a href="http://adventofcode.com/2016/day/1" target="_blank">Advent of Code</a>, I had to make a modification.  I don't know how big the city grid needs to be, nor whither the explorer will be taken by the directions.<br><br>The most practicable solution is to place the
          explorer right in the heart of the city, but that can be achieved in one of two ways:<br><br>Positive Values Only:<br>
          <ol style="text-align: left;">
            <li>Create a city axis that runs (0..latitude) west-to-east and (0..longitude) south-to-north.</li>
            <li>Place the explorer at the coördinates (latitude / 2), (longitude / 2)</li>
          </ol>
          <div>Positive and Negative Values</div>
          <div>
            <ol style="text-align: left;">
              <li>Create a city axis that runs (-|latitude| .. latitude) west-to-east and (-|longitude| .. longitude) south-to-north.</li>
              <li>Place the explorer at coördinates (0,0)</li>
            </ol>
            <div>I opted for the latter, as the first option would could give me awkward starting coördinates such as (250.5, 250.5) if the city grid were initialised with odd numbers. (501, 501)</div>
          </div>
          <div><br></div>
          <div>Also, it seems neater to me that west and south should be negative integer values, east and north positive.</div>
          <div><br></div>
          <div>So here it is:</div>
          <div><br></div>
          <div>
            <script src="//gistfy-app.herokuapp.com/github/gist/c0a27f167dd5a696dcbc443854fff628?lang=ruby&amp;style=monokai_sublime" type="text/javascript"></script>
          </div>
          <div><br></div>
        </div>