require_relative 'pieces'
require_relative 'bishop'
require_relative 'king'
require_relative 'knight'
require_relative 'pawn'
require_relative 'queen'
require_relative 'rook'

class Board
  attr_reader :board
  attr_accessor :player1_pieces, :player2_pieces

  def initialize
    @board = Array.new(8) { Array.new(8) }
    @player1_pieces = place_pieces_white
    @player2_pieces = place_pieces_black
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
      @board[1][i] = Pawn.new([1][i], :white)
    end
    @board[0][0] = Rook.new([0][0], :white)
    @board[0][7] = Rook.new([0][7], :white)
    @board[0][1] = Knight.new([0][1], :white)
    @board[0][6] = Knight.new([0][6], :white)
    @board[0][2] = Bishop.new([0][2], :white)
    @board[0][5] = Bishop.new([0][5], :white)
    @board[0][3] = Queen.new([0][3], :white)
    @board[0][4] = King.new([0][4], :white)
 end

 def place_pieces_black
  (0..7).each do |i|
    @board[6][i] = Pawn.new([6][i], :black)
  end
  @board[7][0] = Rook.new([7][0], :black)
  @board[7][7] = Rook.new([7][7], :black)
  @board[7][1] = Knight.new([7][1], :black)
  @board[7][6] = Knight.new([7][6], :black)
  @board[7][2] = Bishop.new([7][2], :black)
  @board[7][5] = Bishop.new([7][5], :black)
  @board[7][3] = Queen.new([7][3], :black)
  @board[7][4] = King.new([7][4], :black)
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