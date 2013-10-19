require 'airport'
require 'weather'

 
describe Airport do
  let(:airport) { Airport.new }
  let(:plane) {double :plane}
  
  context 'taking off and landing' do
    it 'a plane can land' do
    airport.land(plane)
    expect(airport.plane_count).to eq 1
    end

    it 'a plane can take off' do
      airport = Airport.new([plane], 2)
      airport.request_take_off_to plane
      expect(airport.plane_count).to eq 0
    end

    it 'a plane cannot land if the airport is full' do
      airport = Airport.new([plane, plane], 2)
      airport.land(plane)
      expect(airport.plane_count).to eq 2
    end

    it 'knows its capacity' do
      airport = Airport.new([plane, plane], 6)
      expect(airport.capacity).to eq 6
    end

    it 'gives permission to a plane to land' do
      plane = double :plane 
      expect(Random).to receive(:rand).with(1..10).and_return(1)
      expect(airport.gives_permission_to_land(plane)).to be_true
    end



  end
end
    

#   end
  
#   context 'traffic control' do
#     it 'a plane cannot land if the airport is full' do
#     end
#   end
# end
#     