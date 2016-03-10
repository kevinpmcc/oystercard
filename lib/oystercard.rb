

class Oystercard

  attr_reader :balance, :history

  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @history = []
    @current_journey = {}
  end

  def top_up(amount)
    error_message = "Top up exceeds the maximum balance of #{MAX_BALANCE}"
    raise error_message if exceeds_max_balance?(amount)
    @balance += amount
  end

  def touch_in(station)
    sufficent_funds?
    @entry_station = station
    @current_journey[:entry_station] = station
  end

  def in_journey?
    !!@entry_station
  end

  def touch_out(station)
    deduct MIN_FARE
    @current_journey[:exit_station] = station
    complete
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def sufficent_funds?
    message = "Not enough funds"
    raise message if @balance < MIN_FARE
  end

  def complete
    @history << @current_journey
    @current_journey = {}
  end

  def exceeds_max_balance?(amount)
    balance + amount > MAX_BALANCE
  end

  # def log_journey station
  #   @history << { entry_station: @entry_station, exit_station: station }
  # end
end
