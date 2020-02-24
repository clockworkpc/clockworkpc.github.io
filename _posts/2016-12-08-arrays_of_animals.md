---
layout: post
title: "Arrays of Animals"
date: "2016-12-08"
author: "Alexander Garber"
tags: [ruby, code, study]
---

<div dir="ltr" style="text-align: left;" trbidi="on">
  <div dir="ltr" style="text-align: left;" trbidi="on">From Exercise 34 of Learn Ruby the Hard Way. &nbsp;I am sure this could be done a lot more elegantly, but I'm satisfied with what I got from this, and I know it works too.</div>
  <pre class="brush:ruby; gutter: false;"># everything pertaining to the quiz is contained in the function below<br /><br />def quiz<br /><br />  # clear the screen<br />  puts "\e[H\e[2J"<br /><br />  # gem for colorising text, very cool stuff<br />  require 'colorize'<br /><br />  # the array of animals<br />  animals = ['bear', 'ruby', 'peacock', 'kangaroo', 'whale', 'platypus']<br /><br />  # display the list of animals, it's not a memory test<br />  puts "These are the animals in our array: #{animals}"<br /><br />  # preparing the ordinal and cardinal arrays for the quiz<br />  ordinal = ["first", "second", "third", "fourth", "fifth", "sixth"]<br />  cardinal = [0, 1, 2, 3, 4, 5]<br /><br />  # generic question for choosing the ordinal position<br />  chooseOrdinal = """<br />  What is the ordinal position of this animal?<br />  first<br />  second<br />  third<br />  fourth<br />  fifth<br />  sixth<br /><br /><br />  """<br /><br />  # generic question for choosing the cardinal position<br />  chooseCardinal = """<br />  What is the cardinal position of this animal?<br />  0<br />  1<br />  2<br />  3<br />  4<br />  5<br /><br /><br />  """<br /><br />  puts """<br />  Type the name of an animal:<br />  - bear<br />  - ruby<br />  - peacock<br />  - kangaroo<br />  - whale<br />  - platypus<br /><br />  """<br />  print "&gt; "<br /><br />  userSelection = $stdin.gets.chomp.downcase<br />  case userSelection<br />  when "#{animals[0]}"<br />    puts "You chose a #{userSelection}.\n"<br />    puts chooseOrdinal<br />    answerOrdinal = $stdin.gets.chomp.downcase<br />    if answerOrdinal == "#{ordinal[0]}"<br />      puts "Correct!\n".colorize(:green)<br />      puts chooseCardinal<br />    print "&gt; "<br />      answerCardinal = $stdin.gets.chomp<br />      if answerCardinal == "#{cardinal[0]}"<br />        puts "Correct!\n".colorize(:green)<br />      else<br />        puts "Incorrect cardinal number!".colorize(:red)<br />      end<br />    else<br />      puts "Incorrect ordinal number!".colorize(:red)<br />    end<br />  when "#{animals[1]}"<br />    puts "You chose a #{userSelection}."<br />    puts chooseOrdinal<br />    answerOrdinal = $stdin.gets.chomp.downcase<br />    if answerOrdinal == "#{ordinal[1]}"<br />      puts "Correct!\n".colorize(:green)<br />      puts chooseCardinal<br />    print "&gt; "<br />      answerCardinal = $stdin.gets.chomp<br />      if answerCardinal == "#{cardinal[1]}"<br />        puts "Correct!".colorize(:green)<br />      else<br />        puts "Incorrect cardinal number!".colorize(:red)<br />      end<br />    else<br />      puts "Incorrect ordinal number!"<br />    end<br />  when "#{animals[2]}"<br />    puts "You chose a #{userSelection}."<br />    puts chooseOrdinal<br />    answerOrdinal = $stdin.gets.chomp.downcase<br />    if answerOrdinal == "#{ordinal[2]}"<br />      puts "Correct!\n".colorize(:green)<br />      puts chooseCardinal<br />    print "&gt; "<br />      answerCardinal = $stdin.gets.chomp<br />      if answerCardinal == "#{cardinal[2]}"<br />        puts "Correct!".colorize(:green)<br />      else<br />        puts "Incorrect cardinal number!".colorize(:red)<br />      end<br />    else<br />      puts "Incorrect ordinal number!"<br />    end<br />  when "#{animals[3]}"<br />    puts "You chose a #{userSelection}."<br />    puts chooseOrdinal<br />    answerOrdinal = $stdin.gets.chomp.downcase<br />    if answerOrdinal == "#{ordinal[3]}"<br />      puts "Correct!\n".colorize(:green)<br />      puts chooseCardinal<br />    print "&gt; "<br />      answerCardinal = $stdin.gets.chomp<br />      if answerCardinal == "#{cardinal[3]}"<br />        puts "Correct!".colorize(:green)<br />      else<br />        puts "Incorrect cardinal number!".colorize(:red)<br />      end<br />    else<br />      puts "Incorrect ordinal number!"<br />    end<br />  when "#{animals[4]}"<br />    puts "You chose a #{userSelection}."<br />    puts chooseOrdinal<br />    answerOrdinal = $stdin.gets.chomp.downcase<br />    if answerOrdinal == "#{ordinal[4]}"<br />      puts "Correct!\n".colorize(:green)<br />      puts chooseCardinal<br />    print "&gt; "<br />      answerCardinal = $stdin.gets.chomp<br />      if answerCardinal == "#{cardinal[4]}"<br />        puts "Correct!".colorize(:green)<br />      else<br />        puts "Incorrect cardinal number!".colorize(:red)<br />      end<br />    else<br />      puts "Incorrect ordinal number!"<br />    end<br />  when "#{animals[5]}"<br />    puts "You chose a #{userSelection}."<br />    puts chooseOrdinal<br />    answerOrdinal = $stdin.gets.chomp.downcase<br />    if answerOrdinal == "#{ordinal[5]}"<br />      puts "Correct!\n".colorize(:green)<br />      puts chooseCardinal<br />    print "&gt; "<br />      answerCardinal = $stdin.gets.chomp<br />      if answerCardinal == "#{cardinal[5]}"<br />        puts "Correct!".colorize(:green)<br />      else<br />        puts "Incorrect cardinal number!".colorize(:red)<br />      end<br />    else<br />      puts "Incorrect ordinal number!".colorize(:red)<br />    end<br />  else<br />    puts "I know no such animal."<br />  end<br /><br />end<br /><br />quiz()<br /><br /></pre>
