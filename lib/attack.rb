class Attack
  attr_reader :player

  def attack(player)
    player.attacked
  end
end
