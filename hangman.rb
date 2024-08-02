
$random_words = ['ruby', 'hangman', 'flutter', 'developer', 'omkar', 'github', 'josh', 'assignment']

def choose_word
  $random_words.sample
end

def display_word(word,correct_guesses)
  word.chars.map { |char| correct_guesses.include?(char) ? char : '_' }.join(' ')
end
 

def check_game_result(word,remaining_count)
  if remaining_count == 0
    puts "You guessed the word '#{word}' correctly"
    return
  end
  
  puts "Better luck next time, the word was '#{word}'"
end

def update_guesses(word, guess_letter, correct_guesses, incorrect_guesses, remaining_count)
  if word.include?(guess_letter)
    correct_guesses.push(guess_letter)
    remaining_count -= 1
  else
    incorrect_guesses.push(guess_letter)
  end
  remaining_count
end

def process_guess(word, guess_letter, correct_guesses, incorrect_guesses, remaining_count)
  unless guess_letter.length == 1 && ('a'..'z').include?(guess_letter)
    puts 'Invalid Input'
    return remaining_count
  end

  if correct_guesses.include?(guess_letter) || incorrect_guesses.include?(guess_letter)
    puts 'You already guessed the letter'
    return remaining_count
  end
  
  update_guesses(word, guess_letter, correct_guesses, incorrect_guesses, remaining_count)
end

def play_hangman
  word = choose_word
  chances = word.size
  correct_guesses = []
  incorrect_guesses = []
  remaining_count = word.chars.uniq.size
  puts 'Welcome to Hangman'

  until incorrect_guesses.size >= chances || remaining_count == 0
    puts "Word: #{display_word(word,correct_guesses)}"
    puts "Incorrect guesses: #{incorrect_guesses.join{''}}"
    puts "Chances left: #{chances-incorrect_guesses.size}"
    puts 'Enter a letter'
    guess_letter = gets.chomp.downcase

   remaining_count = process_guess(word, guess_letter, correct_guesses, incorrect_guesses, remaining_count)
  end

  check_game_result(word,remaining_count)

end

play_hangman