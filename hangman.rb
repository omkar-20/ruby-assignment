
$random_words = ['ruby', 'hangman', 'flutter', 'developer', 'omkar', 'github', 'josh', 'assignment']

def choose_word
  $random_words.sample
end

def display_word(word, correct_guesses)
  word.chars.map { |char| correct_guesses.include?(char) ? char : '_' }.join(' ')
end
 

def check_game_result(word, remaining_count)
  
  return "You guessed the word '#{word}' correctly" if remaining_count == 0 
  
  return "Better luck next time, the word was '#{word}'"
end

def update_guesses(word, guess_letter, correct_guesses, incorrect_guesses, remaining_count)
  if word.include?(guess_letter)
    correct_guesses.push(guess_letter)
    remaining_count -= 1
    return remaining_count
  end

  incorrect_guesses.push(guess_letter)
  remaining_count
end

def invalid_guess?(guess_letter)
  guess_letter.length != 1 || !('a'..'z').cover?(guess_letter)
end

def already_guess?(guess_letter, correct_guesses, incorrect_guesses)
  correct_guesses.include?(guess_letter) || incorrect_guesses.include?(guess_letter)
end

def process_guess(word, guess_letter, correct_guesses, incorrect_guesses, remaining_count)
  
  return ['Invalid Input', remaining_count] if invalid_guess?(guess_letter) 
  
  return ['You already guessed the letter', remaining_count] if already_guess?(guess_letter, correct_guesses, incorrect_guesses) 
  
  remaining_count = update_guesses(word, guess_letter, correct_guesses, incorrect_guesses, remaining_count)
  [nil, remaining_count]
end

def play_hangman
  word = choose_word
  chances = word.size
  correct_guesses = []
  incorrect_guesses = []
  remaining_count = word.chars.uniq.size
  puts 'Welcome to Hangman'

  until incorrect_guesses.size >= chances || remaining_count == 0
    puts "Word: #{display_word(word, correct_guesses)}"
    puts "Incorrect guesses: #{incorrect_guesses.join{''}}"
    puts "Chances left: #{chances-incorrect_guesses.size}"
    puts 'Enter a letter'
    guess_letter = gets.chomp.downcase

   message, remaining_count = process_guess(word, guess_letter, correct_guesses, incorrect_guesses, remaining_count)
   puts message if message
  end

  result_message = check_game_result(word, remaining_count)
  puts result_message

end

play_hangman