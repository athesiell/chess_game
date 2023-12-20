require_relative './pieces/pieces'
require_relative './pieces/bishop'
require_relative './pieces/king'
require_relative './pieces/knight'
require_relative './pieces/pawn'
require_relative './pieces/queen'
require_relative './pieces/rook'

class Board
  attr_reader :board

  def initialize
    @board = Array.new(8) { Array.new(8) }
    place_pieces_white
    place_pieces_black
  end

  def display_board
    puts '   a   b   c   d   e   f   g   h'
    @board.each_with_index.reverse_each do |row, index|
      print "#{index + 1}"
      row.each do |cell|
        if cell.nil?
          print '|   '
        else 
          print "| #{cell.to_s} "
        end
      end
    puts "| #{index + 1}" 
    puts ' ' + '-' * 33 if index > 0
    end
    puts '   a   b   c   d   e   f   g   h'
  end

  def place_pieces_white
    8.times do |i|
      self[[1, i]] = Pawn.new([1, i], :white, self)
    end
    self[[0, 0]] = Rook.new([0, 0], :white, self)
    self[[0, 7]] = Rook.new([0, 7], :white, self)
    self[[0, 1]] = Knight.new([0, 1], :white, self)
    self[[0, 6]] = Knight.new([0, 6], :white, self)
    self[[0, 2]] = Bishop.new([0, 2], :white, self)
    self[[0, 5]] = Bishop.new([0, 5], :white, self)
    self[[0, 3]] = Queen.new([0, 3], :white, self)
    self[[0, 4]] = King.new([0, 4], :white, self)
  end

  def place_pieces_black
    8.times do |i|
      self[[6, i]] = Pawn.new([6, i], :black, self)
    end
    self[[7, 0]] = Rook.new([7, 0], :black, self)
    self[[7, 7]] = Rook.new([7, 7], :black, self)
    self[[7, 1]] = Knight.new([7, 1], :black, self)
    self[[7, 6]] = Knight.new([7, 6], :black, self)
    self[[7, 2]] = Bishop.new([7, 2], :black, self)
    self[[7, 5]] = Bishop.new([7, 5], :black, self)
    self[[7, 3]] = Queen.new([7, 3], :black, self)
    self[[7, 4]] = King.new([7, 4], :black, self)
  end

  def []=(location, piece)
    row, col = location
    board[row][col] = piece
  end

  def [](location)
    row, col = location
    board[row][col]
  end

  def empty?(location)
    row, col = location
    board[row][col].nil?
  end

  def in_boards?(location)
    row, col = location
    row >= 0 && row < 8 && col >= 0 && col < 8
  end

  def translate_coordinates(coord)
    col = coord[0].ord - 'a'.ord
    row = coord[1].to_i - 1
    [row, col]
  end

  def move_piece(from, to)
    from_row, from_col = from
    from_pos = translate_coordinates(from)
    
    to_row, to_col = to
    to_pos = translate_coordinates(to)

    piece = self[from_pos]
    if !piece.available_moves.include?(to_pos)
      puts "Invalid move for #{piece.class} piece, please choose again. Available moves are #{piece.available_moves}"
      return false
    end
    if !in_boards?(to_pos)
      puts 'Invalid move, you are going out of the board'
      return false
    end
      self[to_pos] = piece
      self[from_pos] = nil
      piece.position = to_pos
      puts "Moved #{piece.class} from #{from_pos} to #{to_pos}"
      return true
  end
end


