class Oystercard
  attr_reader :balance, :history

  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize(journey_klass: Journey)
    @balance = 0
    @history = [] 
    @journey_class = journey_klass
    @journey, @station = nil
  end

  def top_up(amount)
    error_message = "Top up exceeds the maximum balance of #{MAX_BALANCE}"
    raise error_message if exceeds_max_balance?(amount)
    @balance += amount
  end

  def touch_in(station)
    sufficent_funds?
    create_journey(station)
    @history << @journey
    deduct(@journey.fare) if in_journey?
    @station = station
  end

  def touch_out(station)
    create_journey
    @journey.end(station)
    deduct(@journey.fare)
    complete
  end

  private

  def in_journey?
    @history.last.complete?
  end

  def create_journey(station=nil)
      @journey ||= @journey_class.new(station)
  end


  def deduct(amount)
    @balance -= amount
  end

  def sufficent_funds?
    message = 'Not enough funds'
    raise message if @balance < MIN_FARE
  end

  # def complete
  #   @history << @journey if @journey
  #   @station, @journey = nil
  # end

  def exceeds_max_balance?(amount)
    balance + amount > MAX_BALANCE
  end
end