</div>

## Update (2020-02-24)

I lightly refactored the code.

```ruby
# gem for colorising text, very cool stuff
require 'colorize'

def animals
  ['bear', 'ruby', 'peacock', 'kangaroo', 'whale', 'platypus']
end

def cardinal
  (0... animals.length).to_a
end

def ordinal
  # TODO: Find a gem that converts integers into ordinal numbers
  ["first", "second", "third", "fourth", "fifth", "sixth"]
end

def selection_prompt(str_ary)
  str_ary.each { |str| puts "- #{str}" }
  puts ""
  print "> "
end

def animal_selection_prompt
  puts "These are the animals in our array: #{animals}"
  puts "Type the name of an animal:\n"
  selection_prompt(animals)
end

def cardinal_selection_prompt
  puts "What is the cardinal position of this animal?"
  selection_prompt(cardinal)
end

def ordinal_selection_prompt
  puts "What is the ordinal position of this animal?"
  selection_prompt(ordinal)
end

def select_animal(animal_input_str)
  animal_name_str = animal_input_str
  animal_index_int = animals.index(animal_name_str)
  animal_position_str = ordinal[animal_index_int]

  {
    animal_name: animal_name_str,
    animal_index: animal_index_int,
    animal_position: animal_position_str
  }
end

def select_cardinal(int, selection_hsh)
  puts "You chose a #{selection_hsh[:animal_name]}.\n"
  if int == selection_hsh[:animal_index]
    puts "Correct!\n".colorize(:green)
  else
    puts "Incorrect cardinal number!".colorize(:red)
  end
end

def select_ordinal(str, selection_hsh)
  if str.eql?(selection_hsh[:animal_position])
    puts "Correct!\n".colorize(:green)
  else
    puts "Incorrect ordinal number!".colorize(:red)
  end
end

def quiz
  # clear the screen
  puts "\e[H\e[2J"

  animal_selection_prompt
  user_selection = $stdin.gets.chomp.downcase
  selection_hsh = select_animal(user_selection)
  puts "You chose a #{selection_hsh[:animal_name]}.\n"

  cardinal_selection_prompt
  animal_index_int = $stdin.gets.chomp.to_i
  select_cardinal(animal_index_int, selection_hsh)

  ordinal_selection_prompt
  animal_position_str = $stdin.gets.chomp.downcase
  select_ordinal(animal_position_str, selection_hsh)
end

quiz()

```
