require './lib/pawn'
require './lib/board'

describe Pawn do
  let(:board) { Board.new }
  subject(:pawn) { described_class.new([1, 1], :white, board) }
  describe '#available_moves' do
    context 'it shows available moves for the pieces on the board' do
      it 'shows 2 available moves for pawn' do
        expect(pawn.available_moves.length).to eq(2)
      end
    end

    context 'when enemies are diagonal and pawn in starting position' do
      it 'shows four available moves' do
        allow(pawn).to receive(:enemy?).and_return(true)
        expect(pawn.available_moves.length).to eq(4)
      end
    end

    context 'when the pawn is not at the starting position' do
      it 'shows one available move' do
        pawn.instance_variable_set(:@position, [3, 3]) 
        expect(pawn.available_moves.length).to eq(1)
      end
    end
  end
end