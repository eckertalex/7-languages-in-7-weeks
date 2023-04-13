#!/usr/bin/env ruby
# frozen_string_literal: true

random = rand(1..10)
guess = 0

puts 'Guess a number from 1 to 10, exit with "q"'
until guess == random
  print '> '
  input = gets.chomp
  break if input == 'q'

  guess = input.to_i

  if !(1..10).member? guess
    puts 'Please guess a number from 1 to 10, exit wih "q"'
  elsif guess > random
    puts 'Too high'
  elsif guess < random
    puts 'Too low'
  elsif guess == random
    puts 'Correct!'
  end
end
