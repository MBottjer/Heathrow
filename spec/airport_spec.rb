require 'airport'
require 'weather'

 
describe Airport do
  let(:weather) {double :Weather}
  let(:airport) { Airport.new([], 5, weather) }
  let(:plane) {double :Plane}
  
  context 'taking off and landing' do
    it 'a plane can land' do
      expect(weather).to receive(:conditions).and_return :sunny
      airport.land(plane)
      expect(airport.plane_count).to eq 1
    end

    it 'a plane can take off' do
      expect(weather).to receive(:conditions).and_return :sunny
      airport = Airport.new([plane], 2, weather)
      airport.request_take_off_to plane
      expect(airport.plane_count).to eq 0
    end

  end

  context 'an aiport must' do 

    it 'knows its capacity' do
      airport = Airport.new([plane, plane], 6, weather)
      expect(airport.capacity).to eq 6
    end

  end

  context 'airport should not let' do 

    it 'planes land if the airport is full' do
      airport = Airport.new([plane, plane], 2, weather)
      airport.land(plane)
      expect(airport.plane_count).to eq 2
    end

    it 'planes land if there is stormy weather' do 
      expect(weather).to receive(:conditions).and_return :stormy
      expect(airport).not_to be_clear_for_landing
    end

    it 'planes takeoff if there is stormy weather' do 
      expect(weather).to receive(:conditions).and_return :stormy
      expect(airport).not_to be_clear_for_takeoff
    end

  end

  context 'airport should let planes land if' do 

    it 'if there is sunny weather' do
     expect(weather).to receive(:conditions).and_return :sunny
      expect(airport).to be_clear_for_landing
    end

  end

end
