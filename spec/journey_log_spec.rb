require 'journey_log'
describe JourneyLog do

  subject(:journeylog) { described_class.new(journey_klass: journey_class) }
  let(:journey_class) { double(:journey_class) }
  let(:journey) { double(:journey) }
  let(:station_in) { double(:station_in)}

  # describe '#initialize' do
  #   it 'initialises with a factory' do
  #     allow(:journey_class).to receive(:new)
  #     expect()
  # end

  describe '#start' do
    it "creates an instance of journey" do
      allow(journey_class).to receive(:new).with(station_in)
      expect(journey_class).to receive(:new).with(station_in)
      journeylog.start(station_in)
    end
  end

  describe "#current_journey" do

    it "creates a new journey when previous journey has exit_station" do
      allow(journeylog).to receive(:has_exit_station?){true}
      expect(journey_class).to receive(:new)
      journeylog.current_journey
    end

    
  end
end
