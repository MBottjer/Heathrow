require 'weather'

describe Weather do 
  let(:weather) { Weather.new }

context 'should at random' do

  it 'be mostly sunny' do
    expect(weather).to receive(:conditions).and_return :sunny
    expect(weather.conditions).to eq :sunny
  end
end

end