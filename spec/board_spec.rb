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
end