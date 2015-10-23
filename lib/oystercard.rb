require_relative 'station'
require_relative 'journey'

class Oystercard

  MAX_AMOUNT = 90
  MIN_AMOUNT = 1
  PENALTY = 6
  attr_reader :balance, :in_use, :journey

  def initialize(balance=0)
    @balance = balance + 1
    @journey = Journey.new
  end

  def top_up(value)
    raise "Balance exceeds #{MAX_AMOUNT}" if value + balance > MAX_AMOUNT
    @balance+= value
  end

  def in_journey?
    in_use
  end

  def touch_in(station)
    raise "You need to top up" unless balance >= MIN_AMOUNT
    @in_use = true
    journey.enter(station)
  end

  def touch_out(station)
    @journey.leave(station)
    deduct(journey.fare)
    @in_use = false
  end

  private
  def deduct(value)
    @balance -= value
  end

end
