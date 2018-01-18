require 'attack'

describe Attack do
  let(:player) { double :player }
  subject(:attack) { described_class.new(player)}

  it 'accepts a argument on #initialize and sets player' do
    expect(subject.player).to eq player
  end

  describe '#attack' do
    it 'calls attacked on a player' do
      expect(player).to receive(:attacked)
      subject.attack
    end
  end
end
