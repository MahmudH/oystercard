require 'journey_log'

describe JourneyLog do

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
      subject.exit_journey(station)
      expect(subject.jr.exit_station).to eq station
    end
  end

  describe '#outstanding_charges' do
    it 'should return fare' do
      subject.start_journey(station)
      expect(subject.outstanding_charges).to eq Journey::PENALTY
    end
  end

  xit 'should return list of journeys' do
    expect(subject.journeys).to include(journey)
  end
end
