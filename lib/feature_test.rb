require 'pry'
require './lib/oystercard'
require './lib/station'

station1 = Station.new "Waterloo", 1
station2 = Station.new "Holloway Road", 2
station3 = Station.new "Seven Sisters", 3
station4 = Station.new "Richmond", 4
station5 = Station.new "Heathrow", 5

 oyster = Oystercard.new
 "balance"
 oyster.balance
 "topup90"
 oyster.top_up(90)
 "touchin"
 binding.pry
 oyster.touch_in(station1)
 oyster.touch_out(station2)
 binding.pry
#p oyster.journey_history

