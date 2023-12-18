require './lib/board'

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

  describe '#update_board' do
    context 'it updates pieces location on the board' do
      it 'shows new location for the pawn' do
        location = [2, 3]
        pawn = Pawn.new([1,3], :white)
        board.update_board(location, pawn)
        expect(board.board[2][3]).to eq("♟")
      end
    end
  end

  describe '#reset_piece' do 
    context 'it updates pieces location in the board' do
      it 'removes pieces when the move was done' do
        location = [1, 3]
        board.reset_piece(location)
        expect(board.board[1][3]).to eq(nil)
      end
    end
  end

end