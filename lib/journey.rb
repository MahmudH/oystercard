class Journey

  attr_reader :journey, :journey_log

  MIN_AMOUNT = 1
  PENALTY = 6

  def initialize
    @journey = {}
  end

  def enter station
    @journey[:entry_station] = [station.name, station.zone]
    # @journey_log = Journey_log.new
  end

  def leave station
    @journey[:exit_station] = [station.name, station.zone]
    #@journey_log << @journey
  end

  def journey_complete?
    (journey[:entry_station].nil? && journey[:exit_station].nil?) || (!!journey[:entry_station] && !!journey[:exit_station])
  end

  def fare
    journey_complete? ? MIN_AMOUNT : PENALTY
  end
end
