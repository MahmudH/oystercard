require 'journey_log'

describe Journey_log do

  let(:journey) {double(:journey, :enter => station, :leave => station)}
  let(:station){double(:station, :name => :vic, :zone => 2)}
  let(:journey_klass){double(:journey_klass, :new => :journey)}

describe '#start_journey' do
  it 'starts a journey' do
    subject.start_journey(station)
    expect(subject.jr.entry_station).to eq(station)
  end
end

describe '#exit_journey' do
  it 'records the exit station' do
    subject.exit_journey
    expect(subject.jr.exit_journey).to eq station
  end
end

  xit "should store a list of journeys" do
    expect(journey_log.journeys).to show a list of trips

  end

end
