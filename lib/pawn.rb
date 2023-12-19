require_relative 'pieces'

class Pawn < Pieces
  def to_s
    color == :white ? "♟" : "♙"
  end

  def forward_move
    color == :white ? 1 : -1
  end

  def starting_position?
    color == :white && cur_row == 1 || color == :black && cur_row == 6
  end

  def available_moves
    moves = []

    # move 1 step
    one_step = [cur_row + forward_move, cur_col]
    if board.empty?(one_step)
      moves << one_step
    end

    # move 2 steps
    two_step = [cur_row + (forward_move * 2), cur_col]
    if board.empty?(two_step) && board.empty?(one_step) && starting_position?
      moves << two_step
    end

    diag_left = [cur_row + forward_move, cur_col + 1]
    diag_right = [cur_row + forward_move, cur_col - 1]
    if enemy?(diag_left)
      moves << diag_left
    end
    if enemy?(diag_right)
      moves << diag_right
    end
    moves
  end
end