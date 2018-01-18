require 'attack'

describe Attack do
  let(:player) { double :player }
  subject(:attack) { described_class.new}

  describe '#attack' do
    it 'calls attacked on a player given as argument' do
      expect(player).to receive(:attacked)
      subject.attack(player)
    end
  end
end
