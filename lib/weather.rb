module Weather

  def conditions
    return :sunny if rand(1..10) <= 9
    :stormy  
  end

end