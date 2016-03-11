require 'journey_log'
describe JourneyLog do

  subject(:journeylog) { described_class.new(journey_klass: journey_class) }
  let(:journey_class) { double(:journey_class) }
  let(:journey) { double(:journey) }
  let(:station_in) { double(:station_in) }
  let(:station_out) { double(:station_out) }

  describe '#start' do
    it "creates an instance of journey" do
      allow(journey_class).to receive(:new).with(station_in)
      expect(journey_class).to receive(:new).with(station_in)
      journeylog.start(station_in)
    end
  end

  describe "#current_journey" do
    it "creates a new journey when there is no current journey" do
      allow(journeylog).to receive(:has_exit_station?){ true }
      expect(journey_class).to receive(:new)
      journeylog.current_journey
    end

    it "records the journey" do
      allow(journey_class).to receive(:new).with(station_in).and_return(journey)
      journeylog.start(station_in)
      expect(journeylog.journeys).to include journey
    end

    it "returns the current journey when incomplete" do
      allow(journey).to receive(:exit_station?){ false }
      allow(journey_class).to receive(:new)
      allow(journeylog).to receive(:last_journey){ journey }
      journeylog.start(station_in)
      expect(journeylog.current_journey).to eq journey
    end
  end

  describe "#finish" do
    it "will call finish on the object returned from current_station" do
      allow(journeylog).to receive(:current_journey){ journey }
      expect(journey).to receive(:end_journey).with(station_out)
      journeylog.finish(station_out)
    end
  end
end
