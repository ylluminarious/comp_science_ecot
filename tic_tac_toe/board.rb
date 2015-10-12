class Board
  attr_accessor :tr
  attr_accessor :tc
  attr_accessor :tl
  
  attr_accessor :cr
  attr_accessor :cc
  attr_accessor :cl
  
  attr_accessor :br
  attr_accessor :bc
  attr_accessor :bl
  
  def initialize
    board_spots = ["tr", "tc", "tl", "cr", "cc", "cl", "br", "bc", "bl"]
    
    board_spots.each do |name|
      instance_variable_set("@#{name}", " ")
    end
  end
  
  def draw
    puts "
          |     |
      #{@tl}   |  #{@tc}  |  #{@tr}
    ______|_____|______
          |     |
      #{@cl}   |  #{@cc}  |  #{@cr}
    ______|_____|______
          |     |
      #{@bl}   |  #{@bc}  |  #{@br}
          |     |
    "
  end
end