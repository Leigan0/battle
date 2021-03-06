# Player class
class Player
  attr_reader :name, :hit_points
  DEFAULT_HITPOINTS = 100

  def initialize(name)
    @name = name
    @hit_points = DEFAULT_HITPOINTS
  end

  def attacked(hitpoints)
    @hit_points -= hitpoints
  end

  def dead?
    @hit_points <= 0
  end

end
