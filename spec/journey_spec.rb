require 'journey'

describe Journey do
  subject(:journey) { described_class.new }  

  describe '#start_journey' do
    
    it 'will store the entry_station given' do
      journey.start("Bank")
      expect(journey.entry_station).to eq "Bank" 
    end
  
  end
  
  describe '#end_journey' do

    it 'will store the exit_station given' do
      journey.end("Euston")
      expect(journey.exit_station).to eq "Euston"
    end
  
  end
  describe '#fare' do
  
    it 'when journey is complete return MIN_FARE' do
      journey.start("Euston")
      journey.end("Bank")
      expect(journey.fare).to eq Journey::MIN_FARE
    end

    it 'when only exit station exists returns PENALTY_FARE' do
      journey.end("Bank")
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    it 'when only entry station exists returns PENALTY_FARE' do
      journey.start("Euston")
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  
  end

end



  
