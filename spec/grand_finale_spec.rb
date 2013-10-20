require 'plane'
require 'airport'
require 'weather'

describe 'the grand finale test' do 

  describe "The gand finale (last spec)" do
    it 'all planes can land and all planes can take off' do
     airport = Airport.new([], 6, Weather.new)
     plane1 = Plane.new
     plane2 = Plane.new
     plane3 = Plane.new
     plane4 = Plane.new
     plane5 = Plane.new
     plane6 = Plane.new
     all_planes = [plane1, plane2, plane3, plane4, plane5, plane6]
     all_planes.each do |plane|
      while plane.flying == true 
        plane.land_at airport 
      end
     end
     expect(airport.full?).to be_true
     all_planes.each do |plane|
      while plane.flying == false 
        plane.take_off_from airport 
      end
    end
     expect(airport.plane_count).to eq 0 
   end
 end


end