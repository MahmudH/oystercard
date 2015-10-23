require_relative 'journey'

class Journey_log

  attr_reader :jr

  def initialize(journey_klass= Journey)
    @journey_klass = journey_klass
    @jr = @journey_klass.new
    @journeys = []
  end

  def start_journey(station)
    current_journey
    @jr.enter(station)
  end

  def exit_journey(station)
    @jr.leave(station)
    add_journey
  end

  private

  def current_journey
    jr.journey_complete? ? @jr = @journey_klass.new : @jr
  end

  def add_journey
    @journeys << @jr
  end
end
