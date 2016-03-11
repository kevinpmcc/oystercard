class Journey

  attr_reader :entry_station, :exit_station, :fare

  MIN_FARE = 1
  PENALTY_FARE = 6


  def initialize(entry_station=nil)
    @entry_station = entry_station
    @exit_station = nil
  end

  # def start(station)
  #   @entry_station = station
  # end

  def end(station)
    @exit_station = station
  end


  def complete?
    @entry_station && @exit_station ? true : false
  end

  def fare
    return PENALTY_FARE unless complete?
    MIN_FARE
  end

  def exit_station?
    !!@exit_station
  end
end
