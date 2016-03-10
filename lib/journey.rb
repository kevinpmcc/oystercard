class Journey

  PENALTY_FARE = 6
  MIN_FARE = 1
  attr_reader :entry_station, :exit_station

  def initialize
    @entry_station = nil
    @exit_station = nil
  end
  
  def start_journey(entry_station)
      set_entry_station(entry_station)
  end

  def end_journey(exit_station)
    set_exit_station(exit_station)
  end

  def fare
    !entry_station || !exit_station ? PENALTY_FARE : MIN_FARE
  end

private
   
  def set_exit_station(exit_station)
    @exit_station = exit_station
   # in_journey = false
  end

  def set_entry_station(entry_station)
    @entry_station = entry_station
   # in_journey = true
  end
  
end
    #set journey full journey with current @entry_station
    #
    #set @entry_station to nil
    #call start_journey(entry_journey)
 
