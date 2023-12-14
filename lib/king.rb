require_relative 'pieces'

class King < Pieces
  attr_reader :color
  
  def initialize(color)
    @color = color
  end
  
  def to_s
    color == :white ? "♚" : "♔"
  end
end