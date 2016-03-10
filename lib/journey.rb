class Journey

  PENALTY_FARE = 6
  MIN_FARE = 1
  attr_reader :entry_station, :exit_station

  def initialize
    @entry_station = nil
    @exit_station = nil
  end
  
  def start(at_station)
      set_entry_station(at_station)
  end

  def end(at_station)
    set_exit_station(at_station)
  end

  def fare
    !entry_station || !exit_station ? PENALTY_FARE : MIN_FARE
  end

private
   
  def set_exit_station(exit_station)
    @exit_station = exit_station
  end

  def set_entry_station(entry_station)
    @entry_station = entry_station
  end
  
end

