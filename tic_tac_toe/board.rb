class Board
  attr_accessor :top_right
  attr_accessor :top_center
  attr_accessor :top_left
  
  attr_accessor :center_right
  attr_accessor :center_center
  attr_accessor :center_left
  
  attr_accessor :bottom_right
  attr_accessor :bottom_center
  attr_accessor :bottom_left
  
  def initialize
    board_spots = ["top_right", "top_center", "top_left", "center_right", "center_center", "center_left", "bottom_right", "bottom_center", "bottom_left"]
    
    board_spots.each do |name|
      instance_variable_set("@#{name}", " ")
    end
  end
  
  def draw
    puts "
          |     |
      #{@top_left}   |  #{@top_center}  |  #{@top_right}
    ______|_____|______
          |     |
      #{@center_left}   |  #{@center_center}  |  #{@center_right}
    ______|_____|______
          |     |
      #{@bottom_left}   |  #{@bottom_center}  |  #{@bottom_right}
          |     |
    "
  end
end