require_relative 'pieces'

class Knight < Pieces
  def to_s
    color == :white ? "♞" : "♘"
  end

  def move_dir
    [
      [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, 2], [2, 1], [2, -1], [1, -2]
    ]
  end
end