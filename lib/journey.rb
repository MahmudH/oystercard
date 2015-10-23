class Journey

  attr_reader :journey, :entry_station, :exit_station

  MIN_AMOUNT = 1
  PENALTY = 6

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def enter station
    @entry_station = station
  end

  def leave station
    @exit_station = station
  end

  def journey_complete?
    (entry_station.nil? && exit_station.nil?) || (!!entry_station && !!exit_station)
  end

  def fare
    journey_complete? ? MIN_AMOUNT : PENALTY
  end

end
