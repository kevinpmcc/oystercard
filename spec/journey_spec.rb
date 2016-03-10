require 'journey'

describe Journey do

  subject(:journey){ described_class.new }
  let(:station_in) { double(:Station) }
  let(:station_out) { double(:Station) }

  # describe "#initialize" do
  #
  # end

  describe "#start" do
    it "starts the journey" do
     journey.start(station_in)
     expect(journey.entry_station).to eq station_in
    end
  end

  describe "#end" do
    it "takes the exit_station" do
      journey.end station_out
      expect(journey.exit_station).to eq station_out
    end
  end

  describe "#complete?" do
    it "completes the journey" do
      journey.start(station_in)
      journey.end(station_out)
      expect(journey.complete?).to be true
    end
  end


  describe "#fare" do
    it "calculates the fare if journey is complete" do
      journey.start(station_in)
      journey.end(station_out)
      expect(journey.fare).to eq Journey::MIN_FARE
    end

    it "calculates the fare if journey is incomplete" do
      journey.start(station_in)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end


end
