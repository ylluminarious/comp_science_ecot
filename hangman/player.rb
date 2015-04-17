class Player < Game
  def initialize
    @alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
  end
  
  def guess(guesser)
    if guesser == "user"
      puts "\n\nEnter your guess:"
      @guess = gets.chomp.downcase
      
      if @@incorrect_letters.include?(@guess) || @@correct_letters.include?(@guess)
        puts "That has already been guessed."
        guess(guesser)
      else
        if @@random_word_array.include? @guess
          correct_guess(@guess, guesser)
        else
          incorrect_guess(guesser)
        end
    
        @@turn_count += 1
        puts "That was turn #{@@turn_count}."
      end
    elsif guesser == "AI" && @@turn_count < 15
      random_letter = rand(@alphabet.length - 1) # - 1 because 0 index
      @guess         = @alphabet[random_letter]
      
      if @@incorrect_letters.include?(@guess) || @@correct_letters.include?(@guess)
        guess(guesser)
      else
        puts "\nThe AI's guess:"
        puts @guess
        
        if @@random_word_array.include? @guess
          correct_guess(@guess, guesser)
        else
          incorrect_guess(guesser)
        end
    
        @@turn_count += 1
        puts "That was turn #{@@turn_count}."
      end
    end
  end
end