require './lib/players'

describe Players do
  subject(:plrs) { described_class.new }

  describe '#initialize' do 
    context 'shows players colors and their default names' do
      it 'returns that player 1 has default name Player 1' do
        expect(plrs.player1).to eq('Player 1')
      end

      it 'returns that player 2 has default name Player 2' do
        expect(plrs.player2).to eq('Player 2')
      end
      it 'returns that player 1 plays white pieces' do
        expect(plrs.color1).to eq(:white)
      end
  
      it 'returns that player 2 plays black pieces' do
        expect(plrs.color2).to eq(:black)
      end
    end
  end

  describe '#player_name' do
  before do
    allow(plrs).to receive(:puts)
    allow(plrs).to receive(:gets).and_return("Joe\n", "Michael\n")
  end

    it 'sets names for player 1 and player 2' do
      plrs.player_name
      expect(plrs.instance_variable_get(:@player1)).to eq('Joe')
      expect(plrs.instance_variable_get(:@player2)).to eq('Michael')
    end

    it 'does not overwrite default names if empty input' do
      allow(plrs).to receive(:gets).and_return("\n", "\n")
      plrs.player_name
      expect(plrs.instance_variable_get(:@player1)).to eq('Player 1')
      expect(plrs.instance_variable_get(:@player2)).to eq('Player 2')
    end
  end

  describe '#update_current_player' do
    it 'shows that it is player 1 turn' do
      expect(plrs.update_current_player).to eq('Player 1')
    end

    it 'shows that it is player 2 turn' do
      plrs.update_current_player
      expect(plrs.update_current_player).to eq('Player 2')
    end
  end
end