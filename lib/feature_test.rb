require 'pry'
require './lib/journey.rb'
require './lib/oystercard.rb'
require './lib/journey_log.rb'
require './lib/station.rb'
card = Oystercard.new
aldgate = Station.new({name: "Algate", zone: 1})
woolwich = Station.new({name: "Woolwich", zone: 4})
richmond = Station.new({name: "Richmond", zone: 6})
card.top_up(50)
card.balance
card.touch_in(aldgate)
card.touch_out(woolwich)
card.balance
card.touch_out(richmond)
card.touch_in(aldgate)
card.touch_in(aldgate)
# card.touch_out("out")
# card.touch_out("out")
binding.pry
card.balance
