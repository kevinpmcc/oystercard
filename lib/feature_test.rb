require 'pry'
require './lib/journey.rb'
require './lib/oystercard.rb'
card = Oystercard.new
card.top_up(19)
card.balance
card.touch_in("Station2")
card.touch_out("statgss")
card.balance
binding.pry
card.touch_in("Another")
card.touch_in("Station1")
card.balance
