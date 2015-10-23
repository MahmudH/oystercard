require_relative 'journey'

class Journey_log

  def initialize(journey_klass= Journey)
    @journey_klass = journey_klass
    @journeys = []
  end

  def start_journey(station)
    @journey_klass.enter(station)
  end

  def exit_journey(station)
    @journey_klass.leave(station)
    journeys << @journey_klass.journey
  end
end
