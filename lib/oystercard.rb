require_relative 'station'
require_relative 'journey'

class Oystercard

  MAX_AMOUNT = 90
  MIN_AMOUNT = 1
  PENALTY = 6
  attr_reader :balance, :journey

  def initialize(balance=0)
    @balance = balance
    @journey = Journey.new
  end

  def top_up(value)
    raise "Balance exceeds #{MAX_AMOUNT}" if value + balance > MAX_AMOUNT
    @balance+= value
  end

  def touch_in(station)
    raise "You need to top up" unless balance >= MIN_AMOUNT
    deduct unless journey.journey_complete?
    journey.enter(station)
  end

  def touch_out(station)
    @journey.leave(station)
    deduct
  end

  private
  def deduct
    @balance -= journey.fare
  end

end
