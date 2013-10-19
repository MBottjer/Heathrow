require_relative 'weather'

class Airport

  attr_reader :capacity

  def initialize(planes = [], capacity = 5)
    @planes = planes
    @capacity = capacity
  end

  def request_take_off_to plane 
    @planes.delete(plane)
  end

  def land plane
    @planes << plane unless full?
  end

  def plane_count
    @planes.count
  end

  def full?
    plane_count == @capacity
  end

  def gives_permission_to_land(plane)
  true
  end

end