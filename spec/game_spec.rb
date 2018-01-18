require 'game'

describe Game do
subject(:game) { described_class.new(player_1, player_2) }
let(:player_1) { double :player_1, dead?: false }
let(:player_2) { double :player_2, dead?: false }

  describe '.initialize' do
    it 'accepts two arguments and stores players in array' do
      expect(game.players).to eq [player_1, player_2]
    end
    it 'stores player_1' do
      expect(game.player_1). to eq player_1
    end
    it 'stores player_2' do
      expect(game.player_2). to eq player_2
    end
  end

  describe '#player_under_attack' do
    it 'returns last player in players array - player under attack' do
      expect(game.player_under_attack).to eq player_2
    end
  end

  describe '#current_player' do
    it 'returns first player stored in player array player in turn' do
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

  describe '#gameover?' do
    it 'returns true if either players hit points less than or equal to 0' do
      allow(player_2).to receive(:dead?).and_return true
      expect(game).to be_gameover
    end
    it 'return false if both players points are above 0' do
      expect(game).not_to be_gameover
    end
  end
end
