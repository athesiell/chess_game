require_relative 'stepable'

class King < Pieces
  include Stepable

  def to_s
    color == :white ? "♚" : "♔"
  end

  def move_directions
    [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1],
      [1, 1],
      [-1, -1],
      [1, -1],
      [-1, 1]
    ]
  end
end