require 'journeylog'

describe JourneyLog do 

subject(:journeylog) { described_class.new }
let(:entry_station) { double :station }
let(:exit_station)  { double :station }

	describe '#start' do

		it 'creates a journey and add it to journey' do
			expect{ journeylog.start(entry_station) }.to change{ journeylog.journeys.size }.by 1
		end
	end

	describe '#finish' do

		it 'when a journey has started and then finishes it doesn\'t create a new journey' do
			journeylog.start(entry_station)
			expect{ journeylog.finish(exit_station)}.not_to change{journeylog.journeys.size }
		end

		it 'with a brand new oystercard, when a journey has not started, then finish creates a new journey' do
			expect{ journeylog.finish(exit_station)}.to change{journeylog.journeys.size }.by 1
		end

		it 'when a journey has been completed and then the next finish, creates a new journey' do
			journeylog.start(entry_station)
			journeylog.finish(exit_station)
			expect{ journeylog.finish(exit_station)}.to change{journeylog.journeys.size }.by 1
		end
	end
end