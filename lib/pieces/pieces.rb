class Pieces
  attr_reader :color, :board
  attr_accessor :position

  def initialize(position, color, board)
    @color = color
    @position = position
    @board = board
  end

  def safe_moves
    moves = []
    available_moves.each do |move|
      new_board = board.dup
      new_board.move_piece!(position, move)
      if !new_board.in_check?(color)
        moves << move
      end
    end
    moves
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