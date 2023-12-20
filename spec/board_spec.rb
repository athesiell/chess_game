require './lib/board'
require './lib/pieces/pawn'

describe Board do
  subject(:board) { described_class.new }

  describe '#initialize' do
    context 'it creates a board 8 by 8' do
      it 'creates a row with length 8' do
        expect(board.board.length).to eq(8)
      end

      it 'creates a column with length 8' do
        expect(board.board[0].length).to eq(8)
      end
    end
  end

  describe '#move_piece' do
    context 'it updates pieces location on the board' do
      before do
        board.place_pieces_white
        board.place_pieces_black
      end
      it 'shows new location for the pawn' do
        board.move_piece('a2', 'a4')
        expect(board.board[3][0].class).to eq(Pawn)
      end

      it 'shows an error if player makes an invalid move' do
        pawn = Pawn.new([1,4], :white, board)
        expect { board.move_piece('e2', 'b5') }.to output("Invalid move for Pawn piece, please choose again. Available moves are #{pawn.available_moves}\n").to_stdout
      end

      it 'removes piece from previos position when the move was done' do
        board.move_piece('a2', 'a4')
        expect(board.board[1][0]).to eq(nil)
      end
    end
  end
end