require 'journey'

describe Journey do

  let(:entry_station) {double :station, name: :bethnal_green, zone: 2}
  let(:exit_station) {double :station1, name: :archway, zone: 3}

  it "has an empty list of journeys by default" do
    expect(subject.journey_history).to be_empty
  end

  it "should capture a journey on touching in and touching out" do
    subject.enter(entry_station)
    subject.leave(exit_station)
    expect(subject.journey_history).to include("entry_station" => [entry_station.name, entry_station.zone],
    "exit_station" => [exit_station.name, exit_station.zone] )
  end

  it "returns a penalty fare if no exit station given" do
    subject.leave(exit_station)
    expect(subject.fare).to eq Journey::PENALTY
  end

  it 'calculates a fare' do
    subject.enter(entry_station)
    subject.leave(exit_station)
    expect(subject.fare).to eq Journey::MIN_AMOUNT
  end

  it "knows if a journey is complete" do
    subject.enter(entry_station)
    subject.leave(exit_station)
    expect(subject.journey_complete?).to eq true
  end

end
