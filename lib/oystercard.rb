require_relative 'station'
require_relative 'journey_log'

class Oystercard

  MAX_AMOUNT = 90
  MIN_AMOUNT = 1
  PENALTY = 6
  attr_reader :balance, :journey

  def initialize(journey_log_klass= JourneyLog)
    @balance = 0
    @journey_log_klass = journey_log_klass
    @journey = @journey_log_klass.new
  end

  def top_up(value)
    raise "Balance exceeds #{MAX_AMOUNT}" if value + balance > MAX_AMOUNT
    @balance+= value
  end

  def touch_in(station)
    raise "You need to top up" unless balance >= MIN_AMOUNT
    deduct unless journey.complete?
    journey.start_journey(station)
  end

  def touch_out(station)
    @journey.exit_journey(station)
    deduct
  end

  private
  def deduct
    @balance -= journey.outstanding_charges
  end

end
