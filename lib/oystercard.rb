require_relative 'station'

class Oystercard

  MAX_AMOUNT = 90
  MIN_AMOUNT = 1
  attr_reader :balance, :in_use, :entry_station, :exit_station, :journey_history

  def initialize(balance=0)
    @balance = balance
    @entry_station = nil
    @journey_history = {}
  end

  def top_up(value)
    raise "Balance exceeds #{MAX_AMOUNT}" if value + balance > MAX_AMOUNT
    @balance+= value
  end

  def in_journey?
    entry_station != nil ? true : false
  end

  def touch_in(station)
    raise "You need to top up" unless balance >= MIN_AMOUNT
    @entry_station = station
    @journey_history["entry_station"] = station
  end

  def touch_out(station)
    deduct(MIN_AMOUNT)
    @entry_station = nil
    @exit_station = station
    @journey_history["exit_station"] = station
  end

  private
  def deduct(value)
    @balance -= value
  end

end
