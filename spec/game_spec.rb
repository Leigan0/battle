require 'game'

describe Game do
subject(:game) { described_class.new }
let(:player) { double :player }

  describe '#attack' do
    it 'damages the player' do
      expect(player).to receive(:attacked)
      game.attack(player)
    end
  end
end
