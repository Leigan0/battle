require 'player'

describe Player do
  subject(:player) { described_class.new("Simon") }
  let(:player_2) { described_class.new("Leigh")}

  describe '#name' do
    it 'returns the players name' do
      expect(player.name).to eq "Simon"
    end
  end

  context 'Has hit points' do
    it 'starts at 100' do
      expect(player.hit_points).to eq(Player::DEFAULT_HITPOINTS)
    end
  end

  describe '#attack' do
  it 'damages the player' do
    expect(player).to receive(:attacked)
    player_2.attack(player)
  end
end

  describe '#attacked' do
    it 'reduces hp my 10' do
      expect{player.attacked}.to change{player.hit_points}.by -10
    end
  end
end
