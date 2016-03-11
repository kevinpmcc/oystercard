class Oystercard
  attr_reader :balance

  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize(journey_log_klass: JourneyLog)
    @balance = 0
    @journey_log = journey_log_klass.new
  end

  def top_up(amount)
    error_message = "Top up exceeds the maximum balance of #{MAX_BALANCE}"
    raise error_message if exceeds_max_balance?(amount)
    @balance += amount
  end

  def touch_in(station)
    sufficent_funds?
    deduct (calculate_fare) if no_exit_station?
    @journey_log.start(station)
  end

  def touch_out(station)
    @journey_log.finish(station)
    deduct(calculate_fare)
  end

  def history
    @journey_log.journeys
  end

  private

  def no_exit_station?
    @journey_log.no_exit_station?
  end

  def calculate_fare
    @journey_log.last_journey.fare
  end

  def deduct(amount)
    @balance -= amount
  end

  def sufficent_funds?
    message = 'Not enough funds'
    raise message if @balance < MIN_FARE
  end

  def exceeds_max_balance?(amount)
    balance + amount > MAX_BALANCE
  end
end
