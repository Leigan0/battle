class Attack
  attr_reader :player
  
  def initialize(player)
    @player = player
  end

  def attack
    player.attacked
  end
end
