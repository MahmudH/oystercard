require 'oystercard'

describe Oystercard do

  let(:entry_station) {double :station, name: :bethnal_green, zone: 2}
  let(:exit_station) {double :station, name: :archway, zone: 3}

  it "should start with a balance of zero" do
    expect(subject.balance).to eq 0
  end

  it "balance should increase when top up method is called" do
    subject.top_up 10
    expect(subject.balance).to eq 10
  end

  it "should raise an error if balance exceeds maximum" do
    subject.top_up(1)
    expect {subject.top_up(Oystercard::MAX_AMOUNT)}.to raise_error ("Balance exceeds #{Oystercard::MAX_AMOUNT}")
  end

  it "should not allow to touch in when balance less than 1" do
    expect { subject.touch_in(entry_station) }.to raise_error ("You need to top up")
  end

  it "should change balance on touch out" do
    subject.top_up(10)
    subject.touch_in(entry_station)
    expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-Oystercard::MIN_AMOUNT)
  end

  describe '#touch_in' do
    it 'should return station' do
      subject.top_up(10)
      expect(subject.touch_in(entry_station)).to eq [entry_station.name, entry_station.zone]
    end
  end

  it 'penalty charge deducted from card if journey incomplete' do
    expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-Oystercard::PENALTY)
  end

end
