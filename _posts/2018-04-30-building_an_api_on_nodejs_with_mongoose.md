---
layout: post
title: "Building an API on NodeJS with Mongoose"
date: "2018-04-30"
author: "Alexander Garber"
tags: []
---

<div dir="ltr" style="text-align: left;" trbidi="on">
          <div class="separator" style="clear: both; text-align: center;"><a href="https://3.bp.blogspot.com/-DtU1gGmLjc8/WuaQQwmR79I/AAAAAAAAaGE/C2kGA0H7-s8QGDBTaMkxwEUlScQmCP57QCPcBGAYYCw/s1600/IMG_20180430_133729.jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="900" data-original-width="1600" height="180" src="https://3.bp.blogspot.com/-DtU1gGmLjc8/WuaQQwmR79I/AAAAAAAAaGE/C2kGA0H7-s8QGDBTaMkxwEUlScQmCP57QCPcBGAYYCw/s320/IMG_20180430_133729.jpg" width="320"></a></div>
<br>
          <div class="separator" style="clear: both; text-align: center;"><a href="https://2.bp.blogspot.com/-W6RbDYxE-Ts/WuaQR3JO8BI/AAAAAAAAaGI/USD35wcIOaAa_RHtc4GyuPmrB8i1Jsn-gCPcBGAYYCw/s1600/IMG_20180430_133721.jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="900" data-original-width="1600" height="180" src="https://2.bp.blogspot.com/-W6RbDYxE-Ts/WuaQR3JO8BI/AAAAAAAAaGI/USD35wcIOaAa_RHtc4GyuPmrB8i1Jsn-gCPcBGAYYCw/s320/IMG_20180430_133721.jpg" width="320"></a></div>
          <div class="separator" style="clear: both; text-align: center;"><br></div>
          <div class="separator" style="clear: both; text-align: center;"><a href="https://3.bp.blogspot.com/-a5kGzs7pQGQ/WuaQPu1CDmI/AAAAAAAAaGA/iMyEMqKWeRcVhicDjR28DB3wfF1-Ko3gACPcBGAYYCw/s1600/IMG_20180430_133747.jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="900" data-original-width="1600" height="180" src="https://3.bp.blogspot.com/-a5kGzs7pQGQ/WuaQPu1CDmI/AAAAAAAAaGA/iMyEMqKWeRcVhicDjR28DB3wfF1-Ko3gACPcBGAYYCw/s320/IMG_20180430_133747.jpg" width="320"></a></div>
          <div class="separator" style="clear: both; text-align: center;"><br></div>
          <div class="separator" style="clear: both; text-align: center;"><a href="https://1.bp.blogspot.com/-P_M4pFoB83Q/WuaQOO81wLI/AAAAAAAAaF8/ANi7yFI-6aUBxga02QsRzM6AESmtbLKigCPcBGAYYCw/s1600/IMG_20180430_133755.jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="900" data-original-width="1600" height="180" src="https://1.bp.blogspot.com/-P_M4pFoB83Q/WuaQOO81wLI/AAAAAAAAaF8/ANi7yFI-6aUBxga02QsRzM6AESmtbLKigCPcBGAYYCw/s320/IMG_20180430_133755.jpg" width="320"></a></div>
<br>I
          spent a couple more pomodoros than expected, but I cleared up a couple of points of misunderstanding about working with MongoDB.  Prima facie, NoSQL makes sense, and certainly seems more attractive than working with a relational
          database.  I've heard from some people who are more accustomed to working with MySQL and PostgreSQL that MongoDB doesn't scale well, but I don't have enough commercial experience of the two approaches to have an opinion yet.<br><br>I
          find this approach, of writing the code out by hand, is an excellent way of forcing myself to slow down and meditate on the material.  I bear in mind that I save myself time on Stack Overflow in the long run; and at any rate, it makes
          me more self-reliant and better at RT(F)M.
        </div>