class Journey

  PENALTY_FARE = 6
  MIN_FARE = 1
  attr_reader :entry_station, :exit_station, :journey_fare

  def initialize(entry_station: nil, exit_station: nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end
  
  def start_journey(entry_station)
    if @entry_station
      penalise_start_journey(entry_station)  
    else 
      set_entry_station(entry_station)
    end
  end

  def end_journey(exit_station)
    set_exit_station(exit_station)
  end

private
  def set_journey
    { entry_station: entry_station, exit_station: exit_station}
    @journey_fare
  #  oystercard.deduct(@journey_fare)
  end
   
  def set_exit_station(exit_station)
    @exit_station = exit_station
    in_journey = false
  end

  def set_entry_station(entry_station)
    @entry_station = entry_station
    in_journey = true
  end
  
  def penalise_start_journey(entry_station)
    @journey_fare += PENALTY_FARE
    set_journey
    Journey.new(entry_station: entry_station)
  end

end
    #set journey full journey with current @entry_station
    #
    #set @entry_station to nil
    #call start_journey(entry_journey)
 
