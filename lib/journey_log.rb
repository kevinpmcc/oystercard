class JourneyLog

  def initialize(journey_klass: Journey)
    @journey_class = journey_klass
    @history = []
    @journey = nil
  end

  def start(station)
  @journey = @journey_class.new(station)
  @history << @journey
  end

  def current_journey
    @history << @journey_class.new if has_exit_station?
    last_journey
  end
  
  def finish(station)
    current_journey.end_journey(station)
  end

  private

  def empty_history?
    @history.empty?
  end

  def has_exit_station?
    empty_history? || last_journey.exit_station?
  end

  def last_journey
    @history.last
  end
end
