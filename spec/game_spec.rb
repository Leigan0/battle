require 'game'

describe Game do
subject(:game) { described_class.new(player_1, player_2) }
let(:player_1) { double :player_1}
let(:player_2) { double :player_2}

  describe '#attack' do
    it 'damages the player' do
      expect(player_1).to receive(:attacked)
      game.attack(player_1)
    end
  end

  describe '.initialize' do
    it 'has player 1' do
      expect(game.player_1).to eq(player_1)
    end

    it 'has player 2' do
      expect(game.player_2).to eq(player_2)
    end
  end

  describe '#player_under_attack' do
    it 'returns player under attack' do
      expect(game.player_under_attack).to eq player_2
    end
  end

  describe '#current_player' do
    it 'returns player in turn' do
      expect(game.current_player).to eq player_1
    end
  end

  describe 'switch_turn' do
    it 'switches player under attack' do
      game.switch_turn
      expect(game.player_under_attack).to eq player_1
      expect(game.current_player).to eq player_2
    end
  end
end
