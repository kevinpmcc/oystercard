require 'journey'

describe Journey do

  subject(:journey){ described_class.new station_in }
  let(:station_in) { double(:Station, zone: 1) }
  let(:station_out) { double(:Station, zone: 3) }

  describe "#end" do
    it "takes the exit_station" do
      journey.end_journey station_out
      expect(journey.exit_station).to eq station_out
    end
  end

  describe "#complete?" do
    it "completes the journey" do
      journey.end_journey(station_out)
      expect(journey.complete?).to be true
    end
  end

  describe "#fare" do
    it "calculates the fare if journey is complete" do
      journey.end_journey(station_out)
      expect(journey.fare).to eq 3
    end

    it "calculates the fare if journey is incomplete" do
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end
end
