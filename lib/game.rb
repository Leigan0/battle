class Game

  attr_reader :player_1, :player_2, :players

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @players = [player_1,player_2]
  end

  def attack(player)
    player.attacked
  end

  def player_under_attack
    @players[1]
  end

  def current_player
    @players[0]
  end

  def switch_turn
    @players.reverse!
  end
end
