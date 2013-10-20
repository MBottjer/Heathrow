require 'plane'
require 'airport'

describe Plane do
 
  let(:plane) { Plane.new }
  
  it 'has a flying status when created' do
    expect(plane.flying).to be_true
  end
  
  it 'has a flying status when in the air' do
    plane.flying
    expect(plane.flying_status).to eq 'flying'
  end

  it 'has a landed status when it is grounded' do 
    plane.flying= false
    expect(plane.flying_status).to eq 'landed'
  end

  it 'can take off' do
    airport = double :Airport, {planes: []}   
    expect(airport).to receive(:request_take_off_to).with (plane)
    plane.take_off_from airport 
    expect(plane.flying_status).to eq 'flying'
  end

  it 'can land' do 
    airport = double :Airport, {planes: [plane]}
    expect(airport).to receive(:land).with (plane)
    plane.land_at airport 
    expect(plane.flying_status).to eq 'landed'
  end
  
end