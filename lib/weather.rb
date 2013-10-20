class Weather

  def conditions
    return :sunny if rand(1..10) <= 2
    :stormy  
  end

end