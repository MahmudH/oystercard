require 'station'

describe Station do
  let(:bethnal_green) {described_class.new(:bethnal_green, 2)}

  it 'returns name of the station' do
      expect(bethnal_green.name).to eq :bethnal_green
  end

  it 'returns zone of the station' do
      expect(bethnal_green.zone).to eq 2
  end

end
