#!/usr/bin/env io
"Guess a random number from 1-100. You have 10 tries!" println

randomNumber := Random value(1, 100) floor
randomNumber println

i := 0
guess := 0
while(i < 10 and guess != randomNumber,
  "(" .. i+1 .. "/10)> " print
  guess = ReadLine readLine
  guess = if(guess asNumber isNan, 0, guess asNumber)
  if(guess > randomNumber, "Too high", println)
  if(guess < randomNumber, "Too low", println)
  i = i + 1
)

if(guess == randomNumber, "Correct!" println, "Too bad.." println)

