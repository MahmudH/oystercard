require 'journey_log'

describe Journey_log do

let(:journey){ double :journey, enter: station } #this may need to have some methods
let(:station){ double :station }
let(:journey_klass){double :journey_klass, new: journey}
subject {described_class.new(journey_klass: journey_klass)}

describe '#start_journey' do
  it 'starts a journey' do
    expect(journey_klass).to receive(:new)
    subject.start_journey(station)
  end

  it 'records a journey' do
    allow(journey_klass).to receive(:new).and_return journey
    subject.start_journey(station)
    expect(subject.journeys).to include journey
  end
end


  # it "should capture an entry journey on touching in" do
  #   journey_log.start_journey(entry_station)
  #   expect(journey_log.journeys).to include("entry_station" => [entry_station.name, entry_station.zone])
  # end
  #
  # it "should capture an exit journey on touching out" do
  #   journey_log.start_journey(entry_station)
  #   journey_log.exit_journey(exit_station)
  #   expect(journey_log.journeys).to include("exit_station" => [exit_station.name, exit_station.zone])
  # end

  xit "should store a list of journeys" do
    expect(journey_log.journeys).to show a list of trips

  end

end
