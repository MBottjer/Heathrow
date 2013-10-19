class Weather

  def conditions
    return :sunny if Random.rand(1..10) <= 9
    :stormy  
  end
end