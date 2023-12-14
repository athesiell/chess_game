require_relative 'board'

class Pieces
  attr_reader :color

  def initialize(color)
    @color = color
  end
end