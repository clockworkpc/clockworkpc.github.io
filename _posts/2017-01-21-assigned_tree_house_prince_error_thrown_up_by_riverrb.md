---
layout: post
title: "Assigned [tree-house-prince] Error thrown up by River.rb"
date: "2017-01-21"
author: "Alexander Garber"
tags: []
---

Assigned [tree-house-prince] Error thrown up by River.rb by clockworkpc via GitHub Error being thrown up when I play the game and choose to go from the river to the front door. `require_relative "Scene.rb" class River < Scene # def river_choice(user_selection.to_s) # # # end def river_choice(user_selection) @scene_options = { 'live' => 'front_door', 'die' => 'death' } case user_selection.to_s when /1/, /tree/, /house/ puts "You go to the tree house." return 'front_door' @scene_option = 'live' when /2/, /river/ puts "You wade into the river." puts "The strong current pulls you under and you drown." @scene_option = 'die' return 'death' else puts "That does not compute." end end def enter() puts """ You go to the river bank. You feel rather thirsty and decide to have a drink. As you take a few handfuls of fresh water, you realise that the river current is very strong. It would be extremely dangerous to wade into the water. Your thirst quenched, you stand back up and look around. The eclectic tree house is in the centre of the meadow. The river is in front of you. What do you do? 1. Go to the tree house. 2. Wade into the river. """ print "> " user_selection = $stdin.gets.chomp.downcase() river_choice(user_selection) case @scene_option when 'live' return 'front_door' when 'die' return 'death' else puts "Something clearly has gone wrong." end end end `