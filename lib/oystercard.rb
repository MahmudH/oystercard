require_relative 'station'

class Oystercard

  MAX_AMOUNT = 90
  MIN_AMOUNT = 1
  attr_reader :balance, :in_use, :entry_station

  def initialize(balance=0)
    @balance = balance
    @entry_station = nil
  end

  def top_up value
    raise "Balance exceeds #{MAX_AMOUNT}" if value + balance > MAX_AMOUNT
    @balance+= value
  end

  def in_journey?
    entry_station != nil ? true : false
  end

  def touch_in station
    raise "You need to top up" unless balance >= MIN_AMOUNT
    @entry_station = station
  end

  def touch_out
    deduct(MIN_AMOUNT)
    @entry_station = nil
  end

  private
  def deduct value
    @balance -= value
  end

end
