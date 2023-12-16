require_relative 'pieces'

class Pawn < Pieces
  def to_s
    color == :white ? "♟" : "♙"
  end
end