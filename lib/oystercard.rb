class Oystercard

  attr_reader :balance, :entry_station, :journeys
  CARD_LIMIT = 90
  MAX_LIMIT_ERROR = "Balance would be above card limit"
  MIN_BAL_ERROR = "Balance is below minimum fare"

  def initialize(journey=Journey.new)
    @balance = 0
    @entry_station = nil
    @journeys = []
  end

  def top_up(amount)
    raise MAX_LIMIT_ERROR if balance + amount > CARD_LIMIT
    @balance += amount
  end

  def touch_in(station)
    raise MIN_BAL_ERROR if balance < MIN_FARE
    @entry_station = station
  end

  def touch_out(exit_station)
    deduct(MIN_FARE)
    @journeys << { entry_station => exit_station }
   # pass entry_station and station into a hashi
    @entry_station = nil
   
  end

  def in_journey?
    !!entry_station
  end


private

  def deduct(amount)
    @balance -= amount
  end

end
