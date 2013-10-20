require 'airport'
require 'weather'

 
describe Airport do
  let(:weather) {double :Weather}
  let(:airport) { Airport.new }
  let(:plane) {double :Plane}
  
  context 'taking off and landing' do
    it 'a plane can land' do
      Airport.any_instance.stub(:conditions) { :sunny }
      airport.land(plane)
      expect(airport.plane_count).to eq 1
    end

    it 'a plane can take off' do
      Airport.any_instance.stub(:conditions) { :sunny }
      airport = Airport.new([plane], 2)
      airport.request_take_off_to plane
      expect(airport.plane_count).to eq 0
    end

  end

  context 'an aiport must' do 

    it 'knows its capacity' do
      airport = Airport.new([plane, plane], 6)
      expect(airport.capacity).to eq 6
    end

  end

  context 'airport should not let' do 

    it 'planes land if the airport is full' do
      airport = Airport.new([plane, plane], 2)
      airport.land(plane)
      expect(airport.plane_count).to eq 2
    end

    it 'planes land if there is stormy weather' do 
      Airport.any_instance.stub(:conditions) { :stormy }
      expect(airport).not_to be_clear_for_landing
    end

    it 'planes takeoff if there is stormy weather' do 
      Airport.any_instance.stub(:conditions) { :stormy }
      expect(airport).not_to be_clear_for_takeoff
    end

  end

  context 'airport should let planes land if' do 

    it 'if there is sunny weather' do
      Airport.any_instance.stub(:conditions) { :sunny }
      expect(airport).to be_clear_for_landing
    end

  end

end
