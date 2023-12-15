require_relative 'pieces'
require_relative 'bishop'
require_relative 'king'
require_relative 'knight'
require_relative 'pawn'
require_relative 'queen'
require_relative 'rook'

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
    puts ' ' + '-' * 35 if index > 0
    end
    puts '   a   b   c   d   e   f   g   h'
  end

  def place_pieces_white
    (0..7).each do |i|
      @board[1][i] = Pawn.new(:white)
    end
    @board[0][0] = Rook.new(:white)
    @board[0][7] = Rook.new(:white)
    @board[0][1] = Knight.new(:white)
    @board[0][6] = Knight.new(:white)
    @board[0][2] = Bishop.new(:white)
    @board[0][5] = Bishop.new(:white)
    @board[0][3] = Queen.new(:white)
    @board[0][4] = King.new(:white)
  end

  def place_pieces_black
    (0..7).each do |i|
      @board[6][i] = Pawn.new(:black)
    end
    @board[7][0] = Rook.new(:black)
    @board[7][7] = Rook.new(:black)
    @board[7][1] = Knight.new(:black)
    @board[7][6] = Knight.new(:black)
    @board[7][2] = Bishop.new(:black)
    @board[7][5] = Bishop.new(:black)
    @board[7][3] = Queen.new(:black)
    @board[7][4] = King.new(:black)
  end

  def update_board(location, piece)
    return 'Location should be array with 2 elements in it' unless location.is_a?(Array) && location.length == 2
    row = location[0]
    column = location[1]
    return 'Invalid move' unless row >= 0 && row <= 7 && column >=0 && column <= 7
    @board[row][column] = piece.to_s
    display_board
  end

  def reset_piece(location)
    return 'Location should be array with 2 elements in it' unless location.is_a?(Array) && location.length == 2
    row = location[0]
    column = location[1]
    return 'Invalid move' unless row >= 0 && row <= 7 && column >= 0 && column <= 7
    @board[row][column] = nil
    display_board
  end
end


board = Board.new
board.display_board