---
layout: post
title: "Surprisingly good video compression in FFmpeg"
date: "2017-05-01"
author: "Alexander Garber"
tags: []
---

I spent many hours over the years feeding my videos through FFmpeg, with sometimes disappointing results when it came to video compression.However, the video I recorded on my old Canon Legria FS200 was 20 minutes long and 1.4GB bit.A simple command reduced it to 97MB: ffmpeg -i morning_squat.MOD morning_squat.mp4I tried specifying a lower bitrate (original about 8548kbps) but that ruined the video, so I just left it out.