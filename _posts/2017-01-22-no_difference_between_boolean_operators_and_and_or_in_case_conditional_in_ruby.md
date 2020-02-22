---
layout: post
title: "No Difference Between Boolean Operators AND and OR in Case Conditional in Ruby"
date: "2017-01-22"
author: "Alexander Garber"
tags: []
---

I can't see a practical difference between the boolean operators AND and OR in a Ruby case conditional.For example, I want to get the user to input the sentence:sudo make me a sandwichAnd the case conditional starts as follows:case user_selectionwhen /sudo/ && /sandwich/However, if the user enters:make me a sandwichThe condition will be a satisfied.My way around it in this instance is to re-order the conditions:case user_selectionwhen /sandwich/ && /sudo/But that pre-supposes that every time a user thinks to use "sudo" he will include the string "sandwich" in his response.  However, this is functionally no different from this:case user_selectionwhen /sudo/I looked up boolean operators for Ruby conditionals, but have not found a satisfactory answer.