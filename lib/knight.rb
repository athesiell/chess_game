require_relative 'pieces'

class Knight < Pieces
  attr_reader :color
  
  def initialize(color)
    @color = color
  end

  def to_s
    color == :white ? "♞" : "♘"
  end
end