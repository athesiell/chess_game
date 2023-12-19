module Stepable
  def available_moves
    moves = []

    move_directions.each do |(row_dir, col_dir)|
      cur_row, cur_col = position

      cur_row += row_dir
      cur_col += col_dir
      location = [cur_row, cur_col]
      next if !board.in_boards?(location)
      if board.empty?(location)
        moves << location
      end
    end
    moves
  end
end