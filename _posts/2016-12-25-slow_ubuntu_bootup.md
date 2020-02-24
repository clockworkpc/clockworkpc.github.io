---
layout: post
title: "Slow Ubuntu Bootup"
date: "2016-12-25"
author: "Alexander Garber"
tags: []
---

<div dir="ltr" style="text-align: left;" trbidi="on">Bootup was being extended by 90 seconds with this message:<br>
        <blockquote class="tr_bq">A start job is running for disk...</blockquote> After consulting the help forums, I checked Gparted:<br><br>
        <div class="separator" style="clear: both; text-align: center;"><a href="https://1.bp.blogspot.com/-a8mRONKmfWM/WF8b1H5pHQI/AAAAAAAALrw/zkq9RZrDqqgk4NuDp9tqcuoiS3TLB1scwCLcB/s1600/gparted.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="218" src="https://1.bp.blogspot.com/-a8mRONKmfWM/WF8b1H5pHQI/AAAAAAAALrw/zkq9RZrDqqgk4NuDp9tqcuoiS3TLB1scwCLcB/s320/gparted.png" width="320"></a></div>
<br>And found an empty partition where I expected to find a
        swap partition.<br><br>Then, I checked /etc/fstab and, yes, found that it expected a swap partition.<br><br>
        <div class="separator" style="clear: both; text-align: center;"><a href="https://1.bp.blogspot.com/-CzVXW0OaYcY/WF8b1IIEJyI/AAAAAAAALrs/MPdfOx6SoqsmDN1rw-gTMQdKHPyXOpE7QCLcB/s1600/fstab.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="248" src="https://1.bp.blogspot.com/-CzVXW0OaYcY/WF8b1IIEJyI/AAAAAAAALrs/MPdfOx6SoqsmDN1rw-gTMQdKHPyXOpE7QCLcB/s320/fstab.png" width="320"></a></div>
<br><br>So I created a swap partition.  We'll see how
        how we go.<br><br>
        <div class="separator" style="clear: both; text-align: center;"><a href="https://3.bp.blogspot.com/-opK9dXp_ebw/WF8cn06r03I/AAAAAAAALr4/p2wk4aqYJywnRXzt16Hg-62Csw9cbbF0gCLcB/s1600/Screenshot%2Bfrom%2B2016-12-25%2B12-10-40.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="218" src="https://3.bp.blogspot.com/-opK9dXp_ebw/WF8cn06r03I/AAAAAAAALr4/p2wk4aqYJywnRXzt16Hg-62Csw9cbbF0gCLcB/s320/Screenshot%2Bfrom%2B2016-12-25%2B12-10-40.png" width="320"></a></div>
        <div class="separator" style="clear: both; text-align: center;"><br></div>
      </div>