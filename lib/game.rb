require_relative 'board'
require_relative 'players'
require_relative './pieces/pieces'
require_relative './pieces/bishop'
require_relative './pieces/king'
require_relative './pieces/knight'
require_relative './pieces/pawn'
require_relative './pieces/queen'
require_relative './pieces/rook'

class Game
  attr_reader :board, :current_player

  def initialize
    @board = Board.new
    @players = Players.new
  end

  def play 
    @board.display_board
    @players.player_name
    game_loop
  end

  def game_loop
    loop do
      cur_player = @players.update_current_player
      player_color = @players.player_color
      puts "It's #{@players.current_player}'s turn"
      start_pos = nil
      loop do
        puts "Please select a piece that you want to move"
        start_pos = gets.chomp.downcase
        start_pos_coords = @board.translate_coordinates(start_pos)

        if @board[start_pos_coords].nil?
          puts '
            No piece found at this position. Try again.
          '
          next
        elsif @board[start_pos_coords].color != player_color
          puts "
            You selected the opponent's piece. Choose your pieces please.
          "
          next
        else
          break
        end
      end
      puts "Please select a place where you want to move your piece"
      finish_pos = gets.chomp.downcase
      moved = @board.move_piece(start_pos, finish_pos)
      if moved
        @board.display_board
      else
        @players.update_current_player
        puts 'Try again. Please enter a valid move'
        next
      end
    end
  end
end