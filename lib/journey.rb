class Journey

  attr_reader :entry_station, :exit_station, :fare

  MIN_FARE = 1
  PENALTY_FARE = 6


  def initialize

  end

  def start(station)
    @entry_station = station
  end

  def end(station)
    @exit_station = station
  end

  def complete?
    !!(@entry_station && @exit_station)
  end

  def fare
    if complete?
      MIN_FARE
    else
      PENALTY_FARE
    end
  end
end
