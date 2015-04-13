class Game
  def initialize
    @dictionary = File.open("dictionary.txt", "r+")
    @dictionary_words = @dictionary.readlines
    @random_word = @dictionary_words[rand(@dictionary_words.length)].downcase
    @correct_letters = []

    tick
  end

  def get_user_guess
    @random_word_array = @random_word.split("")

    @random_word_array.each do
      print "_"
    end

    puts "\nEnter your guess:"
    @user_guess = gets.chomp

    if @random_word_array.include? @user_guess
      @correct_letters.insert(@random_word_array.index(@user_guess), @user_guess)
      print @correct_letters.to_s
    end
  end

  def tick
    get_user_guess
    #ai_guess

    if @correct_letters.length != @random_word_array.length
      tick
    end
  end
end