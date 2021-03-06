class Game
  def initialize
    @@turn_count         = 0
    
    @dictionary          = File.open("dictionary.txt", "r+")
    @dictionary_words    = @dictionary.readlines
    
    select_random_word
    @@unknown_word       = ""
    
    @@random_word_array  = @random_word.split("")
    
    @@correct_letters    = []
    @@incorrect_letters  = []
    
    puts "===================================================================================="
    puts "Welcome to Hangman!"
    puts "In this version of the game, you play against the computer to guess the word."
    puts "You and the computer only have 15 guesses altogether to find out what it is, though."
    puts "Good luck!"
    puts "===================================================================================="
    
    puts "The word for this round:\n"
    @@random_word_array.each do |char|
      if @@unknown_word.length != @@random_word_array.length
        @@unknown_word << "_"
        print "_"
      end
    end
    
    @user     = Player.new
    @computer = Player.new
    
    tick
  end
  
  def select_random_word
    random_index      = rand(@dictionary_words.length - 1) # - 1 to correct the 0 offset
    @random_word      = @dictionary_words[random_index].downcase
    @random_word.chop!
    
    if @random_word.length < 5 || @random_word.length > 12
      select_random_word
    end
  end
  
  def correct_guess(guess, guesser)
    puts "Correct!"
    
    guess_index = @@random_word_array.index(guess)
    
    @@unknown_word = @@unknown_word.split("")
    
    @@unknown_word.delete_at(guess_index)
    @@unknown_word.insert(guess_index, guess)
    
    @@random_word_array.each_index do |index|
      if @@random_word_array[index] == guess && index > guess_index
        @@unknown_word.delete_at(index)
        @@unknown_word.insert(index, guess)
      end
    end
    
    @@unknown_word = @@unknown_word.join
    
    @@correct_letters.push(guess)
    puts @@unknown_word
    
    if !@@unknown_word.include?("_")
      if guesser == "user"
        puts "\nYou win!"
      elsif guesser == "computer"
        puts "\nThe computer wins!"
      end
    elsif @@turn_count == 15
      puts "\nNobody won this round."
      puts "The word was \"#{@@random_word_array.join}\"."
    end
  end
  
  def incorrect_guess(guesser)
    if guesser == "user"
      puts "Sorry, that's not correct."
    else
      puts "Looks like the computer guessed wrong."
    end

    @@incorrect_letters.push(@guess)
    
    if @@turn_count == 15 && @@unknown_word.include?("_")
      puts "\nNobody won this round."
      puts "The word was \"#{@@random_word_array.join}\"."
    end
  end
  
  def tick
    @user.guess("user")
    @computer.guess("computer")
    
    if @@turn_count < 15  && @@unknown_word.include?("_")
      puts "\nCorrect and incorrect letters so far:\n"
      puts "Correct:   #{@@correct_letters.join(", ")}"
      puts "Incorrect: #{@@incorrect_letters.join(", ")}"
    end
    
    if @@turn_count <= 15 && @@unknown_word.include?("_")
      tick
    else
      # do nothing; game over
    end
  end
end