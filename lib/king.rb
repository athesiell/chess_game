require_relative 'pieces'

class King < Pieces
  def to_s
    color == :white ? "♚" : "♔"
  end

  def move_dir
    [
      [1, 0], [-1, 0], [0, 1], [0, -1], [1, 1], [-1, -1], [1, -1], [-1, 1]
    ]
  end
end