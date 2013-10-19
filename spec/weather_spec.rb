require 'weather'

describe Weather do 
  let(:weather) { Weather.new }

context 'should at random' do

  it 'be mostly sunny' do
    expect(Random).to receive(:rand).with(1..10).and_return(1)
    expect(weather.conditions).to eq :sunny
  end
end

end