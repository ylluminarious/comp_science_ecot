class Player
  attr_reader :mark
  attr_accessor :move
  attr_accessor :win
  
  def initialize(mark)
    @mark = mark
    @move = nil
    @win  = false
  end
end