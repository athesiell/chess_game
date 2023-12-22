require_relative 'board'
require_relative 'players'
require 'json'

class Game
  attr_reader :board, :players, :current_player

  def initialize
    @board = Board.new
    @players = Players.new
    load_game if File.exist?('saved_game.json')
  end

  def play
    board.display_board
    players.player_name
    game_loop
  end

  def game_loop
    until game_over?
      cur_player = players.update_current_player
      player_color = players.player_color
      puts "It's #{players.current_player}'s turn"
      puts "#{cur_player} your King is in check!" if board.in_check?(player_color)
      break if game_over?
      start_pos = nil

      loop do
        puts 'Please select a piece that you want to move. Or type "M" to show options'
        answer = gets.chomp.downcase
        if answer == 'm'
          input_to_save
          next
        end
        start_pos = answer
        start_pos_coords = board.translate_coordinates(start_pos)

        if board[start_pos_coords].nil?
          puts 'No piece found at this position. Try again.'
          next
        elsif board[start_pos_coords].color != player_color
          puts "You selected the opponent's piece. Choose your pieces please."
          next
        else
          break
        end
      end
      puts 'Please select a place where you want to move your piece'
      finish_pos = gets.chomp.downcase

      moved = board.move_piece(start_pos, finish_pos)
      if moved
        puts `clear`
        board.display_board
      else
        puts 'Try again. Please enter a valid move'
        players.update_current_player
      end
    end
    puts "#{cur_player} you lost, you King is in checkmate!"
  end

  def game_over?
    true if board.checkmate?(players.player_color)
  end

  def to_json
    JSON.dump({
      board: Marshal.dump(@board),
      players: Marshal.dump(@players)
    })
  end

  def save_game(file)
    File.open("saved_game.json", "w") do |game_file|
      game_file.write(file)
    end
  end

  def from_json(json)
    data = JSON.load File.new(json)
    @board = Marshal.load(data['board'])
    @players = Marshal.load(data['players'])
  end

  def load_game
    puts "Would you like to load your previous game? Type 'Y' or 'N'!"
    answer = gets.chomp.downcase
    if answer == 'y'
      from_json('saved_game.json')
    elsif answer == 'n'
      play
    else
      puts 'Invalid input, try again.'
      load_game
    end
  end

  def input_to_save
    puts "
    Would you like to save your game?
    Type 'Y' - save the game / 'N' - to continue playing!
    Or type 'Q' to end the game!
    "
    answer = gets.chomp.downcase
    if answer == 'y'
      save_game(to_json)
    elsif answer == 'n'
      players.update_current_player
      game_loop
    elsif answer == 'q'
      exit 
    else
      puts 'Invalid input. Please enter "Y", "N" or "Q"'
      input_to_save
    end
  end
end