---
layout: post
title: "Creating a City Grid with Negative Axis Values"
date: "2017-03-06"
author: "Alexander Garber"
tags: []
---

From the Toy Robot solution by Ryan Bigg, I learned how to create a table starting at 0,0 in the bottom left corner, which has valid positive coördinates only: However, for the solution of Day 1 of Advent of Code, I had to make a modification.  I don't know how big the city grid needs to be, nor whither the explorer will be taken by the directions.The most practicable solution is to place the explorer right in the heart of the city, but that can be achieved in one of two ways:Positive Values Only:Create a city axis that runs (0..latitude) west-to-east and (0..longitude) south-to-north.Place the explorer at the coördinates (latitude / 2), (longitude / 2)Positive and Negative ValuesCreate a city axis that runs (-|latitude| .. latitude) west-to-east and (-|longitude| .. longitude) south-to-north.Place the explorer at coördinates (0,0)I opted for the latter, as the first option would could give me awkward starting coördinates such as (250.5, 250.5) if the city grid were initialised with odd numbers. (501, 501)Also, it seems neater to me that west and south should be negative integer values, east and north positive.So here it is: