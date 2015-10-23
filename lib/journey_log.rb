require_relative 'journey'

class JourneyLog

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
    add_journey if complete?
  end

  def outstanding_charges
    amount = jr.fare
    if jr.journey_complete? == false
      add_journey
    end
    amount
  end

  def complete?
    @jr.journey_complete?
  end

  private

  def current_journey
    jr.journey_complete? ? @jr = @journey_klass.new : @jr
  end

  def add_journey
    @journeys << @jr
    @jr = @journey_klass.new
  end
end
