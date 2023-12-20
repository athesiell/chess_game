require_relative 'pieces'
require_relative 'slideable'

class Queen < Pieces
  include Slideable

  def to_s
    color == :white ? "♛" : "♕"
  end

  def move_directions
    [
      [0, 1],
      [0, -1],
      [1, 0],
      [-1, 0],
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ]
   end
end