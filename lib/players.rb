require_relative 'board'
require_relative './pieces/pieces'

class Players
  attr_reader :player1, :player2, :board, :current_player, :color1, :color2

  def initialize(player1 = 'Player 1', player2 = 'Player 2')
    @player1 = 'Player 1'
    @player2 = 'Player 2'
    @color1 = :white
    @color2 = :black
    @current_player = nil
  end

  def player_name
    puts 'Player 1 your pieces are white, what is your name?'
    name1 = gets.chomp
    @player1 = name1 unless name1.empty?

    puts 'Player 2 your pieces are black, what is your name?'
    name2 = gets.chomp
    @player2 = name2 unless name2.empty?
  end

  def player_color
    @current_player == @player1 ? @color1 : @color2
  end

  def update_current_player
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end
end