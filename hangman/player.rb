class Player < Game
  def initialize
    @alphabet = ("a".."z").to_a
  end
  
  def guess(guesser)
    if guesser == "user"
      @@turn_count += 1

      puts "\n\nEnter your guess:"
      @guess = gets.chomp.downcase
      
      if @@incorrect_letters.include?(@guess) || @@correct_letters.include?(@guess)
        @@turn_count -= 1
        puts "That has already been guessed."
        guess(guesser)
      else
        if @@random_word_array.include? @guess
          correct_guess(@guess, guesser)
        else
          incorrect_guess(guesser)
        end
      
        puts "That was turn #{@@turn_count}." if @@turn_count < 15 && @@unknown_word.include?("_")
      end
    elsif guesser == "computer"
      @@turn_count += 1

      random_letter = rand(@alphabet.length - 1) # - 1 to correct the 0 offset
      @guess        = @alphabet[random_letter]
      
      if @@incorrect_letters.include?(@guess) || @@correct_letters.include?(@guess)
        @@turn_count -= 1
        guess(guesser)
      elsif @@turn_count < 15 && @@unknown_word.include?("_")
        puts "\nThe computer's guess:"
        puts @guess
        
        if @@random_word_array.include? @guess
          correct_guess(@guess, guesser)
        else
          incorrect_guess(guesser)
        end
        
        puts "That was turn #{@@turn_count}." if @@turn_count < 15 && @@unknown_word.include?("_")
      end
    end
  end
end