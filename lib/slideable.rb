module Slideable
  def available_moves
    moves = []

    move_directions.each do |(row_dir, col_dir)|
      cur_row, cur_col = position

      loop do
        cur_row += row_dir
        cur_col += col_dir
        location = [cur_row, cur_col]
        break if !board.in_boards?(location)
        if board.empty?(location)
          moves << location
        end
        if enemy?(location)
          moves << location
          break
        end
      end
    end
    moves
  end
end