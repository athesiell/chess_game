require_relative './lib/game'

puts <<~HEREDOC

    CHESS GAME

    Welcome to the CHESS!

    The goal is to checkmate enemy's King piece

    Wins the player who manages to checkmate it

    To pick the chess piece you can type letter and the number that piece is standing on

    To move the piece just type the letter and the number of the cell

    Good Luck and Have Fun!

    HEREDOC
game = Game.new
game.play