# Player class
class Player
  attr_reader :name, :hit_points
  DEFAULT_HITPOINTS = 100

  def initialize(name)
    @name = name
    @hit_points = DEFAULT_HITPOINTS
  end

  def attacked
    @hit_points -= 10
  end

  def dead?
    @hit_points <= 0
  end

end
