# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game
    number_to_guess = rand(1...100)

    guess = nil
    guess_count = 0

    puts "Guess a number between 1 and 100 "

    until guess == number_to_guess
        guess = gets.chomp.to_i
        guess_count += 1
        check(guess, number_to_guess, guess_count)
    end

end

def check(guess, number_to_guess, guess_count)
    if guess > number_to_guess
        puts "You guessed #{guess} which is too high, try again"
    elsif guess < number_to_guess
        puts "You guessed #{guess} which is too low, try again"
    elsif guess == number_to_guess
        puts "You guessed correctly, well done! It took you #{guess_count} guesses to try #{number_to_guess}"
    else
        puts "Your response is not a valid guess"
    end
end