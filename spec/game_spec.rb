require 'game'

describe Game do
subject(:game) { described_class.new(player_1, player_2) }
let(:player_1) { double :player, name: 'Leigh-Ann'}
let(:player_2) { double :player, name: 'Simon'}

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

  describe '#whose_turn' do
    it 'whose turn to get attacked' do
      expect(game.whose_turn).to eq(player_2)
    end

    it 'shows player 2 turn after player one action' do
      game.next_round
      expect(game.whose_turn).to eq(player_1)
    end
  end

  describe '#next_round' do
    it 'increments round' do
      expect{game.next_round}.to change{game.round}.by 1
    end
  end
end
