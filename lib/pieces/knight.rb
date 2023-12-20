require_relative 'pieces'
require_relative 'stepable'

class Knight < Pieces
  include Stepable

  def to_s
    color == :white ? "♞" : "♘"
  end

  def move_directions
    [
      [-1, 2],
      [-2, 1],
      [-2, -1],
      [-1, -2],
      [1, 2],
      [2, 1],
      [2, -1],
      [1, -2]
    ]
  end
end