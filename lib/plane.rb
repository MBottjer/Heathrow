class Plane 

  attr_accessor :flying

  def initialize
    @flying = true 
  end

  def flying_status
   return 'flying' if @flying == true 
   'landed'
  end

  def take_off_from airport 
    airport.request_take_off_to self 
    flying
  end

  def land_at airport 
    airport.land self
    @flying = false  
  end

end