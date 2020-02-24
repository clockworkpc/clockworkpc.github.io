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
