class Journey
  attr_reader :journey_history

  MIN_AMOUNT = 1
  PENALTY = 6

  def initialize
    @journey_history = {}
  end

  def enter station
    @journey_history["entry_station"] = [station.name, station.zone]
  end

  def leave station
    @journey_history["exit_station"] = [station.name, station.zone]
  end

  def journey_complete?
    journey_history.count == 2
  end

  def fare
    journey_complete? ? MIN_AMOUNT : PENALTY
  end
end
