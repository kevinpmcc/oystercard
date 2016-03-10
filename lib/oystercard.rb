require_relative 'journey'
require_relative 'station'

class Oystercard

  attr_reader :balance, :journeys
  CARD_LIMIT = 90
  MAX_LIMIT_ERROR = "Balance would be above card limit of £#{CARD_LIMIT}."
  MIN_BAL_ERROR = "Balance is below minimum fare."

  def initialize(journey=Journey)
    @journey = journey
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    raise MAX_LIMIT_ERROR if balance + amount > CARD_LIMIT
    @balance += amount
  end

  def touch_in(station)
    raise MIN_BAL_ERROR if balance < Journey::MIN_FARE 
    current_journey = @journey.new
    current_journey.start_journey(station)
    @journeys << current_journey
  end

  def touch_out(exit_station)
    if !in_journey?
      current_journey = @journey.new
      @journeys << current_journey
    end
    @journeys[-1].end_journey(exit_station) 
  end

  def in_journey?
    !!entry_station
  end


private

  def deduct(amount)
    @balance -= amount
  end
  
  def penalise
    p @entry_station
    set_journey
    deduct(PENALTY_FARE)
  end

  def set_journey
    p @entry_station
    @journeys << { @entry_station => @exit_station }
  end

  def set_exit_station(exit_station)
    @exit_station = exit_station
  end
end
