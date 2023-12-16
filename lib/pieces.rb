require_relative 'board'

class Pieces
  attr_reader :position, :color, :board

  def initialize(position, color)
    @color = color
    @position = position
    @board = board
  end
end