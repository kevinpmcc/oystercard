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
			expect{ journeylog.finish(exit)}.not_to change{journeylog.journeys.size }
		end

		it 'when a journey has not started, then finis creates a new journey' do
			expect{ journeylog.finish(exit)}.to change{journeylog.journeys.size }.by 1
		end
		
	end
end