---
layout: post
title: "Lithuanian gives you good practice with regex"
date: "2017-04-07"
author: "Alexander Garber"
tags: []
---

I'm parsing Lithuanian verbs, and in tidying up the raw HTML, I'm compelled to come up with little beauties like this:<a href="\/[a-z]*\/[a-z]*\W*[a-z]*\W*[a-z]*">...in order to to clear away the HTML formatting.The problem lies in the fact that Lithuanian diacritics (č, ž, ė, ę and so on) are not recognised as letters [a-z] but rather as non-word characters \W.