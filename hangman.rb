
$random_words = ["ruby", "hangman", "flutter", "developer", "omkar", "github", "josh", "assignment"]

def choose_word
  $random_words.sample
end

def display_word(word,correct_guesses)
  word.chars.map { |char| correct_guesses.include?(char) ? char : '_' }.join(' ')
end

def won?(word,correct_guesses)
  word.chars.all? { |char| correct_guesses.include?(char) }
end  

def play_hangman
  word = choose_word
  chances = word.size
  correct_guesses = []
  incorrect_guesses = []
  
  puts 'Welcome to Hangman'

  until incorrect_guesses.size >= chances || won?(word,correct_guesses)
    puts "Word: #{display_word(word,correct_guesses)}"
    puts "Incorrect guesses: #{incorrect_guesses.join{""}}"
    puts "Chances left: #{chances-incorrect_guesses.size}"
    puts 'Enter a letter'
    guess_letter = gets.chomp.downcase

    if guess_letter.length!=1 || !('a'..'z').include?(guess_letter)
      puts 'Invalid Input'
    elsif correct_guesses.include?(guess_letter) || incorrect_guesses.include?(guess_letter)
      puts 'You already guess the letter'
    elsif word.include?(guess_letter)
      correct_guesses.push(guess_letter)
    else
      incorrect_guesses.push(guess_letter)
    end
  end

  if won?(word,correct_guesses)
    puts "You guessed the word '#{word}' correctly"
  else
    puts "Better luck next time, the word was '#{word}'"
  end
end

play_hangman