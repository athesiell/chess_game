require_relative 'slideable'

class Bishop < Pieces
  include Slideable

  def to_s
    color == :white ? "♝" : "♗"
  end

  def move_directions
    [
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ]
  end
end