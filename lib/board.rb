class Board
  attr_reader :board

  def initialize
    @board = Array.new(8) { Array.new(8) }
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
end
