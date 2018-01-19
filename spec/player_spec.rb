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

  describe '#attacked(hitpoints)' do
    it 'reduces hp argument value' do
      expect{player.attacked(10)}.to change{player.hit_points}.by -10
    end
  end

  describe 'dead?' do
    it 'returns true if player hit_points equal to 0' do
      player.attacked(Player::DEFAULT_HITPOINTS)
      expect(player).to be_dead
    end
    it 'returns true if player hit_points less than 0' do
      player.attacked(Player::DEFAULT_HITPOINTS + 10)
      expect(player).to be_dead
    end
    it 'returns false if player hit points more than 0' do
      expect(player).not_to be_dead
    end
  end
end
