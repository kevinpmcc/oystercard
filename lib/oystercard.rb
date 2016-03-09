require_relative 'journey'

class Oystercard

  attr_reader :balance, :entry_station, :journeys
  PENALTY_FARE = 6
  CARD_LIMIT = 90
  MAX_LIMIT_ERROR = "Balance would be above card limit"
  MIN_BAL_ERROR = "Balance is below minimum fare"

  def initialize(journey=Journey)
    @journey = journey
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journeys = []
  end

  def top_up(amount)
    raise MAX_LIMIT_ERROR if balance + amount > CARD_LIMIT
    @balance += amount
  end

  def touch_in(station)
    @journey.start_journey(station)
    raise MIN_BAL_ERROR if balance < Journey::MIN_FARE
    
    penalise if @entry_station  
    @entry_station = station
    @exit_station = nil
  end

  def touch_out(exit_station)
    if @exit_station 
      set_exit_station(exit_station)
      return penalise
    else
      deduct(@min_fare)
    end
    set_exit_station(exit_station)
    set_journey
    @entry_station = nil
   
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
