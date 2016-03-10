require_relative 'journey'

class JourneyLog

	attr_reader :journeys

	def initialize(journey_class=Journey)
		@journey_class = journey_class
		@journeys = []
	end

	def start(at_station)
		current_journey = @journey_class.new
    	current_journey.start_at(at_station)
    	@journeys << current_journey
	end

	def finish(at_station)
		current_journey.end_at(at_station)
	end

	private

	def current_journey
		if @journeys.last.entry_station
			@journeys.last
		end

	end

end
