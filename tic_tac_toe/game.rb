class Game
  def initialize
    @player_x = Player.new("X")
    @player_o = Player.new("O")
    @board    = Board.new
    puts "-------------------------------------------------------------------------"
    puts "Welcome to tic-tac-toe!"
    puts "When prompted to make your move, enter it in like so:"
    puts "[first letter of row][first letter of column]"
    puts "For example, \"tr\" for top right or \"cc\" for center center."
    puts "This will mark your x or o at the section in that column and row."
    puts "Entering anything other than that format will not register for your move."
    puts "-------------------------------------------------------------------------"
    @board.draw
    
    @tie = false
    
    tick
  end
  
  def get_input(player)
    if player == @player_x
      enemy = @player_o
    else
      enemy = @player_x
    end
    
    check_if_spot_taken = lambda do |spot|
      board_spot = @board.instance_variable_get("@#{spot}")
      
      unless board_spot == " "
        puts "Sorry, that spot's taken."
        get_input(player)
      else
        @board.instance_variable_set("@#{spot}", player.mark)
        @board.draw
      end
    end
    
    if enemy.win == false && @tie == false
      puts "Enter #{player.mark} player's move:"
      player.move = gets.chomp.downcase
      
      case player.move
      when "tr"
        check_if_spot_taken.call "tr"
      when "tc"
        check_if_spot_taken.call "tc"
      when "tl"
        check_if_spot_taken.call "tl"
      when "cr"
        check_if_spot_taken.call "cr"
      when "cc"
        check_if_spot_taken.call "cc"
      when "cl"
        check_if_spot_taken.call "cl"
      when "br"
        check_if_spot_taken.call "br"
      when "bc"
        check_if_spot_taken.call "bc"
      when "bl"
        check_if_spot_taken.call "bl"
      else
        puts "Not valid input.\n\n"
        get_input(player)
      end
    end
  end
  
  def check_board(player)
    if @tie == false
      # Horizontal rows check
      if @board.tr == player.mark && @board.tc == player.mark && @board.tl == player.mark
        player.win = true
      elsif @board.cr == player.mark && @board.cc == player.mark && @board.cl == player.mark
        player.win = true
      elsif @board.br == player.mark && @board.bc == player.mark && @board.bl == player.mark
        player.win = true
      end
      
      # Vertical rows check
      if @board.tr == player.mark && @board.cr == player.mark && @board.br == player.mark
        player.win = true
      elsif @board.tc == player.mark && @board.cc == player.mark && @board.bc == player.mark
        player.win = true
      elsif @board.tl == player.mark && @board.cl == player.mark && @board.bl == player.mark
        player.win = true
      end
      
      # Diagonal rows check
      if @board.tr == player.mark && @board.cc == player.mark && @board.bl == player.mark
        player.win = true
      elsif @board.tl == player.mark && @board.cc == player.mark && @board.br == player.mark
        player.win = true
      end
      
      # Tie check
      if @board.tr != " " && @board.tc != " " && @board.tl != " " && @board.cr != " " && @board.cc != " " && @board.cl != " " && @board.bl != " " && @board.bc != " " && @board.br != " "
        @tie = true
        puts "Tie!"
      end
      
      if player.win == true
        puts "#{player.mark} player wins!"
      end
    end
  end
  
  def tick
    get_input(@player_x)
    
    check_board(@player_x)
    
    get_input(@player_o)
    
    check_board(@player_o)
    
    if @player_x.win == false && @player_o.win == false && @tie == false
      tick
    end
  end
end