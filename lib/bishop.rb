require_relative 'pieces'

class Bishop < Pieces
  def to_s
    color == :white ? "♝" : "♗"
  end

  def move_dir
    [
    # top-left to bottom-right
    [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7],
    [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7],
    # bottom-left to top-right
    [1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7],
    [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7]
    ]
  end
end