class Plane 

  def initialize(status = 'flying')
    @status = status 
  end

  def status 
    @status
  end

  def flying
    @status
  end

  def not_flying
    @status = 'landed'
  end

  def take_off_from airport 
    airport.request_take_off_to self 
    @status
  end

  def land_at airport 
    airport.land self
    self.not_flying 
  end

end