require_relative 'weather'

class Airport

  attr_reader :capacity, :planes, :weather 

  def initialize(planes = [], capacity = 6, weather)
    @planes = planes
    @capacity = capacity
    @weather = weather 
  end

  def request_take_off_to plane 
    if clear_for_takeoff?
      @planes.delete(plane)
    else
      puts 'storm be brewing laddy'
    end
  end

  def land plane
    if clear_for_landing?
      @planes << plane
    else 
      puts 'storm be brewing laddy'
    end
  end

  def plane_count
    planes.count
  end

  def full?
    plane_count == capacity
  end

  def clear_for_takeoff?
    true if sunny_weather
  end

  def clear_for_landing?
    true if !full? and sunny_weather 
  end

  def sunny_weather
    weather.conditions == :sunny 
  end

end