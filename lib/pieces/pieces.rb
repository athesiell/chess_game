class Pieces
  attr_reader :color, :board
  attr_accessor :position

  def initialize(position, color, board)
    @color = color
    @position = position
    @board = board
  end

  def enemy?(location)
    !board[location].nil? && board[location].color != color
  end

  def friend?(location)
    !board[location].nil? && board[location].color == color
  end

  def cur_row
    position.first
  end

  def cur_col
    position.last
  end
end