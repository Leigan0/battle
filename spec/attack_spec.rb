require 'attack'

describe Attack do
  let(:player) { double :player, attacked: nil  }
  subject(:attack) { described_class.new}

  describe '#attack' do
    it 'calls attacked on a player given as argument' do
      expect(player).to receive(:attacked)
      attack.damage(player)
    end
    it 'generates random damage points' do
      expect(attack).to receive(:rand)
      attack.damage(player)
    end
  end
end
