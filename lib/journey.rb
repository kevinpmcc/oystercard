class Journey

  MIN_FARE = 1

  def initialize(entry_station: nil, exit_station: nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end
  
  def start_journey(entry_station)
    penalise(entry_station) if @entry_station  
  end


  def penalise_start_journey???????
    #log the full journey with current @entry_station
    #
    #set @entry_station to nil
    #call start_journey(entry_journey)
