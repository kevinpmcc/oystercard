require_relative 'journey'

class JourneyLog

	attr_reader :journeys

	def initialize(journey_class=Journey)
		@journey_class = journey_class
		@journeys = []
	end

	def start(at_station)
		my_journey = @journey_class.new
    	my_journey.start_at(at_station)
    	@journeys << my_journey
	end

	def finish(at_station)
		current_journey.end_at(at_station)
	end

	private

	def current_journey
		if @journeys.empty? || @journeys.last.exit_station
			@journeys << @journey_class.new
		end
		@journeys.last
	end

end
