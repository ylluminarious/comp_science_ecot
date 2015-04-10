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
  
  def spot_taken
    puts "Sorry, that spot's taken."
  end
  
  def get_x_input
    if @player_o.win == false && @tie == false
      puts "Enter X player's move:"
      @player_x.move = gets.chomp
    
      if @player_x.move == "tr"
        if @board.top_right != " "
          spot_taken
          get_x_input
        else
          @board.top_right = "X"
          @board.draw
        end
      elsif @player_x.move == "tc"
        if @board.top_center != " "
          spot_taken
          get_x_input
        else
          @board.top_center = "X"
          @board.draw
        end
      elsif @player_x.move == "tl"
        if @board.top_left != " "
          spot_taken
          get_x_input
        else
          @board.top_left = "X"
          @board.draw
        end
      elsif @player_x.move == "cr"
        if @board.center_right != " "
          spot_taken
          get_x_input
        else
          @board.center_right = "X"
          @board.draw
        end
      elsif @player_x.move == "cc"
        if @board.center_center != " "
          spot_taken
          get_x_input
        else
          @board.center_center = "X"
          @board.draw
        end
      elsif @player_x.move == "cl"
        if @board.center_left != " "
          spot_taken
          get_x_input
        else
          @board.center_left = "X"
          @board.draw
        end
      elsif @player_x.move == "br"
        if @board.bottom_right != " "
          spot_taken
          get_x_input
        else
          @board.bottom_right = "X"
          @board.draw
        end
      elsif @player_x.move == "bc"
        if @board.bottom_center != " "
          spot_taken
          get_x_input
        else
          @board.bottom_center = "X"
          @board.draw
        end
      elsif @player_x.move == "bl"
        if @board.bottom_left != " "
          spot_taken
          get_x_input
        else
          @board.bottom_left = "X"
          @board.draw
        end
      end
    end
  end
  
  def get_o_input
    if @player_x.win == false && @tie == false
      puts "Enter O player's move:"
      @player_o.move = gets.chomp
    
      if @player_o.move == "tr"
        if @board.top_right != " "
          spot_taken
          get_o_input
        else
          @board.top_right = "O"
          @board.draw
        end
      elsif @player_o.move == "tc"
        if @board.top_center != " "
          spot_taken
          get_o_input
        else
          @board.top_center = "O"
          @board.draw
        end
      elsif @player_o.move == "tl"
        if @board.top_left != " "
          spot_taken
          get_o_input
        else
          @board.top_left = "O"
          @board.draw
        end
      elsif @player_o.move == "cr"
        if @board.center_right != " "
          spot_taken
          get_o_input
        else
          @board.center_right = "O"
          @board.draw
        end
      elsif @player_o.move == "cc"
        if @board.center_center != " "
          spot_taken
          get_o_input
        else
          @board.center_center = "O"
          @board.draw
        end
      elsif @player_o.move == "cl"
        if @board.center_left != " "
          spot_taken
          get_o_input
        else
          @board.center_left = "O"
          @board.draw
        end
      elsif @player_o.move == "br"
        if @board.bottom_right != " "
          spot_taken
          get_o_input
        else
          @board.bottom_right = "O"
          @board.draw
        end
      elsif @player_o.move == "bc"
        if @board.bottom_center != " "
          spot_taken
          get_o_input
        else
          @board.bottom_center = "O"
          @board.draw
        end
      elsif @player_o.move == "bl"
        if @board.bottom_left != " "
          spot_taken
          get_o_input
        else
          @board.bottom_left = "O"
          @board.draw
        end
      end
    end
  end
  
  def check_board(player)
    if @tie == false
      # Horizontal rows check
      if @board.top_right == player.mark && @board.top_center == player.mark && @board.top_left == player.mark
        player.win = true
      elsif @board.center_right == player.mark && @board.center_center == player.mark && @board.center_left == player.mark
        player.win = true
      elsif @board.bottom_right == player.mark && @board.bottom_center == player.mark && @board.bottom_left == player.mark
        player.win = true
      end
  
      # Vertical rows check
      if @board.top_right == player.mark && @board.center_right == player.mark && @board.bottom_right == player.mark
        player.win = true
      elsif @board.top_center == player.mark && @board.center_center == player.mark && @board.bottom_center == player.mark
        player.win = true
      elsif @board.top_left == player.mark && @board.center_left == player.mark && @board.bottom_left == player.mark
        player.win = true
      end
  
      # Diagonal rows check
      if @board.top_right == player.mark && @board.center_center == player.mark && @board.bottom_left == player.mark
        player.win = true
      elsif @board.top_left == player.mark && @board.center_center == player.mark && @board.bottom_right == player.mark
        player.win = true
      end
    
      # Tie check
      if @board.top_right != " " && @board.top_center != " " && @board.top_left != " " && @board.center_right != " " && @board.center_center != " " && @board.center_left != " " && @board.bottom_left != " " && @board.bottom_center != " " && @board.bottom_right != " "
        @tie = true
        puts "Tie!"
      end
  
      if player.win == true
        puts "#{player.mark} player wins!"
      end
    end
  end
  
  def tick
    get_x_input
    
    check_board(@player_x)
    
    get_o_input
    
    check_board(@player_o)
    
    if @player_x.win == false && @player_o.win == false && @tie == false
      tick
    end
  end
end