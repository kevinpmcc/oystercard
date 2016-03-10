class Oystercard
  attr_reader :balance, :history, :journey_class

  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize(journey_klass: Journey)
    @balance = 0
    @history = []
    # @journey_class = journey_klass
    @journey_klass = journey_klass
    @journey = nil
    @station = nil
  end

  def top_up(amount)
    error_message = "Top up exceeds the maximum balance of #{MAX_BALANCE}"
    raise error_message if exceeds_max_balance?(amount)
    @balance += amount
  end

  def touch_in(station)
    sufficent_funds?
    create_journey(station)
    deduct(@journey.fare) if in_journey?
    @station = station
  end

  def touch_out(station)
    create_journey(station)
    @journey.end(station)
    deduct(@journey.fare)
    complete
  end

  private

  def in_journey?
    !!@station
  end

  def create_journey(station)
      @journey ||= @journey_klass.new(station)
  end


  def deduct(amount)
    @balance -= amount
  end

  def sufficent_funds?
    message = 'Not enough funds'
    raise message if @balance < MIN_FARE
  end

  def complete
    @history << @journey
    @station = nil
    @journey = nil
  end

  def exceeds_max_balance?(amount)
    balance + amount > MAX_BALANCE
  end

  # def log_journey station
  #   @history << { entry_station: @entry_station, exit_station: station }
  # end
end
