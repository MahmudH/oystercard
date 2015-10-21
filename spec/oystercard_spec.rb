require 'oystercard'

describe Oystercard do

  let(:station) {double :station}

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

  it "should not be in use" do
    expect(subject.in_journey?).to be_falsey
  end

  it "should be in use if touched in" do
    subject.top_up(5)
    subject.touch_in(station)
    expect(subject).to be_in_journey
  end

  it "should not be in use if touched out" do
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it "should not allow to touch in when balance less than 1" do
    expect { subject.touch_in(station) }.to raise_error ("You need to top up")
  end


  it "should change balance on touch out" do
    subject.top_up(10)
    subject.touch_in(station)
    expect { subject.touch_out }.to change { subject.balance }.by(-Oystercard::MIN_AMOUNT)
  end

  describe '#touch_in' do
    it 'should return station' do
      subject.top_up(10)
      expect(subject.touch_in(station)).to eq station
    end
  end

end
