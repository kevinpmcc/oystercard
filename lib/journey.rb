require_relative 'station'
class Journey

  PENALTY_FARE = 6
  MIN_FARE = 1
  ZONE_FARE = 1

  attr_reader :entry_station, :exit_station

  def initialize
    @entry_station = nil
    @exit_station = nil
  end
  
  def start_at(station)
      set_entry_station(station)
  end

  def end_at(station)
    set_exit_station(station)
  end

  def fare
    !entry_station || !exit_station ? PENALTY_FARE : calculate_fare
  end

   
  def set_exit_station(exit_station)
    @exit_station = exit_station
  end

  def set_entry_station(entry_station)
    @entry_station = entry_station
  end
  
    
  def calculate_fare
    ZONE_FARE * ((entry_station.zone - exit_station.zone).abs) + 1
  end

end

