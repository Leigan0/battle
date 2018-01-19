class Attack
  attr_reader :player

  def damage(player)
    player.attacked(random_damage_amount)
  end

  def random_damage_amount
    rand(1..50)
  end
end
