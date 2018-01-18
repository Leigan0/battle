class Game

    def self.create(player_1,player_2)
      @@game = Game.new(player_1,player_2)
    end

    def self.instance
      @@game
    end

  attr_reader :player_1, :player_2, :players

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @players = [player_1,player_2]
  end

  def player_under_attack
    players.last
  end

  def current_player
    players.first
  end

  def switch_turn
    players.reverse!
  end

  def gameover?
    player_1.dead? || player_2.dead?
  end

  def losing_player
    player_1.dead? ? player_1 : player_2
  end

end
