require 'player'

describe Player do
  subject(:player) { described_class.new("Simon") }

  describe '#name' do
    it 'returns the players name' do
      expect(player.name).to eq "Simon"
    end
  end
end
