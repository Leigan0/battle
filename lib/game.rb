class Game

  attr_reader :player_1, :player_2, :round

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @round = 0
  end

  def attack(player)
    player.attacked
  end

  def whose_turn
    print round
    round.even? ? player_2 : player_1 
  end

  def next_round
    @round += 1
  end
end
